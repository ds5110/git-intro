# setup

Instructions for setting up a Python environment for data science -- some opinionated recommendations (with references).

* If you follow these recommendations (and related references), I can help you troubleshoot problems.
* There are many ways to set things up. If you have something else that works, you can stay with it. 
* However, beware that some installations and conflicting software versions can cause huge headaches.

## command-line reproducibility

Anyone should be able to run your code from the command line on some flavor of Linux.

* If you're already using Linux, great.
* If you're using a Mac, you're all set.
  The built-in terminal is great and, under the hood, macOS is a "flavor" of Linux (my favorite). 
* If you're using Windows and you don't want to buy a Mac, 
  I recommend Windows Subsystem for Linux (WSL)
  * There's good documentation on 
  [Developing with WSL](https://code.visualstudio.com/docs/remote/wsl).
* Warning: the WSL terminal is not PowerShell!!  The PowerShell is not Linux!

## 1. Install conda

* Detailed instructions are here: [conda.md](conda.md)

## 2. Install vscode

You need a text editor. I recommend vscode -- a free visual text editor and aspiring IDE owned by microsoft.

* Install instructions: https://code.visualstudio.com/download
* If you're using WSL, follow their directions.
* vscode has issues and it's quirky (especially if you're using a Mac) but it's 
  getting better all the time.
* vscode is extremely popular in the real world.

## 3. Install make and git

If you don't have them already, then you can install them with conda...
```
conda install conda-forge::git
conda install conda-forge::make
```
I use a Mac and I use `xcode-select --install` instead.

## WSL

If you're using macOS or Linux, skip this section. If you're using Windows, 
then Windows Subsystem for Linux (WSL) is a super easy install... 

* [Install WSL](https://learn.microsoft.com/en-us/windows/wsl/install)
  * Very easy. Open powershell/command prompt (windows jargon for the built-in Windows terminal)
  ```
  wsl --install
  ```
* Follow [their instructions for setting up a development environment](https://learn.microsoft.com/en-us/windows/wsl/setup/environment)
* Follow [their instructions for installing vscode](https://code.visualstudio.com/docs/remote/wsl).
* From now on, you should use the WSL terminal -- NOT powershell!!
* Verify that you're using Linux...
  ```
  which curl
  ```
  should return: `/usr/bin/curl`
* Q: Where's the C drive?  A: The C drive is available in Linux as `/mnt/c`

