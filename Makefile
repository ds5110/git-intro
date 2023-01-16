.PHONY: data

# Create the first chart in ISLR2 Figure 1.1
app:
	python -B src/app.py

# Download the data
# mkdir -p fails quietly if directory already exists
# curl -L follows indirects
# curl -O preserves filename of source
data:
	mkdir -p data
	cd data; curl -LO https://github.com/ds5110/rdata/raw/main/data/Wage.csv

clean:
	rm data/Wage.csv
