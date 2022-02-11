library(tidyverse)
library(rio)

europeanvalues <- import("ZA7505_v2-0-0.dta")

View(europeanvalues)


table(europeanvalues$D081)
table(europeanvalues$F118)
table(europeanvalues$X025A_01)
