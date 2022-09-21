# Create first chart in ISLR2 Figure 1.1
app:
	python -B src/app.py

# Download the data
# -L follows indirects
# -O preserves filename of source
csv:
	cd data; curl -LO https://github.com/ds5110/rdata/raw/main/data/Wage.csv
