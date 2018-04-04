#!/usr/bin/python3
import sys
import json
import re
import string
import nltk
from nltk.corpus import stopwords

stopWords = set(stopwords.words("english"))

for line in sys.stdin:
	tweet = json.loads(line)
	text=tweet["text"]
	text=re.sub('<[^>]+>', '', text)
	text = re.sub(r"http\S+","", text).strip().lower()
	text = ' '.join([word for word in text.split() if word not in stopWords])
	p = re.compile(r'(@[A-Za-z0-9]+)|(\n)|(\r)|(\t)|(\')|(\u00A9)|([!"$%&()@#*+,-./:;<=>?\[\\\]^_`{|}~])', re.IGNORECASE)
	text=re.sub(p,'',text)
	text = ' '.join([word for word in text.split() if (word not in stopWords and not word.isdigit())])
	words=[var for var in text.split() if var]
	for i in range(len(words)):
		for j in range(len(words)):
			if(words[i]!=words[j]):
				print("{0}\t{1}\t{2}".format(words[i],words[j],1))
			else:
				continue        
