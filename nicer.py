#!/usr/bin/python3
import os
import sys
import subprocess
import argparse

results=[]

# input=""
# output=""

# args=sys.argv

# args.pop(0)

# v=False

# o=False
# for arg in args:

#     if(arg=="-v"):
#         v=True
#     elif(arg=="-o"):
#         o=True
#     elif o:
#         output=arg
#         o=False        
#     else:
#         input=arg

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
    outputfile.truncate()
    outputfile.close

def main(opts):
    command = "lzma -T 0 --format=lzma -9 --extreme  --keep --stdout "+opts.infile+" > /tmp/out.lzma --lzma1=preset=9,lc=0,lp=0,pb=0,nice="
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

    print("Best choice:","nice="+str(results[0][1]), "uses "+str(results[0][0]) + " bytes")
    exe="lzma -T 0  --format=lzma -9 --extreme --lzma1=preset=9,lc=0,lp=0,pb=0,nice=" +str(results[0][1]) +" --keep --stdout " +opts.infile +" > " +opts.outfile
    if(opts.verbose==True or opts.veryverbose==True):
        exe=exe+" -vv"
        if(opts.veryverbose==True):
            for row in results:
                print(row)
        print(os.popen(exe).read())
    else:
        os.popen(exe).read()

    # rewriteHeader(opts.infile,opts.outfile)

p = argparse.ArgumentParser(description="""\Compresses a given inputfile to LZMA using the optimal nice value for a minimum filesize.""")
p.add_argument("infile", type=str,help="The ELF file that will be compressed.")
p.add_argument("-o","--outfile", type=str,default="nicer.lzma", help="The LZMA-compressed ELF file. If not specified, the deafault ist nicer.lzma")
p.add_argument("-v","--verbose" ,help="Be verbose.",action="store_true")
p.add_argument("-vv","--veryverbose" ,help="Be even more verbose. Also print out all results.",action="store_true")
main(p.parse_args())
