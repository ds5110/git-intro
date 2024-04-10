# nodejs

* Note: I inadvertently screwed up yarn on a couple laptops...and I'm not sure how I did it
* As a result, I chose to try another approach to installing node.js. Instructions below... 

## Mac silicon

* I have a cool new Mac with an Apple M2 Max chip
* I chose not to [install nodejs using a package manager (nvm)](https://nodejs.org/en/download/package-manager)
* Here's why: [nvm install issue (Mar 2024)](https://github.com/nvm-sh/nvm/issues/3318)
* I didn't [install with a prebuilt installer](https://nodejs.org/en/download) because Linux doesn't have one.
* Instead, I chose to [install prebuilt binaries](https://nodejs.org/en/download/prebuilt-binaries)
* Why? Because this approach works for every platform (even Windows and AIX?!)
* **IMPORTANT:** If I had to use Windows (a sad thing), I'd use WSL and install for Linux!

## Download Node.js

* [Download prebuilt binaries](https://nodejs.org/en/download/prebuilt-binaries)
  * I installed the prebuilt binary for v20.12.1 on 10 Apr 2024 (Apple M2 Max)
* [verify binaries](https://github.com/nodejs/node#verifying-binaries)
  * Here's what they recommend...
```
curl -O https://nodejs.org/dist/vx.y.z/SHASUMS256.txt
grep node-vx.y.z.tar.gz SHASUMS256.txt | sha256sum -c -
```
Specifically, since I'm downloading v20.12.1, then...
```
curl -O https://nodejs.org/dist/v20.12.1/SHASUMS256.txt
```
then, since I don't have `sha256sum` on MacOS, but I **do** have `/usr/bin/shasum`...
```
grep node-v20.12.1-darwin-arm64.tar.gz SHASUMS256.txt | shasum -a 256 -c -
```
and with the result
```
node-v20.12.1-darwin-arm64.tar.gz: OK
```
then
```
tar xzvf node-v20.12.1-darwin-arm64.tar.gz: OK
```

## Install

I added a line in my `~/.zshrc` to point to the binaries in the distribution that I just downloaded
```
export PATH="$PATH:/Users/pbogden/node-v20.12.1-darwin-arm64/bin"
```

I then chose to: [install yarn](https://yarnpkg.com/getting-started/install)
