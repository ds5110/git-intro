
# github classroom

Directions for instructors to create a github-classroom assignment. (See below for classroom setup.)

## Step 1: Create a template repo

* Turn a repo into a template in the repo's settings; right after you create the repo -- there's a checkbox
* The template repo should have a README.md with the assignment

## Step 2: Create a github-classroom assignment

* Create a new assignment in github-classroom so you can get the link
* Use the template repo you created in step 1

## Step 3: Add the assignment to Canvas

* Create an assignment that has a URL as the submission type
* Indicate the number of points
* Then provide this guidance in Canvas assignment:
```
Here's the link to the github-classroom assignment

<add invitation link here>

* Organize your repo so that your major results are presented in the README.md
* Provide instructions for reproducing those results
* In Canvas, submit a link to your repo when you're done

Let your instructors know if you have any questions.
```

## Create an assignment (detail)

* make a template private repo in the ds5110 organization
  * that is, do it here: http://github.com/ds110
  * do this before creating an assignment with github-classroom
  * make sure the template repo is in fact a "template" repo -- remember to check the checkbox in settings
  * copy the README.md from the solution folder -- edit the file so it contains only the questions -- no solutions
* return to github-classroom and use this as the template for an assignment
  * click "Create an assigment"
  * create the assignment from the template
  * Do this after authenticating with credentials that can access to the template repo
  * IMPORTANT: to reuse a template from a previous year -- edit the template or it won't appear as an option!!
  * Q: Why does github classroom work this way?  A: Who the heck knows. But it does.
* Copy the invitation URL into canvas

## Create a classroom

Do this at the beginning of the semester

* Go to https://classroom.github.com/classrooms
  * Click on "New classroom"
  * Add TAs and admins
  * NOTE: TAs must be "owners" of the associated "organization"
* Register students
  * Easy with a list of email addresses (add them all at once)
  * Currently it's not possible to connect github-classroom directly to canvas
  * Ref: https://docs.github.com/en/education/manage-coursework-with-github-classroom/teach-with-github-classroom/connect-a-learning-management-system-to-github-classroom#connecting-to-canvas-moodle-sakai-and-other-lmses
