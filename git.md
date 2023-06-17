
# git

Some notes about using git from the command-line.

## References

"I really never wanted to do source control management at all and felt that it was just about the least interesting thing in the computing world (with the possible exception of databases ;^), and I hated all SCM’s with a passion." -- Linus Torvalds, creator of git

* Ref: [git history](https://www.linuxfoundation.org/blog/10-years-of-git-an-interview-with-git-creator-linus-torvalds/)
* [git book, 2nd edition](https://git-scm.com/book/en/v2) -- git-scm.com
* [about git](https://git-scm.com/about) -- branching
* [Linus Torvalds on git](https://www.linuxfoundation.org/blog/blog/10-years-of-git-an-interview-with-git-creator-linus-torvalds)

## Install git

You may have it already! So don't be in a rush to install it. Section 1.5 in the online book has guidance on installing command-line git. Chapter 1 is worth reading if you want background.

* If you have conda, then it's as easy as...
```
conda install -c conda-forge git
```
* Ref: https://anaconda.org/conda-forge/git
* [1.5 Installing git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) -- git-scm.com
* Note also: [1.4 Getting Started -- The Command Line](https://git-scm.com/book/en/v2/Getting-Started-The-Command-Line)

## Tutorials

These tutorials describe advanced usage of git and github, which you may use later in the course.

* [github starter course](https://github.com/education/github-starter-course)
* [atlassian git tutorials](https://www.atlassian.com/git) -- atlassian.com
  * Some very good tutorials
  * [Begginner guide](https://www.atlassian.com/git/tutorials/what-is-version-control)
  * [Setting up a repository](https://www.atlassian.com/git/tutorials/setting-up-a-repository) -- pretty good
  * [Collaborating](https://www.atlassian.com/git/tutorials/syncing) -- later in the course
* [github cli](https://docs.github.com/en/github-cli) -- github.com
  * This -- the github CLI -- is NOT the same as "git" (I don't use it)

## Cloning

* [Clone a repository](https://docs.github.com/en/repositories/creating-and-managing-repositories/cloning-a-repository)

## Authentication

* If you're cloning a public repo, then you don't need to worry about authentication
* To clone a private github repo, you'll need to set up authentication
  * You have a couple choices of [github authentication](https://docs.github.com/en/authentication)
    * This page provides an overview and additional links.
    * There's extensive documentation.
    * The two main choices are SSH and github's personal access tokens.  I've used both. I recommend SSH keys.
  * [SSH keys](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
    * SSH is an authentication standard that's used in various places.
    * If you set it up here, you may be able to use it elsewhere.
    * Github's personal access tokens are good for, well, github.

## Committing

After you make a change to your local repository, commit the changes and add a message:

```
$ git commit . -m "I made a small but super-important change to such and such."
```
To check the status of current repo
```
$ git status
```
To review the commit history
```
$ git log 
```
To checkout a previous commit
```
$ get checkout <tag/branch/commit id>
```
To reset to a previous commit (because you'll lose everything since then!)
```
$ get reset --hard <tag/branch/commit id>
```
WARNING: Be super careful about using `git reset --hard` because it's destructive. Measure twice, cut once!!

References:

* [About commits](https://docs.github.com/en/pull-requests/committing-changes-to-your-project/creating-and-editing-commits/about-commits)
* [git-reset](https://git-scm.com/docs/git-reset)

## Branches

Branches allow you to develop outside the main branch.  This is good for experimenting and collaborating.

* `$ git branch`
  * list branches, including current branch
  * default branch is usually "main"
  * if you haven't created any branches, that'll be the only one
* `$ git branch demo`
  * create the "demo" branch
* `$ git checkout demo`
  * switch to the demo branch
* You need to specify the upstream for the branch before you can "push" or "pull"
* We're not going to be using the workflow for branches, at least not now.
* To merge a branch
  ```
  $ git commit . -m "I made a such-and-such a change"
  $ git checkout main
  $ git merge demo
  ```
* To delete a branch after merging
  * `$ git branch -d branch`
* To delete a branch without merging
  * `$ git branch -D branch`

References: 

* [git branch](https://git-scm.com/docs/git-branch) -- git-scm.com
* [Git branching](https://git-scm.com/book/en/v2/Git-Branching-Basic-Branching-and-Merging) -- git-scm.com
* [About branches](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/about-branches)
* [Working with branches](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/about-branches#working-with-branches)

## Update a repository

You update the repository by "pushing to origin". This is okay if you're the only one working on the project.

```
$ git push origin main
```
If you've made a change, then you need first to commit
```
$ git commit . -m "I've made a such-and-such a change"  
$ git push origin main
```

## Pull requests

[Creating a pull request](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/creating-a-pull-request) -- github.com
