#!/usr/bin/python3
import sys
# import json
# import re
import string

count=0
oldKey=None

for line in sys.stdin:
    tag=line.strip().split("\t")
    
    if(len(tag)!=2):
        continue
    
    key, cnt = tag
    
    if(oldKey and oldKey!=key):
        print("{0}\t{1}".format(oldKey,count))
        count=0
        
    oldKey=key
    count+=int(cnt)
        
if(oldKey!=None):
    print("{0}\t{1}".format(oldKey,count))

