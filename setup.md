# setup

Instructions for setting up a Python environment for data science -- some opinionated recommendations (with references).

* If you follow these recommendations (and related references), I can help you troubleshoot problems.
* There are many ways to set things up. If you have something else that works, you can stay with it. 
* However, beware that some installations and conflicting software versions can cause huge headaches.

## command-line reproducibility

Anyone should be able to run your code from the command line on some flavor of Linux.

* If you're using a Mac, you're all set -- the built-in terminal is great and, under the hood, macOS is a "flavor" of Linux (my favorite). So, if you're using Linux or a Mac, proceed immediately to the next section.
* If you're using Windows and you don't want to buy a Mac, I recommend Windows Subsystem for Linux, also known as WSL [(see below)](#WSL).
  * On windows, it's important that you install WSL first. 
* In the old days, when WSL was young (last year, more or less), I'd recommend the following sequence, but not anymore:
  * ~~Then proceed below using WSL, NOT windows!!~~
  * ~~Once you install WSL, use the WSL terminal (**NOT** powershell) and install things for Linux (NOT windows!!)~~
* microsoft has since put some effort into fixing WSL so that windows works well with Linux, so nowadays, follow...
  * [their instructions for installing vscode](https://code.visualstudio.com/docs/remote/wsl) after you install WSL
  * You'll almost surely need the so-called "WSL extension", which apparently fixes a lot of the issues that I had in the "old days" (i.e., early 2024)
  * Once you get your windows machine to work like Linux, then it's time to celebrate. After all, it took microsoft more than a decade to get rid of IE.
  Now that Bill's gone, things seem to be improving relatively quickly.
* After you get WSL and vscode working. Then proceed below using WSL, NOT windows!!
  * And when you're working outside vscode, make sure you're using the WSL terminal (**NOT** powershell).

## 1. Install miniconda

* Detailed instructions are here: [conda.md](conda.md)

## 2. Install vscode

You need a text editor. I recommend vscode -- a free visual text editor and aspiring IDE owned by microsoft.

* install instructions: https://code.visualstudio.com/download
* if you're using WSL, then look here: https://code.visualstudio.com/docs/remote/wsl
* note: vscode has issues and it's quirky (especially if you're using a Mac) but it's getting better all the time
* vscode is extremely popular in the real world

## 3. Install make and git

If you don't have them already, then you can install them with conda...
```
conda install -c conda-forge make
conda install -c conda-forge git
```
If you're using a Mac, I recommend the conda version of git so you can use SSH to authenticate on github.

## WSL

If you're using macOS or Linux, skip this section. And if you have a modern laptop and vscode is working well, skip the rest of the document. If you're using Windows, then Windows Subsystem for Linux (WSL) is a super easy install... 

* [Install WSL](https://learn.microsoft.com/en-us/windows/wsl/install)
  * Very easy. Open powershell/command prompt (windows jargon for the built-in Windows terminal)
  ```
  wsl --install
  ```
* Follow [their instructions for installing vscode](https://code.visualstudio.com/docs/remote/wsl).
* From now on, you should use the WSL terminal -- NOT powershell!!
* Verify that you're using Linux...
  ```
  which curl
  ```
  should return: `/usr/bin/curl`
* The instructions below are getting old -- WSL seems to be improving.
* Enable copy/paste into the terminal from the clipboard
  * [Copy and Paste Arrives for Linux/WSL Consoles](https://devblogs.microsoft.com/commandline/copy-and-paste-arrives-for-linuxwsl-consoles/) -- microsoft.com
* Install miniconda
  * IMPORTANT: 
  * Use the directions for [Installing on Linux](https://docs.conda.io/projects/conda/en/stable/user-guide/install/linux.html)
  * Download the miniconda installer
    * Go to: https://docs.conda.io/en/latest/miniconda.html
    * Download the installer for your architecture (I had to use the nonstandard "Miniconda Linux-aarch64 64-bit")
    * The browser will download the file to your windows C drive
* Where's the C drive?
  * The C drive is available in Linux as `/mnt/c`
  * In my case, it downloaded to `/mtn/c/Users/pbogj/Downloads`
* Use the built-in Linux `sha256sum` command for [cryptographic hash verification](https://docs.conda.io/projects/conda/en/stable/user-guide/install/download.html#cryptographic-hash-verification)
  * On the command line, it'll be something like...
  ```
  sha256sum /mnt/c/Documents\ and\ Settings/your.name/Downloads/Miniconda3-latest-Linux-X86_64.sh
  ```
* Install miniconda from the command line with something like...
  ```
  bash /mnt/c/Documents\ and\ Settings/your.name/Downloads/Miniconda3-latest-Linux-X86_64.sh
  ```
  * Be patient! Don't just hit return or you may respond incorrectly to the prompts...
  * Follow the instructions and accept all the defaults, including default activation
  * When it's done, you can verify that you have python with...
  ```
  which python
  ```
  this command should return something like `/home/yourname/miniconda3/bin/python`
  * Verify that it works with
  ```
  python --version
  ```
  which should return something like `Python 3.9.12`

## vscode terminal on Mac

* The problem: vscode's integrated terminal wasn't using my conda environment
  * Why? Because Microsoft still doesn't play real well with Mac
  * UPDATE (late 2024): vscode seems to have improved, so instructions below are probably out of date...
* The solution:
  * In vscode, navigate to `code->preference->setting->Features->Terminal->Integrated>Env:Osx` 
  * Choose `edit in settings.json`
  * Add the following
```
"terminal.integrated.env.osx": {  
          "PATH": null
 }
```
* Restart vscode (e.g., from the command line: `vscode .`)
  * Then `which python` will point to python in the conda environment

## vscode -- enable key repeating on Mac when using vim mode

On the command line...
```
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabled -bool false
defaults write com.vscodium ApplePressAndHoldEnabled -bool false
defaults write com.microsoft.VSCodeExploration ApplePressAndHoldEnabled -bool false
```
* log out, then log back in
* See: [VSCodeVim ref docs](https://github.com/VSCodeVim/Vim#mac)

## matplotlib on an old (Intel) Mac

* Problem: My terminal would occasionally hang on my laptop using an old version of the macOS
* Solution: Add the following to `~/.zprofile` to avoid a hang with default backend

```
# Avoids matplotlib hang on my old macbook pro
export MPLBACKEND=qtagg
```
Or you can put the following in your code
```
# This uses a different backend (needed for my old Mac, so it doesn't hang on the command line)
import matplotlib
matplotlib.use('QtAgg')
matplotlib.use('TkAgg')
```

* [matplotlib backends](https://matplotlib.org/stable/users/explain/backends.html)

## seaborn issue on an older Mac

I encountered an issue on my older Mac.
For some reason (python not installed as a framework?), plt.show() with seaborn hangs my terminal.
Fix this by turning off interactive mode:
```
plt.ioff()
```
You can also fix this by using a different backend:
```
matplotlib.use('TkAgg')
```
List all the backends and the current backend with:
```
print(plt.get_backend())
print(matplotlib.rcsetup.all_backends)
```
Or add the following to `~/.zprofile`:
```
# Avoids seaborn hang on my old macbook pro
export MPLBACKEND=qtagg
```
