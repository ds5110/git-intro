# LLM policy

Use of LLMs and AI coding agents is encouraged. Two rules: **don't trust; verify** and **own what you submit**.

## Don't trust; verify

* LLMs make mistakes, often confidently and without throwing errors or warnings --
  that's the hardest kind of bug to catch.
* Verify everything against authoritative sources. LLMs are not authoritative sources.
* Test.

## Own what you submit

* Be ready to explain in detail any code an agent produces for you.
* Collaborate with git branches & PRs -- https://docs.github.com/en/get-started/using-github/github-flow
* Document your work with clear, well-explained PRs -- https://google.github.io/eng-practices/
* Reproducibility is paramount -- provide enough info so that a peer could easily reproduce
  your results, end to end (see the example in [README.md](README.md)).
* Say which AI tools you used and for what, in your README or PR. Acknowledging your
  sources applies to LLMs too, and LLMs won't do it for you.
* If you give an agent instructions in a context file (e.g., `CLAUDE.md`, `AGENTS.md`),
  commit it. It documents how the code was produced.
* Don't submit LLM slop: code you haven't read, unused or duplicated code, verbose filler,
  or references you haven't checked.

## Protect data, secrets, and your machine

* Don't paste private data, PII, passwords, or API keys into an LLM.
* Coding agents can read files in your project, including `.env` and `./data`.
  Know what's there before you let an agent work in a directory.
* Review what an agent wants to install or run before you approve it. LLMs sometimes
  suggest packages that don't exist, and attackers register those names
  (see the supply-chain section of [node.md](node.md)).

## Working with LLMs and coding agents

* Agents shift the emphasis from writing code to reading it: expect to spend more of your
  time interpreting and verifying generated code.
* Agents help most with boilerplate, data profiling, and debugging. Human judgment still
  matters most for asking the right questions and separating signal from noise.
* If you're unsure how to use LLMs as a coach or colleague, reach out to your instructor.
