#!/usr/bin/python3
import os
import sys
import subprocess

results=[]

input=""
output=""

args=sys.argv

args.pop(0)

v=False

o=False
for arg in args:

    if(arg=="-v"):
        v=True
    elif(arg=="-o"):
        o=True
    elif o:
        output=arg
        o=False        
    else:
        input=arg

def sizeof(filename):
    return os.stat(filename).st_size

def rewriteHeader(input,output):
    full_size=sizeof(input)
    newdata=full_size.to_bytes(8,'little')

    lzma_size=sizeof(output)

    outputfile=open(output,"r+b")

    outputfile.seek(5)
    outputfile.write(newdata)
    outputfile.seek(lzma_size-5)
    # outputfile.write(int(0).to_bytes(1,"little"))
    outputfile.truncate()
    # outputfile.seek(lzma_size-6)
    # outputfile.write(int(0).to_bytes(1,"little"))
    outputfile.close

def main():

    if input=="":
        print("No input file given")
        return
    elif output=="":
        print("No output file given")
        return


    command = "lzma -T 0 --format=lzma -9 --extreme  --keep --stdout "+input+" > /tmp/out.lzma --lzma1=preset=9,lc=0,lp=0,pb=0,nice="
    progress=0.0
    tick=100.0/(273.0-4.0)

    for i in range(4, 274):
        exe=command+str(i)
        exe+="&& wc -c /tmp/out.lzma&&rm /tmp/out.lzma"
        result = os.popen(exe).read()
        result=int(result.split(" ")[0])
        results.append([result,str(i)])
        progress+=tick
        print("Finding optimal LZMA-nice-parameter", int(progress),"%",end="\r")

    print("\n")

    results.sort(key=lambda x: x[0])

    if(v==True):
        for row in results:
            print(row)
    print("Best choice:","nice="+str(results[0][1]), "uses "+str(results[0][0]) + " bytes")
    exe="lzma -T 0  --format=lzma -9 --extreme --lzma1=preset=9,lc=0,lp=0,pb=0,nice=" +str(results[0][1]) +" --keep --stdout " +input +" > " +output
    if(v==True):
        exe=exe+" -vv"
    print(exe)
    print(os.popen(exe).read())
    # rewriteHeader(input,output)

main()


