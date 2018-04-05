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
	text=re.sub(r"http\S+","",text).strip().lower()
	p = re.compile(r'(\n)|(\r)|(\t)|(\')|(\u00A9)|([!"$%&()*+,-./:;<=>?\[\\\]^_`{|}~])', re.IGNORECASE)
	text=re.sub(p,' ',text)
	text = ' '.join([word for word in text.split() if (word not in stopWords and not word.isdigit())])
	for word in [var for var in text.split() if var]:
		if (word.startswith("#") or word.startswith("@")):
			print("{0}\t{1}".format(word,1))
