---
title: Setup
---

## Install R and RStudio

  * Follow the [R Ecology Lesson instructions to install R and RStudio](https://datacarpentry.github.io/R-ecology-lesson/index.html#install-r-and-rstudio)  
* Install the "tidyverse" and "ratdat" packages. In the RStudio Console enter: 
  install.packages("tidyverse")
  install.packages("ratdat")

* If you see a question about “binary versions available…do you want to install from sources the package…” **SAY NO**  
* Once a package has been installed, you don’t need to install it again until there is an update  
* If you get an error message about needing RTools, you can find that here: [https://cran.r-project.org/bin/windows/Rtools/](https://cran.r-project.org/bin/windows/Rtools/)  
  * Download and install the version that aligns with the R version that you currently have  
  * Once installed, you might need to restart your R session
    
* DO NOT download the dataset

## Git installation 

### Windows

    * Download the Git for Windows [installer](https://gitforwindows.org/) and run it keeping all the defaults.  
    * **Additional step**    
      * In RStudio, open the Terminal tab  (under the console tab)
      * Copy and paste: setx HOME "%USERPROFILE%"  
      * Press Enter, you should see: "SUCCESS: Specified value was saved"  
      * Restart your RStudio session  
      
 ### Mac

    * Open the Terminal app from Applications (it is sometimes under a folder called "Other" or "Utilities"), type `git --version` and press Enter/Return 
    * If it's not installed already, follow the instructions to Install the "command line developer tools"  
    * Do not click "Get Xcode" because that will take too long and is not necessary for this workshop   
