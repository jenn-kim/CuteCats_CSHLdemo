# from CSHL workshop materials:
# https://seandavi.github.io/CuteCats/articles/create_the_package.html#how-do-i-create-an-r-package

# install and load libraries 
BiocManager::install("devtools")
BiocManager::install("roxygen2")
BiocManager::install('pkgdown')

library(devtools)
library(roxygen2)
library(pkgdown)

# set working directory to home directory
setwd("/Users/jennkim/Documents/Rpackages")
devtools::create("CuteCats")
list.files()
setwd("CuteCats/")
list.files()

# save all your functions as individual .R or one master .R file within this folder
setwd("R")

# write out functions
love_cats <- function(love=TRUE){
  if(love==TRUE){
    print("I love cats!")
    return(TRUE)
  }
  else {
    print("I am not a cool person.")
    return(FALSE)
  }
}

hooper_kitten <- function() {
  file_loc = system.file('images/hooper_kitten.png', package='CuteCats')
  img = png::readPNG(file_loc)
  grid::grid.raster(img)
}

# save directory of images that you'll need for functions
setwd("/Users/jennkim/Documents/Rpackages/CuteCats/")
dir.create('inst/images', recursive=TRUE)
download.file('https://github.com/seandavi/CuteCats/raw/main/inst/images/hooper_kitten.png', destfile='inst/images/hooper_kitten.png')

# try things out
devtools::document()
devtools::load_all()
library(CuteCats)
hooper_kitten()
love_cats()

# set directory first to CuteCats parent folder before proceeding with below commands
usethis::use_mit_license()
pkgdown::build_site()

# run these on the TERMINAL:
# add everything to git -- switch into CuteCats parent folder first
git init
git add .
git commit -m 'Working package'

# once you make a repo on your github.com page follow instructions:
git remote add origin https://github.com/jenn-kim/CuteCats_CSHLdemo.git
git branch -M main
git push -u origin main

# try downloading package
BiocManager::install('jenn-kim/CuteCats_CSHLdemo')


download.file('https://github.com/seandavi/CuteCats/raw/main/inst/images/hooper_kitten.png', destfile='inst/images/hooper_kitten.png')