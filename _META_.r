library(knitr)
library(Hmisc)
library(RColorBrewer)
library(weanderson)
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

knit2pdf("L9.rnw")
# knit("L6.rnw")

knit2pdf("L6.rnw")
# knit("L6.rnw")

knit2pdf("L1and2.rnw")
# knit("L1and2.rnw")

proh::clean()
proh::killCache()
# rm(list=setdiff(ls(), "set_params"))
