
# git

An opinionated set of recommendations (with references) for using git from the command line.

## context

"I really never wanted to do source control management at all and felt that it was just about the least interesting thing in the computing world (with the possible exception of databases ;^), and I hated all SCM’s with a passion." -- Linus Torvalds, creator of git (and Linux)

* [an interview with Linus Torvalds](https://www.linuxfoundation.org/blog/blog/10-years-of-git-an-interview-with-git-creator-linus-torvalds/)
* [git book, 2nd edition](https://git-scm.com/book/en/v2) -- git-scm.com
* [about git](https://git-scm.com/about) -- git-scm.com

## install

* Depending on your operating system, you may already have git.
* If you have a Mac, install the Xcode Command Line Tools and you'll have `/usr/bin/git`.
* If you're using Linux or WSL, install it with `apt` (see [setup.md](setup.md)).
* Or you can install git from conda-forge...
  ```
  conda install conda-forge::git
  ```
* Learn git on the command line. Git is used everywhere; github is just one host
  (GitLab and Bitbucket are others). I don't recommend github desktop because it hides git from you.
  The [github CLI](https://docs.github.com/en/github-cli) (`gh`) is different:
  it doesn't replace git, it handles github-specific things like pull requests and authentication.
  It's optional; everything it does can also be done on github.com.

## first-time setup

Do this once on each computer, before your first commit.

Use your northeastern.edu email address. You don't need a new github account: add the address to
your existing account ([Settings → Emails](https://github.com/settings/emails)) and verify it.
Otherwise github won't connect your commits to you.

* Your commit email is public in the commit history. If you'd rather keep it private, use your github
  [noreply address](https://docs.github.com/en/account-and-profile/setting-up-and-managing-your-personal-account-on-github/managing-email-preferences/setting-your-commit-email-address) instead.
* If you've turned on "Block command line pushes that expose my email," github will reject pushes
  that use your northeastern.edu address. Use the noreply address, or turn that setting off.
* After you graduate, leave the address on your github account. If you remove it,
  your old commits are no longer linked to you.

```
git config --global user.name "Your Name"
git config --global user.email "your.name@northeastern.edu"
git config --global init.defaultBranch main   # new repos start on "main"
git config --global pull.rebase false         # "git pull" merges (avoids the "divergent branches" error)
```
Check your settings with `git config --global --list`.

## authentication

* If all you're doing is cloning a public repo and working locally,
  then you don't need to worry about authentication. However, we'll be working with github a lot
  and pushing to public and private repos (created by [Classroom50](https://classroom50.org/)).
* To clone a private github repo or push to any repo, you'll need to authenticate.
  Github no longer accepts your account password for git operations (since 2021).
  [github authentication](https://docs.github.com/en/authentication) has an overview.
  The two main choices are SSH keys and personal access tokens. I've used both.
  Whatever you do, it's worth spending the time to get this stuff to work on your platform.
* I recommend [SSH keys](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent).
  * SSH is an authentication standard that's used all over the place.
    If you set up SSH for github, you may be able to use the same SSH setup elsewhere.
    In contrast, github's personal access tokens are good for, well, github.
  * You'll need to [generate ssh keys](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
    and [add the public key to your github account](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account).
    (WSL users: generate the keys inside WSL.)
  * When connecting via SSH the first time, you may need to verify [github's SSH key fingerprints](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/githubs-ssh-key-fingerprints).
* If you use HTTPS with a personal access token, set up a credential helper so you don't have to paste
  the token every time you push. `gh auth login` does this for you, or see
  [caching your credentials](https://docs.github.com/en/get-started/git-basics/caching-your-github-credentials-in-git).
* Are you using HTTPS or SSH?
  ```
  git remote -v
  ```
  See: [switching from https to ssh](https://docs.github.com/en/get-started/git-basics/managing-remote-repositories#switching-remote-urls-from-https-to-ssh) -- github.com

## tutorials

These tutorials are extensive. Some describe advanced usage of git and github -- there's a lot there.

* [Git tutorials](https://www.atlassian.com/git) -- atlassian.com
  * Atlassian isn't github, but it has some very good tutorials, specifically:
  * [Beginner guide](https://www.atlassian.com/git/tutorials/what-is-version-control)
  * [Setting up a repository](https://www.atlassian.com/git/tutorials/setting-up-a-repository)
  * [Collaborating](https://www.atlassian.com/git/tutorials/syncing)
* [github starter course](https://github.com/classroom-resources/github-starter-course)
  * The overview page has links to many detailed topics.

## cloning a github repo

If you're authenticating with SSH (a gold standard) then there's an SSH URL that looks like this...

```
git clone git@github.com:YOUR-USERNAME/YOUR-REPOSITORY.git
```

If you're authenticating with personal access tokens, then cloning with HTTPS looks something like this...

```
git clone https://github.com/YOUR-USERNAME/YOUR-REPOSITORY.git
```

Reference: [Clone a repository](https://docs.github.com/en/repositories/creating-and-managing-repositories/cloning-a-repository) -- github.com

## making changes

It's a good idea to make sure you're up to date with origin before you make local changes.
```
git pull
```
After you make a change in your local repository, check to see which files changed, and what changed in them
```
git status
git diff
```
Stage the changes in the file called "filename"
```
git add filename
```
* `git add .` stages everything that changed, which may not be a good idea (check `git status` first).

Then commit the staged changes with a message
```
git commit -m "I made a small but super-important change to such and such."
```
Verify things (I do this a lot -- it's often just a sanity check)
```
git status
```

A note about commit messages: write messages that tell your collaborators (and future you) what changed and why.
This repo is an exception. It's my personal notes and I'm the only one who commits to it,
so most of my messages are just "update". Don't do that in a collaborative repo (or in your assignments).

References:

* [git tutorial](https://git-scm.com/docs/gittutorial) -- git-scm.com
* [about commits](https://docs.github.com/en/pull-requests/committing-changes-to-your-project/creating-and-editing-commits/about-commits) -- github.com

## update github

After you commit locally, push your commits to github
```
git push
```
If you're working in main, that updates the main branch on github.
That's fine for your own assignments, **but** use [pull requests](#pull-requests) if you're collaborating.

## branches

Branches allow you to develop outside the `main` branch.  This is good for experimenting and collaborating.

List branches, including current branch (which is preceded by an asterisk)
```
git branch
```
* default branch is usually "main", sometimes for older repos it's "master"
* if you haven't created any branches, that'll be the only one

Create a new branch called demo and switch to it
```
git switch -c demo
```

Switch between existing branches
```
git switch main
git switch demo
```

To update a branch with changes that were made in main while you were working in it...
```
git switch main    # make sure main is up to date
git pull
git switch demo
git merge main     # or use `git rebase` -- see reference below
```

Note: you'll see `git checkout` used for all of this in older tutorials. It still works, but it does
too many different things, so git added `git switch` (for branches) and `git restore` (for files).

References:

* [git branch](https://git-scm.com/docs/git-branch) -- git-scm.com
* [git switch](https://git-scm.com/docs/git-switch) -- git-scm.com
* [Git branching](https://git-scm.com/book/en/v2/Git-Branching-Basic-Branching-and-Merging) -- git-scm.com
* [About branches](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/about-branches)
* [Merging vs rebasing](https://www.atlassian.com/git/tutorials/merging-vs-rebasing) -- atlassian.com

## pull requests

When you're collaborating, don't push to main. Work in a branch and open a pull request (PR),
so your collaborators can review your changes before they're merged.
```
git switch -c my-feature          # create a branch
...make changes...
git add filename
git commit -m "Add such-and-such"
git push -u origin my-feature     # first push of a new branch: "-u" sets the upstream
```
Then open the PR on github.com (github shows a "Compare & pull request" button after you push).
Describe what you changed and why. After the PR is merged on github, update your local main:
```
git switch main
git pull
```

References:

* [Creating a pull request](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/creating-a-pull-request) -- github.com
* [github flow](https://docs.github.com/en/get-started/using-github/github-flow) -- github.com
* [Writing good CL descriptions](https://google.github.io/eng-practices/review/developer/cl-descriptions.html)
  -- Google's engineering practices ("CL" is Google's term for a PR). The advice applies to commit messages too.

## reviewing and undoing things

To review the commit history
```
git log --oneline
```
To look at a previous commit
```
git switch --detach <tag/commit id>
```
* This puts you in "detached HEAD" state: you can look around, but don't make commits there.
  Go back with `git switch main`.

Discard changes you haven't committed yet
```
git restore .   # discard changes to tracked files (you can't get them back)
git clean -n    # list untracked files that "git clean -f" would delete
git clean -f    # delete those untracked files (beware -- it really deletes them)
```

Undo a commit you've already pushed (this is the safe way)
```
git revert <commit id>   # makes a new commit that undoes that commit
git push
```

Undo commits you have NOT pushed yet (you'll lose everything you did since then!!)
```
git reset --hard <tag/branch/commit id>
```
* Don't use `git reset` on commits you've already pushed. It rewrites history, so you'd have to
  force-push, which breaks things for your collaborators. Use `git revert` instead.
* `git reset` can get complicated quickly.

References:

* [git revert](https://git-scm.com/docs/git-revert) -- git-scm.com
* [git reset](https://git-scm.com/docs/git-reset) -- git-scm.com

## large files, secrets, and accidental commits

**IMPORTANT:** Do NOT commit large files (> 50 MB) or files with sensitive data (passwords, API keys, etc.).
List them in `.gitignore` instead!

* You can't push files larger than 100 MB to github.com, and you start getting nasty messages at 50 MB.
* The best way to deal with accidental commits is to avoid them: set up `.gitignore` before you
  `git add .`, and check `git status` before you commit.
* [gitignore](https://git-scm.com/docs/gitignore) -- git-scm
* [ignoring files](https://docs.github.com/en/get-started/getting-started-with-git/ignoring-files) -- github.com
* [gitignore templates](https://github.com/github/gitignore) -- github.com

If you accidentally commit a file that you shouldn't have, you **haven't pushed yet**,
and it's in your most recent commit:
```
git rm --cached bigfile.csv          # stop tracking it (keeps your local copy)
echo "bigfile.csv" >> .gitignore
git add .gitignore
git commit --amend --no-edit         # rewrite the last commit without the file
```

If it's in an earlier commit, or you've **already pushed**, you'll have to rewrite history.
Be careful how you deal with this.

* **If it's a secret (password, API key, token), revoke or change it first.** Once it's been pushed,
  assume someone has seen it. Rewriting history doesn't un-leak it.
* I use `git filter-repo`.
  You can [install git-filter-repo with conda from conda-forge](https://anaconda.org/conda-forge/git-filter-repo).
* The article on github.com is a good one:
  [Removing sensitive data from a repository](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/removing-sensitive-data-from-a-repository) -- github.com
