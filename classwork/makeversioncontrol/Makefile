SHELL := /bin/bash

URL = "https://archive.ics.uci.edu/ml/machine-learning-databases/wine-quality/winequality-red.csv"

.PHONY: clean all

all: rwine/test/data.csv #clean

rwine: 
	mkdir -p $@

rwine/test: rwine
	mkdir -p $@

rwine/train: rwine
	mkdir -p $@

rwine/data.csv: |rwine
	curl -sL $(URL) > $@

rwine/clean.csv: rwine/data.csv
	sed 's/;/,/g' $< > $@

rwine/binary.csv: rwine/clean.csv
	awk -f bin.awk $< > $@

rwine/train/data.csv: rwine/binary.csv | rwine/train rwine/test
	./mysplit.sh $< rwine

rwine/test/data.csv: rwine/train/data.csv

clean: 
	rm rwine/*.csv
