# Reference for make: https://www.gnu.org/software/make/

# Use this .PHONY line if have a directory named "data" and you want to use "make data"
# Ref: https://www.gnu.org/software/make/manual/html_node/Phony-Targets.html
.PHONY: data

# Create the first chart in ISLR2 Figure 1.1 (this requires a local copy of data/Wage.csv)
q1: data/Wage.csv
	python -B src/q1.py

# Download the data
# "mkdir -p" fails quietly if directory already exists
# "curl -L" follows redirects
# "curl -O" preserves filename of the source
# Note: the "data" directory has been "gitignored" in the ".gitignore" file
data/Wage.csv:
	mkdir -p data
	cd data; curl -LO https://github.com/ds5110/rdata/raw/main/data/Wage.csv

clean:
	rm data/Wage.csv
