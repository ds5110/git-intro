# setup

Instructions for setting up a Python environment for data science -- some opinionated recommendations (with references).

* If you follow these recommendations (and related references), I can help you troubleshoot problems.
* There are many ways to set things up. If you have something else that works, you can stay with it. 
* However, beware that some installations and conflicting software versions can cause huge headaches.

## 1. Install miniconda on Linux

* Detailed instructions are here: [conda.md](conda.md)

## 2. Install vscode

You need a text editor. I recommend vscode -- a free visual text editor and IDE from Microsoft.

* https://code.visualstudio.com/download
* vscode has issues, especially if you're using a Mac, but they can usually be resolved.
* vscode is free (owned by microsoft)

## 3. Install make

If you don't have it already, then you can install it with conda...
```
conda install -c conda-forge make
```
Ref: https://anaconda.org/conda-forge/make

## Platform-specific detailed stuff

### WSL

Detailed instructions for installing WSL and some other useful things...

* [Install WSL](https://learn.microsoft.com/en-us/windows/wsl/install)
  * Very easy. Open powershell/command prompt (windows jargon for the built-in terminal)
  ```
  wsl --install
  ```
* Verify that you're using Linux...
  ```
  which curl
  ```
  should return: `/usr/bin/curl`
* Install make
  ```
  sudo apt-get install make
  ```
  Verify that it worked...
  ```
  which make
  ```
  should return: `/usr/bin/make`
* Enable copy/paste into the terminal from the clipboard
  * [Copy and Paste Arrives for Linux/WSL Consoles](https://devblogs.microsoft.com/commandline/copy-and-paste-arrives-for-linuxwsl-consoles/) -- microsoft.com
* Install miniconda
  * Use the directions for [Installing on Linux](https://docs.conda.io/projects/conda/en/stable/user-guide/install/linux.html)
  * Download the miniconda installer
    * Go to: https://docs.conda.io/en/latest/miniconda.html
    * Download the installer for your architecture (I had to use the nonstandard "Miniconda Linux-aarch64 64-bit")
    * The browser will download the file to your windows C drive
* Where's the C drive?
  * The C drive is available in Linux as `/mnt/c`
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

### My experience on a mac

* For my old Intel Mac, I downloaded "Miniconda3 macOS Intel x86 64-bit bash"
* Checked the hash with `shasum -a 256 ~/Downloads/Miniconda3-latest-MacOSX-x86_64.sh`
* Followed the regular installation [here](https://conda.io/projects/conda/en/stable/user-guide/install/macos.html)
* With the command: `bash Miniconda3-latest-MacOSX-x86_64.sh`
  * When prompted with the following question:
  ```
  Do you wish the installer to initialize Miniconda3
  by running conda init? [yes|no]
  ```
  * I responded with "yes" -- don't get impatient, because the default response is no
* I opened a new terminal shell and my prompt began with "(base)" -- so the base environment was running
* And I had python installed. `which python` returns `/Users/pbogden/miniconda3/bin/python`
* And `python --version` returns `Python 3.10.8`

### vscode terminal on Mac

* The problem: vscode's integrated terminal wasn't using my conda environment
  * Why? Because Microsoft still doesn't play real well with Mac
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

## matplotlib on an old Mac

* Problem: My terminal would occasionally hang on my laptop using an old version of the MacOS
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

### seaborn issue on an older Mac

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
Or, to avoid using matplotlib, add the following to `~/.zprofile`:
```
# Avoids seaborn hang on my old macbook pro
export MPLBACKEND=qtagg
```
