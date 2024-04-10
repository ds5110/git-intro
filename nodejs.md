# nodejs

* [Install](https://nodejs.org/en/download/package-manager)
* Recommended install for MacOS: [nvm](https://github.com/nvm-sh/nvm)
* To install or update nvm, you should run the install script.
* [The install script](https://github.com/nvm-sh/nvm/blob/v0.39.7/install.sh)
* [nvm install issue (Mar 2024](https://github.com/nvm-sh/nvm/issues/3318)

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
