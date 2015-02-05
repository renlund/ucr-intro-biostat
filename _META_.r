library(proh)
library(knitr)
library(Hmisc)
library(RColorBrewer)
library(wesanderson)
library(graphics)

opts_chunk$set(
   cache=TRUE, # default: FALSE
   #include=TRUE, # default: TRUE
   echo=FALSE, # default: TRUE
   message=FALSE, # default: TRUE
   error=FALSE, # default: TRUE
   warning=FALSE, # default: TRUE
   fig.align='center',
   fig.width=11,
   fig.height=5
)

.alsHO <- function(name){
   HANDOUT <- TRUE; knit2pdf(name, clean=TRUE)
   inName <- paste0(fileName(name)$name, ".pdf")
   outName <- paste0(fileName(name)$name, "_handout.pdf")
   file.rename(from = inName, to = outName)
   HANDOUT <- FALSE; knit2pdf(name)
   proh::clean()
}

# LECTURE 9 ----------------------------
knit2pdf("L9.rnw", clean=TRUE)
.alsHO("L9.rnw")

# LECTURE 6 ----------------------------
knit2pdf("L6.rnw", clean=TRUE)
.alsHO("L6.rnw")

# LECTURE 1&2  --------------------------
knit2pdf("L1and2.rnw", clean=TRUE)
.alsHO("L1and2.rnw")

# clean'n'kill --------------------------
proh::clean()
proh::killCache()
# rm(list=setdiff(ls(), "set_params"))
