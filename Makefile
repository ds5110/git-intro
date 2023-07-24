MY_CONDA = Miniconda3-py311_23.5.2-0-MacOSX-arm64.sh

.PHONY: data, clean

# Create the first chart in ISLR2 Figure 1.1 -- this requires a local copy of Wage.csv
q1: data/Wage.csv
	python -B src/q1.py

# Download the data
# mkdir -p fails quietly if directory already exists
# curl -L follows redirects
# curl -O preserves filename of the source
data/Wage.csv:
	mkdir -p data
	cd data; curl -LO https://github.com/ds5110/rdata/raw/main/data/Wage.csv

clean:
	rm data/Wage.csv

# download & install miniconda (on my Mac); checks shasum (Note: remove any previous installs first)
#miniconda:
#	curl -LO https://repo.anaconda.com/miniconda/$(MY_CONDA)
#	echo c8f436dbde130f171d39dd7b4fca669c223f130ba7789b83959adc1611a35644 > sha256_hash.txt
#	shasum -a 256 $(MY_CONDA) | awk '{print $$1;}' > sha256_new.txt 
#	diff sha256_new.txt sha256_hash.txt 
#	bash $(MY_CONDA)
#	rm sha256_hash.txt
#	rm sha256_new.txt
#	rm $(MY_CONDA)
