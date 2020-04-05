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



def main():

    if input=="":
        print("No input file given")
        return
    elif output=="":
        print("No output file given")
        return

    command = "lzma --format=lzma -9 --extreme  --keep --stdout "+input+" > /tmp/out.lzma --lzma1=preset=9,lc="
    progress=0.0
    tick=100.0/(273.0-4.0)/16
    for lc in range(0,4):
        for pb in range(0,4):
            for i in range(4, 274):
                lp=0
        
                exe=command+str(lc)+",lp="+str(lp)+",pb="+str(pb)+",nice="+str(i)
                exe+="&& wc -c /tmp/out.lzma&&rm /tmp/out.lzma"
                result = os.popen(exe).read()
                result=int(result.split(" ")[0])
                results.append([result,str(lc)+",lp="+str(lp)+",pb="+str(pb)+",nice="+str(i)])
                progress+=tick
                print("Finding optimal LZMA-nice-parameter", int(progress),"%",end="\r")

    print("\n")

    results.sort(key=lambda x: x[0])

    if(v==True):
        for row in results:
            print(row)
    print("Best choice:")
    print("nice="+str(results[0][1]), "Uses "+str(results[0][0]) + " bytes")
    exe="lzma --format=lzma -9 --extreme --lzma1=preset=9,lc="+str(results[0][1]) +" --keep --stdout " +input +" > " +output
    print(exe)
    print(os.popen(exe).read())

main()


