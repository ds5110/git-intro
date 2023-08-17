
# github classroom

Directions for creating a github-classroom assignment

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

## Create an assignment

* make a template repo in the ds51109 organization
  * do it here: http://github.com/ds110 (or somewhere that's publicly accessible)
  * do this before creating an assignment with github-classroom
  * make sure the template repo is in fact a "template" repo -- remember to check the checkbox in settings
* create an `assignment.md` from the solution folder
  * for example: `cp hw-gapminder-solution/README.md assignment.md`
  * the edit this file so it contains only the questions -- no solutions
* clone the template repo
  * for example: `https://github.com/pbogden/hw-gapminder.git`
* add assignment to the template
  * for example: `cp assignment.md hw-gapminder/README.md 
* return to github-classroom and use this as the template for an assignment
  * do this with northeastern credentials
  * make sure my northeastern account has access to the template repo
* go to github classroom logged in with my northeastern credentials (in this case for Fall 2022)
  * for example: https://classroom.github.com/classrooms/82665678-ds5110-fall22
  * click "Create an assigment"
  * create the assignment from the template

## Create a classroom

Do this at the beginning of the semester

* Go to https://classroom.github.com/classrooms
  * Click on "New classroom"
  * Add TAs and admins
* Register students
  * Easy with a list of email addresses (add them all at once)
  * Currently it's not possible to connect github-classroom directly to canvas
  * Ref: https://docs.github.com/en/education/manage-coursework-with-github-classroom/teach-with-github-classroom/connect-a-learning-management-system-to-github-classroom#connecting-to-canvas-moodle-sakai-and-other-lmses
