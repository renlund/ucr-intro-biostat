library(knitr)
library(Hmisc)
library(RColorBrewer)
library(wesanderson)
library(graphics)
library(ggplot2); theme_set(theme_bw())

opts_chunk$set(
   cache=TRUE,
   echo=FALSE,
   message=FALSE,
   error=FALSE,
   warning=FALSE,
   fig.align='center',
   fig.width=11,
   fig.height=5
   )
opts_knit$set(eval.after = "fig.cap")
.par_reset <- par()
.par_reset$cin <- NULL
.par_reset$cra <- NULL
.par_reset$csi <- NULL
.par_reset$cxy <- NULL
.par_reset$din <- NULL
.par_reset$page <- NULL

# copy-paste from package 'proh' to remove dependency
fileName <- function(filename){
   ext <- rep(NA_character_, length(filename))
   main <- ext
   for(k in seq_along(filename)){
      K <- filename[k]
      test <- regmatches(K, regexpr("\\.[A-Za-z0-9]*$", K))
      ext[k] <- if(length(test)>0) test else ""
      main[k] <- sub( paste0(ext[k], "$"), "", K)
   }
   R <- data.frame(
      name = main,
      extension = ext
   )
   rownames(R) <- filename
   R
}
.alsHO <- function(name){
   HANDOUT <- TRUE; knit2pdf(name, clean=TRUE)
   inName <- paste0(fileName(name)$name, ".pdf")
   outName <- paste0(fileName(name)$name, "_handout.pdf")
   file.rename(from = inName, to = outName)
   HANDOUT <- FALSE
   knit2pdf(name, clean = TRUE)
}

# LECTURE 1&2  --------------------------
knit2pdf("L1and2.rnw", clean=TRUE)
.alsHO("L1and2.rnw")

# LECTURE 6 ----------------------------
knit2pdf("L6.rnw", clean=TRUE)
.alsHO("L6.rnw")


# clean'n'kill --------------------------
# proh::clean()
# proh::killCache()
# rm(list=setdiff(ls(), "set_params"))
