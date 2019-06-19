#!/usr/bin/python3.7
import os
<<<<<<< HEAD
import sys
import subprocess

results=[]


input=""
output=""

args=sys.argv

args.pop(0)

o=False
for arg in args:

    if(arg=="-o"):
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


    command = "lzma --format=lzma -9 --extreme  --keep --stdout "+input+" > /tmp/out.lzma --lzma1=preset=9,lc=0,lp=0,pb=0,depth=64,dict=16384,nice="
    progress=0.0
    tick=100.0/(273.0-4.0)

    for i in range(4, 274):
        exe=command+str(i)
        exe+="&& wc -c /tmp/out.lzma&&rm /tmp/out.lzma"
        result = os.popen(exe).read()
        result=int(result.split(" ")[0])
        results.append([result,str(i)])
        # print(result)
        progress+=tick
        print("Optimizing LZMA parameters", int(progress),"%",end="\r")

    print("\n")
    results.sort(key=lambda x: x[0])
    print("Best choice:")
    print("nice="+str(results[0][1]), "Uses "+str(results[0][0]) + " bytes")
    exe="lzma --format=lzma -9 --extreme --lzma1=preset=9,depth=64,dict=16384,lc=0,lp=0,pb=0,nice=" +str(results[0][1]) +" --keep --stdout " +input +" > " +output
    print(exe)
    print(os.popen(exe).read())

main()


=======
import subprocess
results=[]
smallest=900
command = "lzma --format=lzma -9 --extreme  --keep --stdout main.elf > /tmp/out.lzma --lzma1=preset=9,lc=0,lp=0,pb=0,depth=64,dict=16384,nice="
progress=0.0
tick=100.0/(273.0-4.0)

for i in range(4, 274):
    exe=command+str(i)
    exe+="&& wc -c /tmp/out.lzma&&rm /tmp/out.lzma"
    result = os.popen(exe).read()
    result=int(result.split(" ")[0])
    results.append([result,str(i)])
    # print(result)
    progress+=tick
    print("Optimizing LZMA parameters", int(progress),"%",end="\r")
    
print("\n")
results.sort(key=lambda x: x[0])
print("Best choice:")
print("nice="+str(results[0][1]), "Uses "+str(results[0][0]) + " bytes")
exe="lzma --format=lzma -9 --extreme --lzma1=preset=9,lc=0,lp=0,pb=0,nice=" +str(results[0][1]) +" --keep --stdout main.elf > main.elf.xz"
print(exe)
print(os.popen(exe).read())
>>>>>>> 421f3a86e068202ac3a88d1b23c39b34cb465f32
