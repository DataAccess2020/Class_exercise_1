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


#The variable goes on a scale from 1 to 10, while the previous one from 1 to 5. In order to work  
#on the same number of categories I grouped each one for 2. For example 'never justifiable' corresponds 
#to 1 and 2, etc... 
europeanvalues <-mutate(
  europeanvalues,
  justifiable_homo = ifelse(europeanvalues$F118 == 1: 2, "Never justifiable",
                            ifelse(europeanvalues$F118 == 3: 4, "Sometimes justifiable",
                                   ifelse(europeanvalues$F118 == 5: 6, "Neither justifiable nor not",
                                          ifelse(europeanvalues$F118 == 7: 8, "Often justifiable",
                                                 ifelse(europeanvalues$F118 == 9: 10, "Alaways justifiable",
                                                        "missing"
                                                 ))))))
table(europeanvalues$justifiable_homo)

europeanvalues$X025A_01
#I had doubts on how to recode the variable 'X025A_01 - Highest educational level attained', so I
#read the Variable report and I found another variable that was already recoded: 'Less than primary',
#'Primary' and 'Lower secondary' are under the category 'Lower'; 'Upper secondary' and 
#'Post-secondary non tertiary' are under the category 'Middle'; the remaining ones are under 
#the category 'Upper'. 
europeanvalues$X025R

europeanvalues <-mutate(
  europeanvalues,
  edu_level = ifelse(europeanvalues$X025R == 1, "Lower",
                     ifelse(europeanvalues$X025R == 2, "Middle",
                            ifelse(europeanvalues$X025R == 3, "Upper",
                                   "missing"
                            ))))
table(europeanvalues$edu_level)


table(europeanvalues$homo_parents)
table(europeanvalues$justifiable_homo)
table(europeanvalues$edu_level)

tab_int <-select(europeanvalues, homo_parents, justifiable_homo, edu_level)

View(tab_int)


