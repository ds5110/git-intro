
# Classroom50

Cheatsheet for instructors & TAs creating assignments with [Classroom50](https://classroom50.org/).
The [Classroom50 wiki](https://github.com/foundation50/classroom50/wiki) is the authoritative source -- follow it for step-by-step instructions.

GitHub Classroom shut down in 2026. Classroom50 is its free, open-source replacement from the
Fifty Foundation (the nonprofit behind Harvard's CS50). There's no Classroom50 server: classrooms,
rosters, and assignments live in our github organization ([ds5110](https://github.com/ds5110)).

## Once: set up the organization

* The organization must be on github's free-for-teachers Team plan, and you run a one-time setup:
  [prerequisites](https://github.com/foundation50/classroom50/wiki/Prerequisites-and-GitHub-Education),
  [quickstart](https://github.com/foundation50/classroom50/wiki/Quickstart).
* Apply for the GitHub Education teacher benefit well before the semester (approval can take a week or two).

## Each semester: create a classroom

* Follow the [web teacher guide](https://github.com/foundation50/classroom50/wiki/Web-Teacher-Guide).
* Give TAs the **TA** role. **Teacher** makes someone an organization owner, so use it sparingly.
  ([Staff and TAs](https://github.com/foundation50/classroom50/wiki/Staff-TAs-and-Multiple-Teachers))
* Upload the roster with students' northeastern.edu email addresses.
  Students must accept the organization invitation before assignment links work for them.

## Each assignment

1. **Template repo:** private, in the ds5110 organization, marked as a template, with the assignment in the README.md
   ([assignment templates](https://github.com/foundation50/classroom50/wiki/Assignment-Templates)).
   * **IMPORTANT:** Never commit solutions to the template repo, not even temporarily.
     Students can read the template's commit history. Keep solutions in a separate repo.
2. **Classroom50 assignment:** use the template, with submission type "Every push to the default branch"
   and grading "Manual". Copy the accept link from the assignment's "Share" button.
3. **Canvas:** Classroom50 doesn't integrate with Canvas, so create a Canvas assignment
   with a URL submission type and the number of points, and add this guidance:
```
Here's the link to the Classroom50 assignment

<add accept link here>

* Organize your repo so that your major results are presented in the README.md
* Provide instructions for reproducing those results
* In Canvas, submit a link to your repo when you're done

Let your instructors know if you have any questions.
```

## Gotchas

* Due dates mark work "Late" but don't stop students from pushing. "Close submission" makes student repos read-only.
* Student repos are copies of the template, not forks. If you fix the template after students accept, tell them.
* Tell students not to rename their repos (renamed repos disappear from the submissions page).
* More: [known limitations](https://github.com/foundation50/classroom50/wiki/Known-Limitations),
  [FAQ](https://github.com/foundation50/classroom50/wiki/FAQ),
  [troubleshooting](https://github.com/foundation50/classroom50/wiki/Troubleshooting).

## End of semester

* Close submissions, download scores and submissions, archive the classroom, and reuse assignments
  next semester: [course lifecycle](https://github.com/foundation50/classroom50/wiki/Course-Lifecycle-and-End-of-Term).
