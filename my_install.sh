#!/bin/bash
#
# Shell script that I used to install miniconda on my Mac
#
set -e # shell script will exit immediately on error (e.g., inconsistent SHA256 hash)

# This is the latest for my mac, which has an M3 Pro chip
export MY_CONDA=Miniconda3-latest-MacOSX-arm64.sh

curl -LO https://repo.anaconda.com/miniconda/$MY_CONDA

# The checksum -- I updated the SHA256 hash on 23 Mar 2024
* The hash and script came from here: https://docs.anaconda.com/free/miniconda/
echo 1c277b1ec046fd1b628390994e3fa3dbac0e364f44cd98b915daaa67a326c66a > sha256_hash.txt

# Verify the checksum
shasum -a 256 $MY_CONDA | awk '{print $1;}' > sha256_download.txt
diff sha256_download.txt sha256_hash.txt
rm sha256_hash.txt
rm sha256_download.txt

# Install...
#   Be patient! Read the license and respond with "yes" regarding license.
#   Otherwise, accept the defaults.
bash $MY_CONDA

# Clean up
rm $MY_CONDA
