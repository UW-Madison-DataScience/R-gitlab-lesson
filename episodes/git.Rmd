---
title: "Using RMarkdown"
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
- Make changes to the project, add, and commit them using Git

::::::::::::::::::::::::::::::::::::::::::::::::

## Introduction

This lesson will pick up using the ratdat / portal dataset we used in the previous sessions.

To get started we need to setup the project we are going to be working with (both in R/RStudio and in GitLab).
You can setup the project first in either place but for this example we will start by creating the repository in GitLab.

First you need to navigate to the [UW-Madison GitLab instance][uw-gitlab] and login with your netid.

Next we will create a new project, you can do so by clicking the "+" button then "new project/repository" icon in the upper-left hand of the screen OR you can click the blue "New Project" button on the right hand side of the screen.

<!--- screenshot needed: gitlab interface highlighting the + button and new project/repo and new project button -->

On the "Create new project" page, choose "Create a blank project".

<!--- screenshot needed: Create new project page -->

We will call our project, `ratdat_lib_wksp`.
Note, if you belong to any organizations (like from your dept or lab), you may need to change the project URL to your user instead of the organization.
It will automatically assign the "Project slug" (aka the end of the url for that project) to be the same as the project name.
If you use spaces in your project name, it will replace them with `-` in your project slug.
You also need to choose the visiability level.  You can decide what level of visibility you would like your project to have.
I'll make mine public so I can share it with you direclty if you are interested.
You can also decide if you would like it to create a README for your project.  Best practice is to have a README for any project so we will keep it checked.
We will skip the option for security testing but this could be an option you want to enable for your code projects.
Then click the "Create project button".

<!--- screenshots needed: the create new project page with the options given in the paragraph above highlighted-->

Now that we have created the project we can see the repository.  It created a nice README start, that is show at the bottom.

<!--- screenshot needed: view of the project repo after creation -->

::::::::: instructor 

You may want to give a short orentation to the different parts of the GitLab project webpage that seem relevant here:
For example:
- the file list
- issues/merge requests on the left pane
- project info on the right side (license, changelog etc)

::::::::::::::::::::

Next we will `clone` (copy) this project to our computer and make it a project in RStudio.

First in GitLab we need to click the blue "Code" button on the upper right of our GitLab project.
Then click the copy button to the right of the "Clone with HTTPS" option.

<!--- screenshot needed: the code menu and the copy button from the clone with HTTPS option highlighted"

Then switch over to your RStudio window and click the new project button (Or click File > New Project).

<!--- screenshot needed: highligting the new project button -->

In the new project wizard, click the "Version Control" option.
On the next page, click the "Git" option.
Paste the HTTPS address you copied in the "Repository URL" option.
It will autofill in the "Project directory name" box with the slug from the URL when you click away from that box, but you can change it if you ever need to.
You may want to change where the project is created in your file system, by default it will likely save it in your home folder/`~`.
We will change ours to Desktop so we can find it more easily by clicking the "Browse" button, and then choseing our `Desktop` folder and clicking "Open".
We can then click the "Create project" button.

<!--- screenshots needed of all the project wizard pages with the inputs described above -->

Since we've never authenticated with gitlab before it will ask us for our username.
We need to go back to GitLab and check our username and setup a personal access token (PAT).

In GitLab you can check your username by clicking on your profile icon in the upper left panel. It will say `@FIRSTNAME.LASTNAME` or something to that effect.  That is your username.
To setup the PAT, click the "Settings" option on the left hand side (bottom of the left pane), then choose "Access Tokens".

On the "Project access tokens" page, click the "Add new token" button. Give the token a name specfific to the computer you are working from.
By default, it will expire in a month.  We will leave that setting for now and if you use GitLab after a month, you should go back and give it further permissions or create a new token.
Select "Owner" as the role.
Then click "Create project access token".

It will then Show the project token in a green box on the screen but we won't be able to access it again so we need to copy it now (we can always setup others if needed later).
Click the copy button to copy the token. 

Now that we have copied the token, we need to put it into RStudio.
Back in RStudio, you need to enter the username you found in GitLab, then press "OK".
Then it will ask for your "Password", paste your token into the box and press "OK".




<!---
Outline:
- setup gitlab repo
- clone repo into rstudio project
- setup ssh key
- add code from previous session to script
- make changes to code from previous session
- push changes back to gitLab


-->
