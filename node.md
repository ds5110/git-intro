# node

For web development, you need Node.js and the related ecosystem.

I'm on a Mac, and I've had problems with brew in the past so I avoid it. I recommend downloading from the command line:

* [Download Node.js](https://nodejs.org/en/download) -- nodejs.org
* The install on 19 Nov 2025...
```
# Download and install nvm:
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

# in lieu of restarting the shell
\. "$HOME/.nvm/nvm.sh"

# Download and install Node.js:
nvm install 24

# Verify the Node.js version:
node -v # Should print "v24.11.1".

# Verify npm version:
npm -v # Should print "11.6.2".
```
