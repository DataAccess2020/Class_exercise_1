str(tab_int)

##reorder values of the variable homo_parents, from "Disagree strongly" to "Agree strongly"

tab_int <- mutate(
  tab_int,
  homo_par_rel = fct_relevel(homo_parents, 
                             "Disagree strongly", "Disagree", "Neither agree nor disagree", 
                             "Agree", "Agree strongly"))

##filter tab_int, removing missing

plot_homop<- filter(
  tab_int,
  homo_par_rel %in% c("Disagree strongly", "Disagree", "Neither agree nor disagree", 
                      "Agree", "Agree strongly"),
  edu_level %in% c("Lower", "Middle", "Upper"))


##reorder values of the variable justifiable_homo, from "Never justifiable" to "Always justifiable"

tab_int <- mutate(
  tab_int,
  just_homo_rel = fct_relevel(justifiable_homo, 
                              "Never justifiable", "Sometimes justifiable", "Neither justifiable nor not", 
                              "Often justifiable", "Always justifiable"))

##filter tab_int, removing missing

plot_homop<- filter(
  tab_int,
  just_homo_rel %in% c("Never justifiable", "Sometimes justifiable", "Neither justifiable nor not", 
                       "Often justifiable", "Always justifiable"),
  edu_level %in% c("Lower", "Middle", "Upper"))