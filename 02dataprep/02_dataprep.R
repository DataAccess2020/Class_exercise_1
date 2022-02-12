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


##create a dataframe for the 1st regression, with numeric variables: attitude towards homosexual couples and level of education 

tab_homp_reg <- europeanvalues %>%                    
  select(D081, X025R) %>%                
  mutate(
    homo_parents_reg = recode(D081,              
                              `1` = 5,
                              `2` = 4,
                              `3` = 3,
                              `4` = 2,
                              `5` = 1,
                              ))

tab_homp_reg$homo_parents_reg

##remove missing

filter(tab_homp_reg, homo_parents_reg %in% c(1,2,3,4,5), X025R %in% c(1,2,3))

##rename variable X025R

tab_homp_reg <- rename(
  tab_homp_reg,
  edu_level = X025R
)
names(tab_homp_reg)


##create a dataframe for the 2nd regression, with numeric variables: attitude towards homosexuality and level of education 


tab_homojust_reg <- europeanvalues %>% 
  select(F118,X025R) %>%
  mutate(
    homo_just_reg = recode(F118,              
                              `1` = 1,
                              `2` = 1,
                              `3` = 2,
                              `4` = 2,
                              `5` = 3,
                              `6` = 3,
                              `7` = 4,
                              `8` = 4,
                              `9` = 5,
                              `10`= 5
    ))

##remove missing

filter(tab_homojust_reg, homo_just_reg %in% c(1,2,3,4,5), X025R %in% c(1,2,3))

##rename variable X025R

tab_homojust_reg <- rename(
  tab_homojust_reg,
  edu_level = X025R
)
names(tab_homojust_reg)
  

