# Reference for make: https://www.gnu.org/software/make/

# Declare targets that don't create a file with the same name (e.g., there's no file named "q1")
# Ref: https://www.gnu.org/software/make/manual/html_node/Phony-Targets.html
.PHONY: q1 clean

# Answer to Question 1 (this requires a local copy of ./data/Wage.csv)
q1: data/Wage.csv
	mkdir -p figs
	python -B src/q1.py

# Download the data
# "mkdir -p" fails quietly if directory already exists
# "curl -f" fails on HTTP errors (instead of saving an error page as Wage.csv)
# "curl -L" follows redirects
# "curl -o" names the output file
# "$@" is make's name for the target (here, data/Wage.csv)
# Note: the "data" directory has been "gitignored" in the ".gitignore" file
data/Wage.csv:
	mkdir -p data
	curl -fL -o $@ https://github.com/ds5110/rdata/raw/main/data/Wage.csv

# Remove downloaded data (figs are committed, so leave them alone)
clean:
	rm -rf data
