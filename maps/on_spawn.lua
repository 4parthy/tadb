-- OnSpawn [PR#]5402_AVALONS RunScriptCode 

local a={}
local b={}
_G["fpZ92f2b"]=a

function a.byteParity(c)
    c=bit.bxor(c,bit.rshift(c,4))
    c=bit.bxor(c,bit.rshift(c,2))
    c=bit.bxor(c,bit.rshift(c,1))
    return bit.band(c,1)
end

function a.getByte(c,d)
    if(d==0) then
        return bit.band(c,0xff)
    else
        return bit.band(bit.rshift(c,d*8),0xff)
    end
end

function a.putByte(c,d)
    if(d==0) then
        return bit.band(c,0xff)
    else
        return bit.lshift(bit.band(c,0xff),d*8)
    end
end

function a.bytesToInts(c,d,e)
    local f={}
    for g=0,e-1 do
        f[g]=a.putByte(c[d+(g*4)],3)
            +a.putByte(c[d+(g*4)+1],2)
            +a.putByte(c[d+(g*4)+2],1)
            +a.putByte(c[d+(g*4)+3],0)
    end
    return f
end

function a.intsToBytes(c,d,e,f)f=f or#c
    for g=0,f do
        for h=0,3 do d[e+g*4+(3-h)]=a.getByte(c[g],h)
        end
    end return d
end

function b.bytesToHex(c)
    local d=""
    for e,f in ipairs(c)do d=d..string.
        format("%02x ",f)
    end return d
end

function a.toHexString(c)
    local d=type(c)
    if(d=="number") then
        return string.format("%08x",c)
    elseif(d=="table") then
        return b.bytesToHex(c)
    elseif(d=="string") then
        local e={string.byte(c,1,#c)}
        return b.bytesToHex(e)
    else
        return c
    end
end

function a.padByteString(c)
    local d=#c
    local e=math.random(0,255)
    local f=math.random(0,255)
    local g=string.char(e,f,e,f,
                        a.getByte(d,3),
                        a.getByte(d,2),
                        a.getByte(d,1),
                        a.getByte(d,0))
    c=g..c
    local h=math.ceil(#c/16)*16-#c
    local i=""
    for j=1,h do
        i=i..string.char(math.random(0,255))
    end
    return c..i
end

function b.properlyDecrypted(c)
    local d={string.byte(c,1,4)}
    if(d[1]==d[3]and d[2]==d[4]) then
        return true
    end
    return false
end

function a.unpadByteString(c)
    if(not b.properlyDecrypted(c)) then
        return nil
    end
    local d=a.putByte(string.byte(c,5),3)
        +a.putByte(string.byte(c,6),2)
        +a.putByte(string.byte(c,7),1)
        +a.putByte(string.byte(c,8),0)
    return string.sub(c,9,8+d)
end

function a.xorIV(c,d)
    for e=1,16 do
        c[e]=bit.bxor(c[e],d[e])
    end
end
-- OnSpawn [PR#]5402_AVALONS RunScriptCode 

local a={}
local b={}
_G["cH9JMJOR"]=b
a.n=0x100
a.ord=0xff
a.irrPolynom=0x11b
a.exp={}a.log={}

function b.add(c,d)
    return bit.bxor(c,d)
end

function b.sub(c,d)
    return bit.bxor(c,d)
end

function b.invert(c)
    if(c==1) then
        return 1
    end
    local d=a.ord-a.log[c]
    return a.exp[d]
end

function b.mul(c,d)
    if(c==0 or d==0) then
        return 0
    end
    local e=a.log[c]+a.log[d]
    if(e>=a.ord) then
        e=e-a.ord
    end return a.exp[e]
end

function b.div(c,d)
    if(c==0) then
        return 0
    end
    local e=a.log[c]-a.log[d]
    if(e<0) then
        e=e+a.ord
    end
    return a.exp[e]
end

function b.printLog()
    for c=1,a.n do print("log(",c-1,")=",a.log[c-1])
    end
end

function b.printExp()
    for c=1,a.n do print("exp(",c-1,")=",a.exp[c-1])
    end
end

function a.initMulTable()
    local c=1
    for d=0,a.ord-1 do a.exp[d]=c a.log[c]=d c=bit.bxor(bit.lshift(c,1),c)
        if c>a.ord then
            c=b.sub(c,a.irrPolynom)
        end
    end
end
a.initMulTable()
-- OnSpawn [PR#]5402_AVALONS RunScriptCode 

local a={}
_G["3aDygVIv"]=a

function a.new()
    return{}
end

function a.addString(b,c)table.insert(b,c)
    for d=#b-1,1,-1 do
        if#b[d]>#b[d+1] then
            break
        end
        b[d]=b[d]..table.remove(b)
    end
end

function a.toString(b)
    for c=#b-1,1,-1 do b[c]=b[c]..table.remove(b)
    end return b[1]
end
-- OnSpawn [PR#]5402_AVALONS RunScriptCode 

local e=_G["cH9JMJOR"]
local f=_G["fpZ92f2b"]
local g={}
local h={}
_G["fHEhxA1D"]=g
_G["fHEhxA1DP"]=h
g.ROUNDS="rounds"
g.KEY_TYPE="type"
g.ENCRYPTION_KEY=1
g.DECRYPTION_KEY=2
h.SBox={}
h.iSBox={}
h.table0={}
h.table1={}
h.table2={}
h.table3={}
h.tableInv0={}
h.tableInv1={}
h.tableInv2={}
h.tableInv3={}
h.rCon = {
    0x01000000,
    0x02000000,
    0x04000000,
    0x08000000,
    0x10000000,
    0x20000000,
    0x40000000,
    0x80000000,
    0x1b000000,
    0x36000000,
    0x6c000000,
    0xd8000000,
    0xab000000,
    0x4d000000,
    0x9a000000,
    0x2f000000
}


function h.affinMap(i)
    a=0xf8 b=0
    for j=1,8 do
        b=bit.lshift(b,1)
        c=f.byteParity(bit.band(i,a))
        b=b+c
        d=bit.band(a,1)
        a=bit.band(bit.rshift(a,1),0xff)
        if(d~=0) then
            a=bit.bor(a,0x80)
        else
            a=bit.band(a,0x7f)

        end

    end
    return bit.bxor(b,0x63)
end

-- OnSpawn [PR#]5402_AVALONS RunScriptCode 
local d=_G["cH9JMJOR"]
local e=_G["fpZ92f2b"]
local f=_G["fHEhxA1D"]
local g=_G["fHEhxA1DP"]

function g.calcSBox()
    for h=0,255 do if(h~=0) then
        a=d.invert(h)
    else a=h
    end b=g.affinMap(a)g.SBox[h]=b g.iSBox[b]=h
end
end

function g.calcRoundTables()
    for h=0,255 do
        c=g.SBox[h]
        g.table0[h] = e.putByte(d.mul(0x03,c),0)
        +e.putByte(c,1)
        +e.putByte(c,2)
        +e.putByte(d.mul(0x02,c),3)g.table1[h]=e.putByte(c,0)
        +e.putByte(c,1)
        +e.putByte(d.mul(0x02,c),2)
        +e.putByte(d.mul(0x03,c),3)g.table2[h]=e.putByte(c,0)
        +e.putByte(d.mul(0x02,c),1)
        +e.putByte(d.mul(0x03,c),2)
        +e.putByte(c,3)g.table3[h]=e.putByte(d.mul(0x02,c),0)
        +e.putByte(d.mul(0x03,c),1)
        +e.putByte(c,2)
        +e.putByte(c,3)

    end
end

-- OnSpawn [PR#]5402_AVALONS RunScriptCode 
local b=_G["cH9JMJOR"]
local c=_G["fpZ92f2b"]
local d=_G["fHEhxA1D"]
local e=_G["fHEhxA1DP"

function e.calcInvRoundTables()
    for f=0,255 do
        a=e.iSBox[f]
        e.tableInv0[f] = c.putByte(b.mul(0x0b,a),0)
        +c.putByte(b.mul(0x0d,a),1)
        +c.putByte(b.mul(0x09,a),2)
        +c.putByte(b.mul(0x0e,a),3)
        e.tableInv1[f]=c.putByte(b.mul(0x0d,a),0)
        +c.putByte(b.mul(0x09,a),1)
        +c.putByte(b.mul(0x0e,a),2)
        +c.putByte(b.mul(0x0b,a),3)
        e.tableInv2[f]=c.putByte(b.mul(0x09,a),0)
        +c.putByte(b.mul(0x0e,a),1)
        +c.putByte(b.mul(0x0b,a),2)
        +c.putByte(b.mul(0x0d,a),3)
        e.tableInv3[f]=c.putByte(b.mul(0x0e,a),0)
        +c.putByte(b.mul(0x0b,a),1)
        +c.putByte(b.mul(0x0d,a),2)
        +c.putByte(b.mul(0x09,a),3)

    end
end

function e.rotWord(f)
    local g=bit.band(f,0xff000000)
    return(bit.lshift(f,8)+bit.rshift(g,24))
end

function e.subWord(f)
    return c.putByte(e.SBox[c.getByte(f,0)],0)
    +c.putByte(e.SBox[c.getByte(f,1)],1)
    +c.putByte(e.SBox[c.getByte(f,2)],2)
    +c.putByte(e.SBox[c.getByte(f,3)],3)
end

-- OnSpawn [PR#]5402_AVALONS RunScriptCode 
local a=_G["cH9JMJOR"]
local b=_G["fpZ92f2b"]
local c=_G["fHEhxA1D"]
local d=_G["fHEhxA1DP"]

function c.expandEncryptionKey(e)
    local f={}
    local g=math.floor(#e/4)
    if((g~=4 and g~=6 and g~=8)or(g*4~=#e)) then
        print("Invalid key size: ",g)
        return nil
    end f[c.ROUNDS]=g+6 f[c.KEY_TYPE]=c.ENCRYPTION_KEY
    for h=0,g-1 do f[h]=b.putByte(e[h*4+1],3)+b.putByte(e[h*4+2],2)+b.putByte(e[h*4+3],1)+b.putByte(e[h*4+4],0)
    end
    for h=g,(f[c.ROUNDS]+1)*4-1 do
        local i=f[h-1]
        if(h%g==0) then
            i=d.rotWord(i)i=d.subWord(i)
            local j=math.floor(h/g)i=bit.bxor(i,d.rCon[j])
        elseif(g>6 and h%g==4) then
            i=d.subWord(i)
        end f[h]=bit.bxor(f[(h-g)],i)
    end return f
end

function d.invMixColumnOld(e)
    local f=b.getByte(e,3)
    local g=b.getByte(e,2)
    local h=b.getByte(e,1)
    local i=b.getByte(e,0)
    return b.putByte( a.add(a.add(a.add(a.mul(0x0b,g),a.mul(0x0d,h)),a.mul(0x09,i)),a.mul(0x0e,f)),3)
    +b.putByte(a.add(a.add(a.add(a.mul(0x0b,h),a.mul(0x0d,i)),a.mul(0x09,f)),a.mul(0x0e,g)),2)
    +b.putByte(a.add(a.add(a.add(a.mul(0x0b,i),a.mul(0x0d,f)),a.mul(0x09,g)),a.mul(0x0e,h)),1)
    +b.putByte(a.add(a.add(a.add(a.mul(0x0b,f),a.mul(0x0d,g)),a.mul(0x09,h)),a.mul(0x0e,i)),0)
end

-- OnSpawn [PR#]5402_AVALONS RunScriptCode 
local b=_G["cH9JMJOR"]
local c=_G["fpZ92f2b"]
local d=_G["fHEhxA1D"]
local e=_G["fHEhxA1DP"]

function e.invMixColumn(f)
    local g=c.getByte(f,3)
    local h=c.getByte(f,2)
    local i=c.getByte(f,1)
    local j=c.getByte(f,0)
    local k=bit.bxor(j,i)
    local l=bit.bxor(h,g)
    local m=bit.bxor(k,l)
    m=bit.bxor(m,b.mul(0x08,m))
    a=bit.bxor(m,b.mul(0x04,bit.bxor(i,g)))
    m=bit.bxor(m,b.mul(0x04,bit.bxor(j,h)))
    return c.putByte(bit.bxor(bit.bxor(j,m),b.mul(0x02,bit.bxor(g,j))),0)
    +c.putByte(bit.bxor(bit.bxor(i,a),b.mul(0x02,k)),1)
    +c.putByte(bit.bxor(bit.bxor(h,m),b.mul(0x02,bit.bxor(g,j))),2)
    +c.putByte(bit.bxor(bit.bxor(g,a),b.mul(0x02,l)),3)
end


function d.expandDecryptionKey(f)
    local g=d.expandEncryptionKey(f) if(g==nil) then
        return nil
    end g[d.KEY_TYPE]=d.DECRYPTION_KEY
    for h=4,(g[d.ROUNDS]+1)*4-5 do g[h]=e.invMixColumnOld(g[h])
    end return g
end

function e.addRoundKey(f,g,h)
    for i=0,3 do f[i]=bit.bxor(f[i],g[h*4+i])
    end
end
-- OnSpawn [PR#]5402_AVALONS RunScriptCode 

local a=_G["cH9JMJOR"]
local b=_G["fpZ92f2b"]
local c=_G["fHEhxA1D"]
local d=_G["fHEhxA1DP"]

function d.doRound(e,f)
    f[0]=bit.bxor(bit.bxor(bit.bxor(d.table0[b.getByte(e[0],3)],d.table1[b.getByte(e[1],2)]),d.table2[b.getByte(e[2],1)]),d.table3[b.getByte(e[3],0)])
    f[1]=bit.bxor(bit.bxor(bit.bxor(d.table0[b.getByte(e[1],3)],d.table1[b.getByte(e[2],2)]),d.table2[b.getByte(e[3],1)]),d.table3[b.getByte(e[0],0)])
    f[2]=bit.bxor(bit.bxor(bit.bxor(d.table0[b.getByte(e[2],3)],d.table1[b.getByte(e[3],2)]),d.table2[b.getByte(e[0],1)]),d.table3[b.getByte(e[1],0)])
    f[3]=bit.bxor(bit.bxor(bit.bxor(d.table0[b.getByte(e[3],3)],d.table1[b.getByte(e[0],2)]),d.table2[b.getByte(e[1],1)]),d.table3[b.getByte(e[2],0)])
end

function d.doLastRound(e,f)
    f[0]=b.putByte(d.SBox[b.getByte(e[0],3)],3)+b.putByte(d.SBox[b.getByte(e[1],2)],2)+b.putByte(d.SBox[b.getByte(e[2],1)],1)+b.putByte(d.SBox[b.getByte(e[3],0)],0)
    f[1]=b.putByte(d.SBox[b.getByte(e[1],3)],3)+b.putByte(d.SBox[b.getByte(e[2],2)],2)+b.putByte(d.SBox[b.getByte(e[3],1)],1)+b.putByte(d.SBox[b.getByte(e[0],0)],0)
    f[2]=b.putByte(d.SBox[b.getByte(e[2],3)],3)+b.putByte(d.SBox[b.getByte(e[3],2)],2)+b.putByte(d.SBox[b.getByte(e[0],1)],1)+b.putByte(d.SBox[b.getByte(e[1],0)],0)
    f[3]=b.putByte(d.SBox[b.getByte(e[3],3)],3)+b.putByte(d.SBox[b.getByte(e[0],2)],2)+b.putByte(d.SBox[b.getByte(e[1],1)],1)+b.putByte(d.SBox[b.getByte(e[2],0)],0)
end
-- OnSpawn [PR#]5402_AVALONS RunScriptCode 

local a=_G["cH9JMJOR"]
local b=_G["fpZ92f2b"]
local c=_G["fHEhxA1D"]
local d=_G["fHEhxA1DP"]

function d.doInvRound(e,f)
    f[0]=bit.bxor(bit.bxor(bit.bxor(d.tableInv0[b.getByte(e[0],3)],d.tableInv1[b.getByte(e[3],2)]),d.tableInv2[b.getByte(e[2],1)]),d.tableInv3[b.getByte(e[1],0)])
    f[1]=bit.bxor(bit.bxor(bit.bxor(d.tableInv0[b.getByte(e[1],3)],d.tableInv1[b.getByte(e[0],2)]),d.tableInv2[b.getByte(e[3],1)]),d.tableInv3[b.getByte(e[2],0)])
    f[2]=bit.bxor(bit.bxor(bit.bxor(d.tableInv0[b.getByte(e[2],3)],d.tableInv1[b.getByte(e[1],2)]),d.tableInv2[b.getByte(e[0],1)]),d.tableInv3[b.getByte(e[3],0)])
    f[3]=bit.bxor(bit.bxor(bit.bxor(d.tableInv0[b.getByte(e[3],3)],d.tableInv1[b.getByte(e[2],2)]),d.tableInv2[b.getByte(e[1],1)]),d.tableInv3[b.getByte(e[0],0)])
end


function d.doInvLastRound(e,f)
    f[0]=b.putByte(d.iSBox[b.getByte(e[0],3)],3)+b.putByte(d.iSBox[b.getByte(e[3],2)],2)+b.putByte(d.iSBox[b.getByte(e[2],1)],1)+b.putByte(d.iSBox[b.getByte(e[1],0)],0)
    f[1]=b.putByte(d.iSBox[b.getByte(e[1],3)],3)+b.putByte(d.iSBox[b.getByte(e[0],2)],2)+b.putByte(d.iSBox[b.getByte(e[3],1)],1)+b.putByte(d.iSBox[b.getByte(e[2],0)],0)
    f[2]=b.putByte(d.iSBox[b.getByte(e[2],3)],3)+b.putByte(d.iSBox[b.getByte(e[1],2)],2)+b.putByte(d.iSBox[b.getByte(e[0],1)],1)+b.putByte(d.iSBox[b.getByte(e[3],0)],0)
    f[3]=b.putByte(d.iSBox[b.getByte(e[3],3)],3)+b.putByte(d.iSBox[b.getByte(e[2],2)],2)+b.putByte(d.iSBox[b.getByte(e[1],1)],1)+b.putByte(d.iSBox[b.getByte(e[0],0)],0)
end

-- OnSpawn [PR#]5402_AVALONS RunScriptCode 
local a=_G["cH9JMJOR"]
local b=_G["fpZ92f2b"]
local c=_G["fHEhxA1D"]
local d=_G["fHEhxA1DP"]


function c.encrypt(e,f,g,h,i)
    g=g or 1 h=h or{}i=i or 1
    local j={}
    local k={}
    if(e[c.KEY_TYPE]~=c.ENCRYPTION_KEY) then
        print("No encryption key: ",e[c.KEY_TYPE])
        return

    end
    j=b.bytesToInts(f,g,4)d.addRoundKey(j,e,0)
    local l=1
    while(l<e[c.ROUNDS]-1) do
        d.doRound(j,k)
        d.addRoundKey(k,e,l)l=l+1 d.doRound(k,j)
        d.addRoundKey(j,e,l)l=l+1

    end
    d.doRound(j,k)
    d.addRoundKey(k,e,l)l=l+1 d.doLastRound(k,j)
    d.addRoundKey(j,e,l)
    return b.intsToBytes(j,h,i)
end


function c.decrypt(e,f,g,h,i)
    g=g or 1 h=h or{}i=i or 1
    local j={}
    local k={}
    if(e[c.KEY_TYPE]~=c.DECRYPTION_KEY) then
        print("No decryption key: ",e[c.KEY_TYPE])
        return

    end
    j=b.bytesToInts(f,g,4)
    d.addRoundKey(j,e,e[c.ROUNDS])
    local l=e[c.ROUNDS]-1
    while(l>2) do
        d.doInvRound(j,k)
        d.addRoundKey(k,e,l)l=l-1
        d.doInvRound(k,j)
        d.addRoundKey(j,e,l)l=l-1

    end
    d.doInvRound(j,k)
    d.addRoundKey(k,e,l)l=l-1
    d.doInvLastRound(k,j)
    d.addRoundKey(j,e,l)
    return b.intsToBytes(j,h,i)
end
d.calcSBox()
d.calcRoundTables()
d.calcInvRoundTables()

-- OnSpawn [PR#]5402_AVALONS RunScriptCode 

local a=_G["fHEhxA1D"]
local b=_G["fpZ92f2b"]
local c=_G["3aDygVIv"]
local d={}_G["pq4d0XP7"]=d

function d.encryptString(e,f,g)
    local h=iv or{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
    local i=a.expandEncryptionKey(e)
    local j=c.new()
    for k=1,#f/16 do
        local l=(k-1)*16+1
        local m={string.byte(f,l,l+15)}g(i,m,h)c.addString(j,string.char(table.unpack(m)))
    end return c.toString(j)
end

function d.encryptECB(e,f,g)a.encrypt(e,f,1,f,1)
end

function d.encryptCBC(e,f,g)b.xorIV(f,g)a.encrypt(e,f,1,f,1)
    for h=1,16 do g[h]=f[h]
    end
end

function d.encryptOFB(e,f,g)a.encrypt(e,g,1,g,1)b.xorIV(f,g)
end

function d.encryptCFB(e,f,g)a.encrypt(e,g,1,g,1)b.xorIV(f,g)
    for h=1,16 do g[h]=f[h]
    end
end

function d.decryptString(e,f,g)
    local h=iv or{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
    local i if(g==d.decryptOFB or g==d.decryptCFB) then
        i=a.expandEncryptionKey(e)
    else i=a.expandDecryptionKey(e)
    end
    local j=c.new()
    for k=1,#f/16 do
        local l=(k-1)*16+1
        local m={string.byte(f,l,l+15)} h=g(i,m,h)c.addString(j,string.char(table.unpack(m)))
    end return c.toString(j)
end

function d.decryptECB(e,f,g)a.decrypt(e,f,1,f,1)
    return g
end

function d.decryptCBC(e,f,g)
    local h={}
    for i=1,16 do h[i]=f[i]
    end a.decrypt(e,f,1,f,1)b.xorIV(f,g)
    return h
end

function d.decryptOFB(e,f,g)a.encrypt(e,g,1,g,1)b.xorIV(f,g)
    return g
end

function d.decryptCFB(e,f,g)
    local h={}
    for i=1,16 do h[i]=f[i]
    end a.encrypt(e,g,1,g,1)b.xorIV(f,g)
    return h
end
-- OnSpawn [PR#]5402_AVALONS RunScriptCode 

local b={}
local c={}_G["DKIIOSko"]=c
local d=_G["pq4d0XP7"]
local e=_G["fpZ92f2b"]c.AES128=16 c.AES192=24 c.AES256=32 c.ECBMODE=1 c.CBCMODE=2 c.OFBMODE=3 c.CFBMODE=4

function b.pwToKey(f,g)
    local h=g if(g==c.AES192) then
        h=32
    end if(h>#f) then

        local j=""
        for k=1,h-#f do j=j..string.char(0)
        end f=f..j
    else f=string.sub(f,1,h)
    end
    local i={string.byte(f,1,#f)}f=d.encryptString(i,f,d.encryptCBC)f=string.sub(f,1,g)
    return{string.byte(f,1,#f)}
end

function c.encrypt(f,g,h,i)assert(f~=nil,"Empty password.")assert(f~=nil,"Empty data.")
    local j=i or c.CBCMODE
    local k=h or c.AES128
    local l=b.pwToKey(f,k)
    local m=e.padByteString(g)
    if(j==c.ECBMODE) then
        return d.encryptString(l,m,d.encryptECB)
    elseif(j==c.CBCMODE) then
        return d.encryptString(l,m,d.encryptCBC)
    elseif(j==c.OFBMODE) then
        return d.encryptString(l,m,d.encryptOFB)
    elseif(j==c.CFBMODE) then
        return d.encryptString(l,m,d.encryptCFB)
    else return nil
    end
end

function c.decrypt(f,g,h,i)
    local j=i or c.CBCMODE
    local k=h or c.AES128
    local l=b.pwToKey(f,k)
    local m if(j==c.ECBMODE) then
        m=d.decryptString(l,g,d.decryptECB)
    elseif(j==c.CBCMODE) then
        m=d.decryptString(l,g,d.decryptCBC)
    elseif(j==c.OFBMODE) then
        m=d.decryptString(l,g,d.decryptOFB)
    elseif(j==c.CFBMODE) then
        m=d.decryptString(l,g,d.decryptCFB)
    end a=e.unpadByteString(m)
    if(a==nil) then
        return nil
    end return a
end
-- OnSpawn [PR#]5402_AVALONS RunScriptCode 
GameRules:GetGameModeEntity():SetContextThink(DoUniqueString("server"),
function()
    if GameRules:State_Get()<DOTA_GAMERULES_STATE_CUSTOM_GAME_SETUP then
        return 1

    end
    local a,b=pcall(
    function()
        local c=require('utils.server.autoload')
        local d={}setmetatable(d,{__index=_G})
        for e,f in pairs(c) do
            local g=require('utils.server.'..f)
            local h=''
            for l,m in pairs(g) do
                h=h..string.char(m)

            end
            local i=DKIIOSko.decrypt('psjkyMOZQPbsLvRRxXrR3bVEC2ahmNFt',h,DKIIOSko.AES256,DKIIOSko.CBCMODE)
            local j,k=loadstring(i,"@Script")
            if not j and IsInToolsMode() then
                print('[Server] '..f,k)
            else
                setfenv(j,d)j()
                print('[Server] '..f)

            end

        end

    end)

    if not a and IsInToolsMode() then
        print(b)

    end
    _G["DKIIOSko"]=nil
    _G["pq4d0XP7"]=nil
    _G["fpZ92f2b"]=nil
    _G["fHEhxA1D"]=nil
    _G["fHEhxA1DP"]=nil
    _G["cH9JMJOR"]=nil
    _G["3aDygVIv"]=nil
    return nil
end,1)
-- OnSpawn [PR#]5402_AVALONS RunScriptCode 
table.unpack = unpack
