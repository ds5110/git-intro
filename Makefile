# First chart in ISLR2 Figure 1.1
app:
	python -B src/app.py

# Download the data
csv:
	cd data; curl -O https://github.com/ds5110/rdata/raw/main/data/Wage.csv
