# setup

Opinionated recommendations for setting up a Python environment for data science (with references).

* If you follow these recommendations (and related references), I can help you troubleshoot problems.
* There are many ways to set things up. If you have something else that works, you can stay with it. 
* However, beware that conflicting dependencies can cause huge headaches.

## command line

Anyone should be able to run your code from the command line on a "Unix-like" OS.

* If you're already using Linux, great.
* If you're using a Mac, that's also great.
  The built-in terminal is all you need. Under the hood, macOS is Unix-like.
* If you're using Windows and you don't want to buy a Mac, I recommend Windows Subsystem for Linux:
  [WSL](https://learn.microsoft.com/en-us/windows/wsl/install).
  * WSL is a Microsoft's setup for running Linux in Windows.
  * There's good documentation on 
  [Developing with WSL](https://code.visualstudio.com/docs/remote/wsl).
  * Warning: the WSL terminal is not PowerShell and the PowerShell is not Linux! This often causes confusion.

## 1. Install conda

* See: [conda.md](conda.md)

## 2. Install vscode

You need a text editor. I recommend vscode.

* Install instructions: https://code.visualstudio.com/download
* If you're using WSL, follow their directions.
* vscode has issues and it's quirky (especially if you're using a Mac) but it's 
  getting better all the time.
* vscode is extremely popular in the real world.

## 3. Install make and git

* If you're using Linux, then you probably have them already.
* If you're using a Mac, you'll get them by installing Xcode Command Line Tools from Apple:
  ```
  xcode-select --install
  ```
You can get them from conda-forge...
```
conda install conda-forge::git
conda install conda-forge::make
```

## Windows users

If you're using macOS or Linux, skip this section. If you're using Windows, 
then Windows Subsystem for Linux (WSL) is a super easy install... 

* [Install WSL](https://learn.microsoft.com/en-us/windows/wsl/install) -- these are Microsoft docs.
  * Very easy. Open powershell...
  ```
  wsl --install
  ```
* Follow [Microsoft instructions for setting up a development environment](https://learn.microsoft.com/en-us/windows/wsl/setup/environment)
* Follow [Microsoft instructions for installing vscode](https://code.visualstudio.com/docs/remote/wsl).
* From now on, use the WSL terminal -- NOT powershell!!
* Verify that you're using Linux, for example...
  ```
  which curl
  ```
  should return: `/usr/bin/curl`
* Q: Where's the C drive?  A: The C drive is available in Linux as `/mnt/c`
