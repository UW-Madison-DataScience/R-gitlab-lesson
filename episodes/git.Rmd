---
title: "Using git in RStudio"
teaching: 10
exercises: 2
---

:::::::::::::::::::::::::::::::::::::: questions 

- How do I setup a repository in GitLab?
- How do I use git to record the history of my code in Rstudio?

::::::::::::::::::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::: objectives

- Identify the location and functionality of Git integration within RStudio
- Create a repository in GitLab for version control
- Clone a GitLab repository as a project in RStudio
- Make changes to the project, add, and commit them using git

::::::::::::::::::::::::::::::::::::::::::::::::

## Introduction

This lesson will pick up using the ratdat / portal dataset we used in the previous sessions.

To get started we need to setup the project we are going to be working with (both in R/RStudio and in GitLab).
You can setup the project first in either place but for this example we will start by creating the repository in GitLab.

## Configuring Git on You computer

Each time we save something into our git history, it associates an email address and a name with it.
Before we get started we will need to configure those using a package called `usethis`.

First we will install `usethis` in the console by typing:

```r
install.packages("usethis")
```

Once it finishes we will configure the `user.name` and `user.email` variables to use.

```r
usethis::use_git_config(user.name="Your Name", user.email="your.email@example.com")
```

Finally, you can check your configuration
```r
usethis::git_sitrep()
```

## Setting up the GitLab Project

First you need to navigate to the [UW-Madison GitLab instance][uw-gitlab] and select the UW-Madison NetID login option.

Next we will create a new project. You can do so by clicking the "+" button then "New project/repository" option in the upper-left hand of the screen OR you can click the blue "New Project" button on the right hand side of the screen. If you do not see the "+" button, it might mean that your sidebar is hidden. To see the sidebar, click the sidebar icon at the top left of your screen.

<!--- screenshot needed: gitlab interface highlighting the + button and new project/repo and new project button -->

On the "Create new project" page, choose "Create blank project".

<!--- screenshot needed: Create new project page -->

We will call our project, `ratdat_lib_wksp`.
Note, if you belong to any organizations (like from your dept or lab), you may need to change the project URL to your user instead of the organization.
It will automatically assign the "Project slug" (aka the end of the url for that project) to be the same as the project name.
If you use spaces in your project name, it will replace them with `-` in your project slug.
You also need to choose the visiability level. You will want to think carefully about what visiability level makes sense for your projects in the future.
Things to consider include if you want to share it with your lab/team members, others at UW, or make it public for anyone to see/use which can be helpful if you need it to be public for publication.
Working in open source, you typically will make a project open unless there is a good reason to keep it private.
You can change this setting later if you decide to do so.
For this project, we will all make the repository **private**. For learning purposes, this will help us all be required to authenticate with GitLab at the same time.
When a repo is public, it doesn't require you to authenticate when you put it on your computer from GitLab but it will require authentication when you want to sync changes you made on your computer to GitLab.
You can decide if you would like it to create a README for your project when you set up future projects.  Best practice is to have a README for any project so we will keep it checked for this practice example.
We will skip the option for security testing but this could be an option you want to enable for your code projects.
Then click the "Create project" button.

<!--- screenshots needed: the create new project page with the options given in the paragraph above highlighted-->

Now that we have created the project we can see the repository.  It created a nice README template at the bottom.

<!--- screenshot needed: view of the project repo after creation -->

::::::::: instructor 

You may want to give a short orentation to the different parts of the GitLab project webpage that seem relevant here:
For example:
- the file list
- issues/merge requests on the left pane
- project info on the right side (license, changelog etc)

::::::::::::::::::::

## Setting up the Project in RStudio

Next we will `clone` (copy) this project to our computer and make it a project in RStudio.
Before we can do so we need to set up verifying our identity with GitLab.

### GitLab Authentication 

We need to set up a special passkey called a Peronal Authenticalion Token (PAT) on GitLab and then we will enter it in RStudio when we need to connect to GitLab.

We need to note both our GitLab username and your PAT so we can use them when we set up the Project on our computer.
In GitLab you can check your username by clicking on your profile icon in the upper left panel. It will say `@FIRSTNAME.LASTNAME` or your `@NetID`, or something to that effect.
Note down your username in a text file so you have it available when you need it later.

To setup the PAT, click the "Settings" option on the left hand side (bottom of the left pane), then choose "Access Tokens".

On the "Project access tokens" page, click the "Add new token" button. Give the token a name specific to the computer you are working from. You can leave the Token description blank.
By default, it will expire in a month.  We will leave that setting for now and if you use GitLab after a month, you should go back and give it further permissions or create a new token.
Select "Owner" as the role.
You can leave all the options under "Select Scopes" unchecked, these would be needed if you were setting fine-grained permissions for your token.
Then click "Create project access token".

It will then show the project token in a green box on the screen but we won't be able to access it again so we need to copy it now (we can always setup others if needed later).
Click the copy button to copy the token. Copy this into a text file.


Now that we have set up the authentication, we can create the Project on our computer and setup the connection to GitLab, at the same time.
In GitLab, return to your new project directory `ratdat_lib_wksp` by clicking the link at the top of the page. Then click the blue "Code" button at the top of the directory information.
Then click the copy button to the right of the "Clone with HTTPS" option.

<!--- screenshot needed: the code menu and the copy button from the clone with HTTPS option highlighted"

Open RStudio and create a new project with the +shield icon or `File` > `New Project`.

<!--- screenshot needed: highligting the new project button -->

In the new project wizard, click the "Version Control" option.
On the next page, click the "Git" option.
Paste the HTTPS address you copied in the "Repository URL" option.
It will autofill in the "Project directory name" box with the slug from the URL when you click away from that box, but you can change it if you ever need to (which you will later).
You may want to change where the project is created in your file system, by default it will likely save it in your home folder/`~`.
We will change ours to Desktop so we can find it more easily by clicking the "Browse" button, and then choseing our `Desktop` folder and clicking "Open".
We can then click the "Create project" button.

<!--- screenshots needed of all the project wizard pages with the inputs described above -->

Since we've never authenticated with GitLab before it will ask us for our username.
Type or paste your username and token from the text file into the the username and password boxes respectively.

Now you are in the project for the GitLab Project you set up.  You will see the project name in the upper right-hand side of the page.
The file pane in the lower right quadrant of RStudio will also show the...
    - `.gitignore` - a file that allows you to have untracked files in the folder on you computer that in the project folder - this was created when we setup the Rproject so git doesn't try to tack some R files that commonly are not tracked with git
    - `ratdat_lib_wksp.Rproj` - the Rproject folder (this is nice for reopening your project from the file folder) - this was created when we set up the Rproject since it didn't already exist
    - `README.md` - The documentation file that GitLab created for us when we set up the project


## Tracking files with git and RStudio

Let's go check out the "Git" file pane in the upper right quadrant!  It wasn't there until we cloned this git repository/project.
It currently lists the two files that were created when we set up the project, `ratdat_lib_wksp.Rproj` and `.gitignore`.
This is because these are new files that have not been tracked with git before.

To track these files in our repository we have to do two steps, first we stage the files and then we commit them to the history of the project/repo.
To stage the files in Rstudio, we can click the checkboxes in the "Staged" column of the Git pane.
When we do this, the status of each file changes from "? ?" to "A" for "Added to the stage".
Then to commit them, we can click the "Commit pending changes" icon in the Git pane.

This pops up a window to "Review Changes" where we can click through the files and see what has changed.
Since both these files are new, they show a big green section of lines in the files.  This is called the "diff" it shows the difference before and after the commit. In this case, all new lines were added and are in green.
We could also unstage/reset the files if we decide we don't want to commit them both at the same time (typically you will commit linked changes together but can commit unlinked changes separately).

To commit these changes we also have to write a message about what has changed in this commit in the "Commit message" box.
We will type, "Adding Rproj and gitignore files" and then we can click "Commit"

A git commit window will pop up and have a message that includes a unique identifier code for the commit (called a hash), our commit message, and a summary of what changed in that commit.
We can then click "close" on the window. We can also close the "Review Changes" window.
Now all the files in our project have been tracked with git.  We can tell by looking at the "Git pane" because there are not files listed.
This means there are no new files and no new changes to existing files in our project since we last committed it.


::::::: challenge

### Create an R script

Let's practice adding new files and tracking them with git.

Create and Rscript with the following code and then track it with git using the steps we learned.

```r
library(ratdat)
library(tidyverse)

yearly_counts <- complete_old %>%
  count(year, species_id)

ggplot(yearly_counts,
       aes(x = year, y = n)) +
       geom_line()
```


::: solution

1. Copy the code above
2. Create a new Rscript file
3. Paste the code into the Rscript
5. Run your R code. Make sure it works before we commit it.
4. Add the file by clicking the staged checkbox in the Git pane
5. Click the commit button in the Git pane
6. Add a commit message and click "Commit"

:::::::::::::

:::::::::::::::::

Now that we have created the file, we notice that our plot looks a bit odd, we need to tell it the groups are the species id's and should be separate lines. 
We can color the lines differently at the same time by adding `color = species_id` to our `aes()` function
Let's do so and then save that new version of the file to git.

The code should now be
```r
library(ratdat)
library(tidyverse)

yearly_counts <- complete_old %>%
  count(year, species_id)

ggplot(yearly_counts,
       aes(x = year, y = n,
           color = species_id)) +
       geom_line()
```

Now that we've made this change, we can commit this new version. Like new files, modified files show up in the Git pane.
Notice this time the status is "M" for modified instead of "? ?" like it was for a new file.
We can still stage it and commit it just as we did with the new file by clicking the checkbox to stage it, clicking commit, then adding a commit message.
Note, before you commit that the Review Changes window how shows red for the previous lines in our code and green for the new lines in our code.
Also the number lines for the removed lines are in the first column and the numbers for the new lines are in the second column.

## Exploring the history of our file changes

The Git pane has several other features for working with git in RStudio, the other one we will point out is the history part of the "Review Changes" window.
To open it directly you can click the click icon on the Git pane menu.
You can access it by clicking the "History" toggle in the Review Changes window, when it is already open.
The history pane now shows the "timeline" of commits we've added so far, authorship info, and we can click through them to see the diffs for each one. 

## Time to push it!

Finally we can sync these changes with GitLab.  Everything, besides the original setup, we have done so far has been on our local computer.
If we reload the GitLab project, nothing has changed.  The commits we made aren't there, nor is the script we created.
To get our changes to GitLab we have to "push" them.
In the git pane, we can click the green up arrow. This will then pop up a status as it transfers the changes.

Now in GitLab we can reload the page and we can see the script and our most recent changes.  
In GitLab, try exploring the files by clicking on them. You can also see the commits and their diffs by clicking on the "X commits" (where X is the number of commits you've made) link
in the right hand "Project Information" menu or by clicking "Code" and "Commits" buttons on the left hand GitLab menu.

We've now learned the basis of working with git and GitLab in Rstudio. The setup steps will only need be done once per repository or computer.
The snapshot steps of checking the box (adding a file to stage) and commiting will be done each time you create or modify a file (script).
The syncying step(s) of pushing (and pulling which we will see in the next section) will be done at least when you come to a stopping point (or starting point for pushing).
