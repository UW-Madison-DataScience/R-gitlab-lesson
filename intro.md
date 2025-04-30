---
title: "Introduction to Version Control and GitLab"
teaching: 10
exercises: 2
---

:::::::::::::::::::::::::::::::::::::: questions 

- What is Version Control?
- What is the difference between Git, GitHub, and GitLab?

::::::::::::::::::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::: objectives

- Understand the utility and benefits of automated version control systems.
- Differentiate between Git, GitHub, and GitLab.
- Explain why GitLab was chosen over other platforms like GitHub.

::::::::::::::::::::::::::::::::::::::::::::::::

*This lesson is based on [Software Carpentry's Git Novice Lesson](https://swcarpentry.github.io/git-novice/)* and images are reused from that lesson.

We'll start by exploring how version control can be used to keep track of what one person did and when. Even if you aren't collaborating with other people,
automated version control is much better than this situation:

!["notFinal.doc" by Jorge Cham, <https://www.phdcomics.com>](fig/phd101212s.png){alt='Comic: a PhD student sends "FINAL.doc" to their supervisor, but after several increasingly intense and frustrating rounds of comments and revisions they end up with a file named "FINAL_rev.22.comments49.corrections.10.#@$%WHYDIDCOMETOGRADSCHOOL????.doc"'}

Unfortunately, this might look too familiar to many of us. Even when using software that allows for tracking changes, such as Microsoft Word or LibreOffice, when saving many versions of the same document, it can be difficult to find when a change occured. Google Docs allows for some versioning in the same document, but there is little control over what is saved when, and there is no quick way to see the change history.

Version control systems like Git, GitHub, and GitLab, start with a base version of your document and allow you to record the changes that you have made with descriptive notes. You can think of it as a log of your progress that you control.

![](fig/play-changes.svg){alt='A diagram demonstrating how a single document grows as the result of sequential changes'}

With the record of changes, you can also return to different points in the document's history. In fact, two users can make independent sets of changes on the same document.

![](fig/versions.svg){alt='A diagram with one source document that has been modified in two different ways to produce two different versions of the document'}

Unless multiple users make changes to the same section of the document - a [conflict](../learners/reference.md#conflict) - you can incorporate two sets of changes into the same base document.

![](fig/merge.svg){alt='A diagram that shows the merging of two different document versions into one document that contains all of the changes from both versions'}

A version control system is a tool that allows you to take control of recording the changes to your documents, effectively creating different versions of the same file. It also allows you to decide which changes will be made to the next version (each record of these changes is called a [commit](../learners/reference.md#commit)), and keeps useful metadata about them. The complete history of commits for a particular project and their metadata make up a [repository](../learners/reference.md#repository). Repositories can be kept in sync across different computers, facilitating collaboration among different people.

:::::::::::::::::::::::::::::::::::::::  challenge

## Paper Writing

- Imagine you drafted an excellent paragraph for a paper you are writing, but later ruin it. How would you retrieve the *excellent* version of your conclusion? Is it even possible?

- Imagine you have 5 co-authors. How would you manage the changes and comments they make to your paper? If you use LibreOffice Writer or Microsoft Word, what happens if you accept changes made using the `Track Changes` option? Do you have a history of those changes?

:::::::::::::::  solution

## Solution

- Recovering the excellent version is only possible if you created a copy of the old version of the paper. The danger of losing good versions often leads to the problematic workflow illustrated in the PhD Comics cartoon at the top of this page.

- Collaborative writing with traditional word processors is cumbersome. Either every collaborator has to work on a document sequentially (slowing down the process of writing), or you have to send out a version to all collaborators and manually merge their comments into your document. The 'track changes' or 'record changes' option can highlight changes for you and simplifies merging, but as soon as you accept changes you will lose their history. You will then no longer know who suggested that change, why it was suggested, or when it was merged into the rest of the document. Even online word processors like Google Docs or Microsoft Office Online do not fully resolve these problems.   

::::::::::::::::::::::::: 
::::::::::::::::::::::::::::::::::::::::::::::::::

## Version Control Platforms

Today we will explore using the GitLab with RStudio, but how is GitLab different from Git and GitHub?

Git is an open-source tool that tracks your changes. GitHub and GitLab are hosts on the web that collect the complete history of those changes. GitHub offers free and paid plans, and as a member of UW-Madison, you have access to GitLab, which provides additional features such as licensing protections, authentication and identity management through your NetID, and support from DoIT Shared Tools. 

Note that GitLab should not be used for storing large amounts of data (over 2GB). UW-Madison Research Data Services provides a [Data Storage Finder Tool](https://storage.researchdata.wisc.edu/?_gl=1*eqwfyq*_ga*MjY2MjYyMzkwLjE3NDAwNjY2OTE.*_ga_5YLVYCMY8S*MTc0MDE3NTMwNi4xLjEuMTc0MDE3NjM4Mi4wLjAuMA..) and consults on best practices for storing research data.

::::::::::::::::::::::::::::::::::::: keypoints 

- Version control is like an unlimited 'undo'.
- Version control also allows many people to work in parallel.
- Git is a version control tool, and GitHub and GitLab are repositories that collect the history of those changes.
- As a member of UW-Madison, you have access to GitLab, which includes additional features.

::::::::::::::::::::::::::::::::::::::::::::::::

[r-markdown]: https://rmarkdown.rstudio.com/
