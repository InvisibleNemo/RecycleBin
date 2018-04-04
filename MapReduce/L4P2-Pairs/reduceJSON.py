#!/usr/bin/python3
import sys
import string

count=0
oldKey1=None
oldKey2=None

for line in sys.stdin:
    tag=line.strip().split("\t")
    if(len(tag)!=3):
        continue
    key1, key2, cnt = tag
    if(oldKey1 and oldKey2 and oldKey1!=key1 and oldKey2!=key2):
        print("{0}\t{1}\t{2}".format(oldKey1,oldKey2,count))
        count=0
        
    oldKey1=key1
    oldKey2=key2
    count+=int(cnt)
        
if(oldKey1!=None and oldKey2!=None):
    print("{0}\t{1}\t{2}".format(oldKey1,oldKey2,count))

    
