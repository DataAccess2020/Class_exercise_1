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