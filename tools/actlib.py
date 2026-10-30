import struct, numpy as np
from PIL import Image
def parse_act(path):
    d=open(path,'rb').read(); minor,major=d[2],d[3]; ver=major+minor/10
    n=struct.unpack('<H',d[4:6])[0]; o=16; acts=[]
    for a in range(n):
        fc=struct.unpack('<I',d[o:o+4])[0]; o+=4; frames=[]
        for f in range(fc):
            o+=32; sc=struct.unpack('<I',d[o:o+4])[0]; o+=4; layers=[]
            for s in range(sc):
                x,y,sp,fl=struct.unpack('<iiii',d[o:o+16]); o+=16; col=tuple(d[o:o+4]); o+=4
                xs=struct.unpack('<f',d[o:o+4])[0]; o+=4; ys=xs
                if ver>=2.4: ys=struct.unpack('<f',d[o:o+4])[0]; o+=4
                rot,typ=struct.unpack('<ii',d[o:o+8]); o+=8
                if ver>=2.5: o+=8
                layers.append(dict(x=x,y=y,spr=sp,mirror=fl,color=col,xs=xs,ys=ys,rot=rot,type=typ))
            ev=-1
            if ver>=2.0: ev=struct.unpack('<i',d[o:o+4])[0]; o+=4
            ap=[]
            if ver>=2.3:
                c=struct.unpack('<i',d[o:o+4])[0]; o+=4
                for _ in range(c): ap.append(struct.unpack('<4i',d[o:o+16])); o+=16
            frames.append(dict(layers=layers,event=ev,attach=ap))
        acts.append(frames)
    if ver>=2.1: sn=struct.unpack('<i',d[o:o+4])[0]; o+=4+sn*40
    iv=list(struct.unpack('<%df'%n,d[o:o+4*n])) if ver>=2.2 else []
    return acts,iv
def load_spr(path):
    d=open(path,'rb').read(); minor,major=d[2],d[3]; ver=major+minor/10
    n=struct.unpack('<H',d[4:6])[0]; o=6; rn=0
    if ver>=2.0: rn=struct.unpack('<H',d[o:o+2])[0]; o+=2
    pal_imgs=[]
    for i in range(n):
        w,h=struct.unpack('<HH',d[o:o+4]); o+=4
        if ver>=2.1:
            cs=struct.unpack('<H',d[o:o+2])[0]; o+=2; raw=d[o:o+cs]; o+=cs; out=bytearray(); j=0
            while j<len(raw):
                b=raw[j]; j+=1
                if b==0: out+=b'\x00'*raw[j]; j+=1
                else: out.append(b)
            data=bytes(out)
        else: data=d[o:o+w*h]; o+=w*h
        pal_imgs.append((w,h,data))
    rgba=[]
    for i in range(rn):
        w,h=struct.unpack('<HH',d[o:o+4]); o+=4; rgba.append((w,h,d[o:o+w*h*4])); o+=w*h*4
    pal=np.frombuffer(d[o:o+1024],np.uint8).reshape(256,4)
    def mk(i,typ=0):
        if typ==0:
            w,h,data=pal_imgs[i]; idx=np.frombuffer(data,np.uint8).reshape(h,w)
            return Image.fromarray(np.dstack([pal[idx][:,:,:3],np.where(idx==0,0,255).astype(np.uint8)]),'RGBA')
        w,h,data=rgba[i]; return Image.fromarray(np.frombuffer(data,np.uint8).reshape(h,w,4),'RGBA')
    return mk,len(pal_imgs),rn
