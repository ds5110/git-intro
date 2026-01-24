# node

For web development, you need Node.js and the related ecosystem. It comes with the npm package manager.

I'm on a Mac, and I've had problems with homebrew in the past. I avoid it. I downloaded Node.js from the command line...

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

## yarn

* First verify the location for global installs (it's $HOME/.nvm)
  ```
  npm root -g
  ```
* Install: https://yarnpkg.com/getting-started/install
  ```
  npm install -g corepack
  ```

## secrets

The statement
```
import "dotenv/config";
```
is an ES6 module syntax in Node.js that loads environment variables from a local `.env` file 
into the Node.js runtime's `process.env` object without needing to explicitly call a configuration function. 
In practice, you should `.gitignore` your `.env` file.
