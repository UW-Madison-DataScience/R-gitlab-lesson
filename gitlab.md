---
title: "Syncing your project with GitLab"
teaching: 10
exercises: 2
---

:::::::::::::::::::::::::::::::::::::: questions

- How do you keep your project synced using GitLab?
- Why should you consider using UW-Madison instance of GitLab?

::::::::::::::::::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::: objectives

- Simulate how to pull and push between two different "computers".
- Discuss what are the advantages of using [UW-Madison Gitlab instance](https://git.doit.wisc.edu) vs Github.

::::::::::::::::::::::::::::::::::::::::::::::::

## Pushing and pulling between two computers

Let's pretend for a minute that you have a computer at home and one at work. It would be nice if your work is kept synced between the two locations. Git + GitLab can help with this.

We are going to simulate the two computers situations by creating a copy of your project in a different location on the computer your are working on.

The key dynamic we want to follow is *push and pull*.

1. After completing a task, *push* to the remote repo; that way your work is saved to GitLab.
2. When you got to your second device, *pull*; your saved work is pulled from the remote repo into your "work device".

### Creating a copy of the code on a "new work computer"

To create a copy of the project on your "work computer", we are going to practice cloning a project from GitLab

- Go to your repo on GitLab and grab the `Clone with HTTPS` url from the `Code` button. 
- On RStudio, go to `File` > `New Project`. This will open a popup window. Pick the `Version Control` option. Pick `Git` and click `Next`. 
- The next window gives you a place to paste the url you got from GitLab and the location on your computer to create the project. Navigate to your `Documents` folder and name the project `work-computer-ratdat`. 
- Click `Create Project`. Git will make a copy of your project in this new location. Now you have two computers to practice pushing and pulling from each other!

You many now have up two copies of the same project.  You can tell which one is meant to represent which computer by looking at the project name in the upper right hand corner.
The original "Desktop" project is called "ratdat_lib_wksp", where the 2nd computer is called "work-computer-ratdat".
If we were really working on them on separate computers, we would probably have kept them both with the same name,
but to illlustrate the different computers and practice syncying between them, we used the option to change the name when cloning it.

### Syncing code between the two computers using GitLab

Let's practice swtiching between our two computers.

While we are on our work computer we come up with a great idea for our plot, we should make this plot only with the more abundant species.
First, make sure you are in the "work-computer-ratdat" project.

:::::::::::::::::: challenge

### Filter Yearly Counts data to only Abundant Species

Edit your code to create an abundant species table, where the average species count across years is greater than 50, and then filter your `yearly_counts` data to only those species before plotting.

::::::::::: solution

### Abundant Species Plot Code

```r
library(ratdat)
library(tidyverse)

yearly_counts <- complete_old %>%
  count(year, species_id)

# only plot species with an average count above 50
abund_species <- yearly_counts %>% 
  group_by(species_id) %>% 
  summarize(avg_ct = mean(n)) %>% 
  filter(avg_ct > 50)

yearly_counts %>% 
  filter(species_id %in% abund_species$species_id) %>% 
  ggplot(aes(x = year, y = n,
             color = species_id)) +
    geom_line()+
    geom_point()
```

::::::::::::::::

::::::::::::::::::::::::::::::

:::::::::::::::::::::: challenge

Stage and commit the changes we just made in the "work-computer-ratdat" project.

:::::::::::::::::::::::::::::::

Note, since we haven't push these changes to GitLab it still has the old version of our script.
Push the changes to GitLab and see that those changes were synched.

The next day, you are working from home and want to get the lastest version of your code to work on.
Switch back to the "ratdat_lib_wksp" Project.
Notice that the code in the script is still the old code.  It does not automatically sync.
Use the blue down arrow to `pull` down changes from GitLab before starting work for that day.
Note, don't click the dropbox arrow as that does a special type of pull that we don't need for this workflow.

## Summary

This git workflow allows you to keep repos synced between two computers.
Best practice is to always push your changes when you are done working and to always pull the lastest version when you start.
Sometimes things will fall out of sync because you forgot to push or pull.
Those changes can be merged together in different ways and sometimes you have to resolve a conflict if you've changed the same line in two separate git histories.
When you start using more complex git workflows or collaboration, this will also add some complexity.

::::::::::::::::::::::::::::::::::::: discussion

## How does this worklow affects you? 

- Does your usual workflow requires using two computers?
- Do you see yourself using this workflow on a daily basis?
- What challenges do you anticipate?  

:::::::::::::::::::::::::::::::::::::::::::::::

## Why you might choose to use GitLab or GitHub (over the other)

### GitLab

- You might want to have your project associated with UW-Madison, for publication purposes, for example.  
- For advanced users, you might want to take advantage of integrations  with resources. Being on campus IP space and using AD for authentication facilitates that process. 
- GitLab code base is open source, which means you can modify and extend it to suit your needs. That is why UW-Madison GitLab instance is hosted and maintained at UW-Madison. 

### GitHub

- If you have lots of off-campus collaborators or plan to make the project open source, GitHub may be a better option.


It is, however, fairly easy to move repos from GitLab to GitHub and vice versa. You start on one and later decide to move to other. 

