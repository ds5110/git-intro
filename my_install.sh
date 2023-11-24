#!/bin/bash
#
# Shell script that I used to install miniconda on my Mac
#
set -e # shell script will exit immediately on error (e.g., inconsistent SHA256 hash)

# This is the latest for my mac, which has an M3 Pro chip
export MY_CONDA=Miniconda3-latest-MacOSX-arm64.sh

curl -LO https://repo.anaconda.com/miniconda/$MY_CONDA
echo 5043144d7eaea2286e30d091b62fcf50f7ed983b092230e56c370b592e7a57f2 > sha256_hash.txt

# Verify the checksum
shasum -a 256 $MY_CONDA | awk '{print $1;}' > sha256_download.txt
diff sha256_download.txt sha256_hash.txt
rm sha256_hash.txt
rm sha256_download.txt

# Install...
#   Be patient and respond to the prompts! 
#   Accept the defaults and respond with "yes" regarding license.
bash $MY_CONDA

# Clean up
rm $MY_CONDA
