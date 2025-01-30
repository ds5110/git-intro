
# git

An opinionated set of recommendations (with references) for using git from the command line.

## context

"I really never wanted to do source control management at all and felt that it was just about the least interesting thing in the computing world (with the possible exception of databases ;^), and I hated all SCM’s with a passion." -- Linus Torvalds, creator of git (and Linux)

* [an interview with Linus Torvalds](https://www.linuxfoundation.org/blog/blog/10-years-of-git-an-interview-with-git-creator-linus-torvalds/)
* [git book, 2nd edition](https://git-scm.com/book/en/v2) -- git-scm.com
* [about git](https://git-scm.com/about) -- branching -- git-scm.com

## install

* If you have a Mac, you already have a version of git in `/usr/bin/git`. That version works with Mac's keychain 
  for authentication.
* I [install git from conda-forge](https://anaconda.org/conda-forge/git) and authenticate with SSH 
  using standard Linux recommendations.
  ```
  conda install -c conda-forge git
  ```
* Note: This version of git doesn't work with the Mac keychain, 
  but I had trouble getting Mac's git to works well with SSH.
* The alternative is to use Mac's built-in git and follow Github's 
  [special instructions for Mac](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent).
* Whatever you do, note that I do NOT recommend github desktop or github CLI (or becoming dependent
  on any github proprietary stuff). Unlike github, git is used everywhere. Github is not. That said, we'll be using use github.

## authentication

* If all you're doing is cloning a public repo and working locally, 
  then you don't need to worry about authentication. However, we'll be working with github a lot
  and pushing to public and private repos (created by github-classroom).
* To clone a private github repo or update any kind of repo, you'll need to authenticate. You have some choices:
  * You can type your github username and password a lot (NOT recommended).
    * That gets old fast.
  * You have a couple choices for automating things...
    * [github authentication](https://docs.github.com/en/authentication) has an overview and additional links.
    * The two main choices are SSH and github's personal access tokens.  I've used both.
    * I recommend SSH keys.
    * Whatever you do, it's worth spending the time to get this stuff to work on your platform.
  * [SSH keys](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
    * SSH is an authentication standard that's used all over the place.
    * If you set up SSH for github, you may be able to use the same SSH setup elsewhere.
    * In contrast, Github's personal access tokens are good for, well, github.
    * Note: github is not git but github uses git. So beware of becoming dependent on proprietary github stuff.
    (I do NOT recommend github desktop either.)
  * With SSH, you'll need to [generate ssh keys](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent) -- github.com
* Are you using HTTPS or SSH?
  ```
  git remote -v
  ```
  See: [switching from https to ssh](https://docs.github.com/en/get-started/getting-started-with-git/managing-remote-repositories#switching-remote-urls-from-https-to-ssh) -- github.com

## tutorials

These tutorials are extensive. Some describe advanced usage of git and github -- there's a lot there.

* [Git tutorials](https://www.atlassian.com/git) -- atlassian.com
  * Atlassian isn't github, but it has some very good tutorials, specifically:
  * [Beginner guide](https://www.atlassian.com/git/tutorials/what-is-version-control)
  * [Setting up a repository](https://www.atlassian.com/git/tutorials/setting-up-a-repository)
  * [Collaborating](https://www.atlassian.com/git/tutorials/syncing)
* [github starter course](https://github.com/classroom-resources/github-starter-course)
  * The overview page has links to many detailed topics.
* [github cli](https://docs.github.com/en/github-cli) -- github.com
  * The github CLI is NOT the same as "git" on the command line (I don't use it)

## cloning a repo

If you're authenticaing with personal access tokens, then cloning with HTTPS looks something like this...

```
$ git clone https://github.com/YOUR-USERNAME/YOUR-REPOSITORY.git
```

If you're authenticating with SSH then there's an alternate URL that looks like this...

```
$ git clone git@github.com/YOUR-USERNAME/YOUR-REPOSITORY.git
```

Reference: [Clone a repository](https://docs.github.com/en/repositories/creating-and-managing-repositories/cloning-a-repository) -- github.com

## gitignore large files

**IMPORTANT:** Do NOT commit large files (> 50 MB) with git. List them in `.gitignore` instead!

You can't push files larger than 100 MB to github.com, and you start getting nasty messages at 50 MB. So if you accidentally commit a large file with git, remove it **before** you commit it!!

You should also gitignore files with sensitive data (passwords, passkeys, etc.)!

* [removing files from git history](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/removing-sensitive-data-from-a-repository)
* [gitignore](https://git-scm.com/docs/gitignore) -- git-scm
* [ignoring files](https://docs.github.com/en/get-started/getting-started-with-git/ignoring-files) -- github.com
* [gitignore templates](https://github.com/github/gitignore) -- github.com

## accidental commits

* Common use case: You accidently commit a large data file or a file with sensitive info before you `.gitignore` it.
* There are [several recommended ways to deal with this problem.](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/removing-sensitive-data-from-a-repository) -- github.com
  * I use `git filter-repo`
  * You can [install git-filter-repo with conda from conda-forge](https://anaconda.org/conda-forge/git-filter-repo)
* Of course, the best way to deal with accidental commits is to [avoid them](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/removing-sensitive-data-from-a-repository) -- github.com

## making changes

It's a good idea to make sure you're up to date with origin before you make local changes.
```
$ git pull
```
After you make a change in to your local repository, check to see what you changed
```
$ git status
```
Stage some or all of the changes (`git add .` stages all of them)
```
$ git add .
```
Then commit the staged changes with a message
```
$ git commit -m "I made a small but super-important change to such and such."
```
Verify things (you can do this a lot -- it's just a sanity check)
```
$ git status
```

References:

* [git tutorial](https://git-scm.com/docs/gittutorial/2.8.6) -- git-scm.com
* [about commits](https://docs.github.com/en/pull-requests/committing-changes-to-your-project/creating-and-editing-commits/about-commits) -- github.com

## update github 

You can update the main branch on github by pushing to "origin main", **but** use pull requests if you're collaborating.

* If you've made a change, then check to see what you'll be committing
  ```
  git status
  ```
* Commit the changes locally
  ```
  $ git add .
  $ git commit -m "I've made a such-and-such a change"  
  $ git push origin main
  ```
  * Note: `git add .` will stage everything that changed, which may not be a good idea.

## reviewing things

To review the commit history
```
$ git log 
```
To checkout a previous commit
```
$ get checkout <tag/branch/commit id>
```
If you made some changes and you want to revert then
```
git restore . # revert any changes that don't want to commit
git clean -f  # delete any untracked files (beware -- it really deletes them)
```
You can reset to a previous commit (but you'll lose everything you did since then!!)
```
$ get reset --hard <tag/branch/commit id>
```
Warning: `git reset` can get complicated quickly. That's one reason `git filter-repo` was created.

Reference: [git-reset](https://git-scm.com/docs/git-reset) -- git-scm.com

## branches

Branches allow you to develop outside the `main` branch.  This is good for experimenting and collaborating.

List branches, including current branch (which is preceded by an asterisk)
```
git branch
```
* default branch is usually "main", sometimes for older repos it's "master"
* if you haven't created any branches, that'll be the only one

Create a new branch called demo
```
git branch demo
```

Checkout the "demo" branch
```
git checkout demo
```

To merge changes made in a branch (an oversimplified example)
```
git checkout demo
...make changes...
git add .
git commit -m "I made some wicked cool changes that are ready to merge into the main branch"
git checkout main
git merge demo
```
* You need to specify the upstream for the branch before you can "push" or "pull"

To update a dev branch with changes that were made in main while you were working in dev...
```
git checkout main  # make sure main is up to date
git pull
git checkout demo
git merge main     # or use `git rebase` -- see reference below
```

References: 

* [git branch](https://git-scm.com/docs/git-branch) -- git-scm.com
* [Git branching](https://git-scm.com/book/en/v2/Git-Branching-Basic-Branching-and-Merging) -- git-scm.com
* [About branches](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/about-branches)
* [Working with branches](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/about-branches#working-with-branches)
* [Merging vs rebasing](https://www.atlassian.com/git/tutorials/merging-vs-rebasing) -- atlassian.com

## pull requests

[Creating a pull request](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/creating-a-pull-request) -- github.com

## Removing a file/directory from git history

`git filter-repo` usage -- if you commit sensitive data (e.g. password) or you accidentally commit a huge file. Be careful how you deal with this.  The article on github.com is a good one...

* [Removing sensitive data from a repository](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/removing-sensitive-data-from-a-repository) -- github.com
