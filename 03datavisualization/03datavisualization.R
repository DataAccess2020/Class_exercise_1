##bar plot with homo_par_rel and edu_level
ggplot(plot_homop, aes(x=homo_par_rel, fill = edu_level)) +
  geom_bar(position = "dodge") +
  scale_fill_manual(values = c("darkorange2", "dodgerblue3", "palegreen3")) +
  ggtitle("Level of agreement with the statement: \n Homosexual couples are as good parents as other couples") +
  ylab("Homosexual couples are as good parents as other couples") +
  xlab("Level of agreement") +
  theme_bw(base_size = 10) +
  theme(axis.text.x=element_text(angle=45,hjust=1)) +
  theme(plot.title = element_text(hjust = 0.5))

##bar plot with just_homo_rel and edu_level
ggplot(plot_homop, aes(x=just_homo_rel, fill = edu_level)) +
  geom_bar(position = "dodge") +
  scale_fill_manual(values = c("darkorange2", "dodgerblue3", "palegreen3")) +
  ggtitle("How much is homosexuality justifiable") +
  ylab("How much is homosexuality justifiable") +
  xlab("Attitudes towards homosexuality") +
  theme_bw(base_size = 10) +
  theme(axis.text.x=element_text(angle=45,hjust=1)) +
  theme(plot.title = element_text(hjust = 0.5))


##Regression with the variables 'edu_level' and 'homo_parents_reg'
reg1 <- lm(homo_parents_reg ~ edu_level,
           data = tab_homp_reg)
summary(reg1)

pred1 <- ggpredict(reg1, terms = "edu_level")
pred1


##Regression with the variables 'edu_level' and 'homo_just_reg'
reg2 <- lm(homo_just_reg ~ edu_level,
           data = tab_homojust_reg)
summary(reg2)

pred2<- ggpredict(reg2, terms = "edu_level")
pred2



htmlreg(list(reg1, reg2),
        custom.model.names = c("retweets", "favorites"),
        caption = "Regression models for number of retweets/favorites with different emotional languages and for different sources")

