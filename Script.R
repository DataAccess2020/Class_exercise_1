library(tidyverse)
library(rio)

europeanvalues <- import("ZA7505_v2-0-0.dta")

View(europeanvalues)


table(europeanvalues$D081)
table(europeanvalues$F118)
table(europeanvalues$X025A_01)


europeanvalues$D081


europeanvalues <-mutate(
  europeanvalues,
  homo_parents = ifelse(europeanvalues$D081 == 1,"Agree strongly",
                        ifelse(europeanvalues$D081 == 2, "Agree",
                               ifelse(europeanvalues$D081 == 3, "Neither agree nor disagree",
                                      ifelse(europeanvalues$D081 == 4, "Disagree",
                                             ifelse(europeanvalues$D081 == 5, "Disagree strongly",
                                                    "missing"
))))))


table(europeanvalues$homo_parents)

var_int <- tibble(europeanvalues$homo_parents, europeanvalues$F118, europeanvalues$X025A_01)
