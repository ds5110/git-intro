# node

For web development you need Node.js, which ships with the npm package manager.
Use the current **LTS** release (Node 26 as of late Oct 2026). Starting with
Node 27, Node ships one major release per year and every release becomes LTS,
so "use the latest LTS" is the whole rule.

## Install with nvm (macOS, Linux, WSL)

On Windows, do everything in this file inside WSL (see [setup.md](setup.md)).

The official [Node.js download page](https://nodejs.org/en/download) generates
the nvm commands below by default for macOS and Linux, and the
[npm docs](https://docs.npmjs.com/downloading-and-installing-node-js-and-npm/)
strongly recommend a version manager like nvm over the Node installer.

```
# Check the nvm README for the current version in this URL
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
\. "$HOME/.nvm/nvm.sh"     # or restart your shell

nvm install --lts
node -v    # v26.x or later
npm -v
```

**Why nvm (pros)**

- Installs in your home directory, so `npm install -g` never needs `sudo`.
  (The npm docs cite exactly this: the installer can cause permission errors
  with global packages.)
- Switching or upgrading Node is one command (`nvm install --lts`).
- `.nvmrc` pins the Node version per project (see below).

**What to watch for (cons)**

- `curl | bash` runs a script from GitHub. That's normal, but skim it first;
  the signed installer from nodejs.org is the more conservative download.
- The script edits your shell startup file (`~/.zshrc` or `~/.bashrc`),
  and `nvm` only works in shells that load it.
- Global packages belong to one Node version; reinstall them after switching.
- Not for native Windows (nvm-windows is an unrelated project).

**Alternatives:** the [official installer](https://nodejs.org/en/download) is fine
if you'll only ever need one version. Or, since this course uses conda, add `nodejs`
to your `environment.yml` (conda-forge) to keep Node in the same reproducible
environment as your Python packages.

### Pin the version per project

```
echo "26" > .nvmrc  # pin the major version (or "lts/*"); commit this file
nvm use             # anyone cloning the repo gets a matching version
```

Pin the major version, not an exact release like `v26.1.3`; otherwise `nvm use`
fails for anyone who doesn't have that exact patch installed.

## npm and reproducibility

Use npm. It comes with Node, so there's nothing extra to install.

- Commit `package-lock.json`. It records the exact version of every dependency,
  much like sharing a conda `environment.yml` (see [conda.md](conda.md)).
- Use `npm install <pkg>` when *adding* dependencies to your own project.
- Use `npm ci` when *reproducing* a project (yours or someone else's) from a fresh clone.
  It installs exactly what the lockfile specifies and fails if `package.json` and the
  lockfile disagree. Use it in GitHub Actions too.
- Never commit `node_modules/`; `.gitignore` it.
- Avoid `npm install -g`. Global tools aren't recorded anywhere, so others can't
  reproduce your setup (and under nvm they belong to one Node version). Instead,
  install tools per project with `npm install -D <tool>` and run them with
  `npx <tool>` or an npm script.

Rule of thumb: use whichever package manager the lockfile says.
If a project has a `yarn.lock` instead, run `npm install -g corepack && corepack enable`
first (Corepack is no longer bundled with Node 25+), then use `yarn`.

## npm scripts and Make

Make stays the entry point for reproducing your work (see [README.md](README.md)).
Use npm scripts in `package.json` for JS-specific tasks, and have the Makefile call them:

```
site:
	npm ci
	npm run build
```

Then `make site` works the same for everyone, whether or not they know npm.

## supply-chain hygiene

A typical project pulls in hundreds of packages you never chose directly, and the
npm registry has seen several high-profile package compromises. A few habits help:

- Double-check package names before installing; typo-squatted look-alikes exist.
- Be cautious with `npx some-unfamiliar-package`: it downloads and runs code immediately.
- Be skeptical of packages suggested by LLMs. They sometimes invent package names,
  and attackers register those names.
- Commit your lockfile so everyone installs the same, already-vetted versions.
- Run `npm audit` occasionally and read what it reports.

## GitHub Actions

Use the same Node version and dependencies in CI as on your machine
(check the [setup-node docs](https://github.com/actions/setup-node) for the latest major versions):

```
steps:
  - uses: actions/checkout@v6
  - uses: actions/setup-node@v6
    with:
      node-version-file: .nvmrc
  - run: npm ci
  - run: npm run build
```

## secrets

Node loads `.env` files natively, so `dotenv` is optional:

```
node --env-file=.env app.js              # errors if .env is missing
node --env-file-if-exists=.env app.js    # skips silently if missing
```

or in code: `process.loadEnvFile()`.

You'll often see `import "dotenv/config"` in tutorials and generated code; it does
the same thing but requires `npm install dotenv`. Prefer the built-in options above.

Always `.gitignore` your `.env`, and commit a `.env.example` listing the
variable names (without values) so others can reproduce your setup.
In GitHub Actions, store secrets as repository secrets
(Settings → Secrets and variables → Actions), never in the workflow file.
