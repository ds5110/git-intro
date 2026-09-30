# setup

Opinionated recommendations for setting up a development environment for
data science and web development (with references).

* If you follow these recommendations (and related references), I can help you troubleshoot problems.
* There are many ways to set things up. If you have something else that works, you can stay with it.
* However, beware that conflicting dependencies can cause huge headaches.

## 0. A Unix-like command line

Anyone should be able to run your code from the command line on a "Unix-like" OS.

* **Linux:** great, you're set.
* **Mac:** also great. The built-in Terminal is all you need; under the hood, macOS is Unix-like.
* **Windows:** use Windows Subsystem for Linux (WSL), which runs Linux inside Windows.
  Set it up *before* the steps below (see [Windows users](#windows-users)).

Can't get any of these working (e.g., a locked-down work laptop)? See [Codespaces](#codespaces-fallback).

## 1. Install conda

* See: [conda.md](conda.md)

## 2. Install vscode

You need a text editor. I recommend vscode. It's extremely popular in the real world.

* Install instructions: https://code.visualstudio.com/download
* **Mac:** open the Command Palette (Cmd+Shift+P) and run
  "Shell Command: Install 'code' command in PATH" so `code .` works in the terminal.
* **WSL:** install vscode on Windows, add the WSL extension, and always open projects
  by running `code .` from the WSL terminal
  (see [Developing in WSL](https://code.visualstudio.com/docs/remote/wsl)).

## 3. Install make and git

* **Linux / WSL (Ubuntu):**
  ```
  sudo apt update
  sudo apt install git make
  ```
* **Mac:** install the Xcode Command Line Tools from Apple:
  ```
  xcode-select --install
  ```
* **Fallback (any platform):** conda-forge has both. Note that these exist only
  inside the conda environment where you install them.
  ```
  conda install conda-forge::git conda-forge::make
  ```

Then see [git.md](git.md) for setting up and using git.

## 4. Node.js (for web projects)

* See: [node.md](node.md)

## 5. AI coding assistants (optional)

* Encouraged, with conditions. See: [llm-policy.md](llm-policy.md)
* Check [GitHub Education](https://education.github.com/) for current student benefits,
  which have included free access to GitHub Copilot.

## Windows users

If you're using macOS or Linux, skip this section.

* [Install WSL](https://learn.microsoft.com/en-us/windows/wsl/install) -- microsoft.com.
  It's easy: open PowerShell as administrator, run the command below, and restart.
  ```
  wsl --install
  ```
* Follow [Microsoft instructions for setting up a development environment](https://learn.microsoft.com/en-us/windows/wsl/setup/environment).
* From now on, use the WSL terminal, NOT PowerShell!! PowerShell is not Linux,
  and mixing the two causes a lot of confusion.
* To verify that you're in Linux, try:
  ```
  uname -s
  ```
  It should print `Linux`.
* Install everything (conda, git, make, Node) *inside* WSL, and don't mix in
  Windows versions of the same tools. WSL can see Windows programs on your PATH,
  so if `which python` or `which npm` shows a path starting with `/mnt/c/`,
  you're using the Windows version by mistake.
* Q: Where's the C drive? A: It's available in Linux as `/mnt/c`.
  But keep your repos in your Linux home directory (e.g., `~/projects`), not under `/mnt/c`.
  File access across that boundary is slow, and installs will crawl.

## Codespaces (fallback)

If your own machine won't cooperate, [GitHub Codespaces](https://docs.github.com/en/codespaces)
gives you a Linux environment with vscode in the browser. Open your repo on GitHub,
click **Code → Codespaces**, and follow the Linux instructions above.
There's a free monthly allowance, and verified students get more through
[GitHub Education](https://education.github.com/). Stop your codespace when you're done
so it doesn't use up your hours.
