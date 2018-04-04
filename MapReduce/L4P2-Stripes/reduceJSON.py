#!/usr/bin/python3
import sys
import json
import string

oldKey=None
oldData={}

for line in sys.stdin:
	data = json.loads(line)
	for key in data.keys(): key=key
	dataVal=data[key]

	if(oldKey and oldKey!=key):
		dump={}
		dump[oldKey]=oldData
		print(json.dumps(dump))
		oldData={}

	oldKey=key
	for k in data[key].keys():
		if(k in oldData.keys()):
		    oldData[k]+=data[key][k]
		else:
		    oldData.update({k:data[key][k]})

if(oldKey!=None):
	dump={}
	dump[oldKey]=oldData
	print(json.dumps(dump))
