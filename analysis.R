# Analysis of job advertisements in Italy and their trend between 2019 and 2023

# Data loading
# The data in xlsx format were previously converted into csv
setwd("/path/to/your/directory") # Modify with the correct path

skill <- read.csv("oja_skills.csv", header=TRUE, sep=";")
str(skill)
trend <- read.csv("oja_trend.CSV", header=TRUE, sep=";")
str(trend)

# EXERCISE 1

# A. Which occupation recorded the largest increase (or decrease) in the number of job ads?

# Largest increase
which.max(trend$X2023 - trend$X2019)
trend[41,] # Administrative and executive secretaries
trend[41,]$X2023 - trend[41,]$X2019 # 27469

# Largest decrease
which.min(trend$X2023 - trend$X2019)
trend[149,] # Software developers
trend[149,]$X2023 - trend[149,]$X2019 # -36984

# B. Which occupation recorded the highest percentage increase (or decrease) in job ads?

# Highest percentage increase
which.max((trend$X2023 - trend$X2019)/trend$X2019)
trend[1,] # Medical secretaries
(trend[1,]$X2023 - trend[1,]$X2019)/trend[1,]$X2019 # 101.2174%

# Highest percentage decrease
which.min((trend$X2023 - trend$X2019)/trend$X2019)
trend[162,] # Pawnbrokers and money-lenders
(trend[162,]$X2023 - trend[162,]$X2019)/trend[162,]$X2019 # -0.958%

# EXERCISE 2

skill <- na.omit(skill)
str(skill)

# 2.1.1 With respect to ESCO first level, how are the 4 groups characterised in terms of transversal, professional and digital skills?

sum(skill$idesco_level_1==1)

t1 <- sum(skill$idesco_level_1[skill$skill_type=="Transversal"]==1) # 14088
p1 <- sum(skill$idesco_level_1[skill$skill_type=="Professional"]==1) # 13579
d1 <- sum(skill$idesco_level_1[skill$skill_type=="Digital"]==1) # 7007

t2 <- sum(skill$idesco_level_1[skill$skill_type=='Transversal']==2) # 9354
p2 <- sum(skill$idesco_level_1[skill$skill_type=='Professional']==2) # 10637
d2 <- sum(skill$idesco_level_1[skill$skill_type=='Digital']==2) # 11876

t3 <- sum(skill$idesco_level_1[skill$skill_type=='Transversal']==3) # 10112
p3 <- sum(skill$idesco_level_1[skill$skill_type=='Professional']==3) # 13944
d3 <- sum(skill$idesco_level_1[skill$skill_type=='Digital']==3) # 6401

t4 <- sum(skill$idesco_level_1[skill$skill_type=='Transversal']==4) # 3333
p4 <- sum(skill$idesco_level_1[skill$skill_type=='Professional']==4) # 8157
d4 <- sum(skill$idesco_level_1[skill$skill_type=='Digital']==4) # 3548

# 2.1.2 What are the most requested skills for each of the four groups?

which.max(c(t1,p1,d1)) # Trasversal
which.max(c(t2,p2,d2)) # Digital
which.max(c(t3,p3,d3)) # Professional
which.max(c(t4,p4,d4)) # Professional

# 2.2.1 Which skills recorded the highest increase (or decrease) in the number of job ads?

library(tidyverse)

s_19 <- skill %>%
  filter(year == 2019) %>% 
  select(escoskill_level_3) %>%
  group_by(escoskill_level_3) %>%
  summarize(n_19=n())

s_23 <- skill %>%
  filter(year == 2023) %>% 
  select(escoskill_level_3) %>%
  group_by(escoskill_level_3) %>%
  summarize(n_23=n())

s <- full_join(s_23,s_19)
s$n <- s$n_23 - s$n_19
s <- na.omit(s)

# Largest increase
max(s$n)
which.max(s$n)
s[441,] # Use Microsoft Office

# Largest decrease
min(s$n)
which.min(s$n)
s[305,] # Operate relational database management system

# 2.2 Which skills recorded the largest percentage increase (or decrease)?

s$n_perc <- (s$n_23 - s$n_19)/(s$n_19)
s <- na.omit(s)

# Highest percentage increase
max(s$n_perc)
which.max(s$n_perc)
s[182,] # Exercise sports +443%

# Highest percentage decrease
min(s$n_perc)
which.min(s$n_perc)
s[26,] # Jboss -90%, excluding NA values

# 2.3.1 What are the 3 most important skills for each ESCO level 4 occupation?

most <- skill %>%
  select(esco_level_4,escoskill_level_3) %>%
  group_by(esco_level_4, escoskill_level_3) %>%
  summarize(n=n()) %>%
  arrange(esco_level_4,desc(n))%>%
  print(n=100)

# 2.4.1 What are the most requested skills for the occupation "Statistical, finance and insurance clerks" (ESCO 4312)?
# Which ones experienced the largest change between 2019 and 2023?

# Most requested skills overall
spec <- skill %>%
  filter(idesco_level_4 == 4312) %>%
  group_by(escoskill_level_3) %>%
  summarize(n=n()) %>%
  arrange(desc(n))

# For the occupation "Statistical, finance and insurance clerks", the 3 most requested skills are:
# 1. Analyse call centre activities
# 2. Assist customers
# 3. Use Microsoft Office

# Difference between years:
# Most requested skills in 2019
spec_19 <- skill %>%
  filter(year ==2019 & idesco_level_4 == 4312) %>%
  select(idesco_level_4, escoskill_level_3) %>%
  group_by(escoskill_level_3) %>%
  summarise(n_19 = n())

# Most requested skills in 2023
spec_23 <- skill %>%
  filter(year==2023 & idesco_level_4 == 4312) %>%
  select(idesco_level_4,escoskill_level_3) %>%
  group_by(escoskill_level_3) %>%
  summarize(n_23 = n())

spec_diff <- full_join(spec_19, spec_23)
spec_diff$diff <- spec_diff$n_23 - spec_diff$n_19
spec_diff <- arrange(spec_diff, desc(diff))

# The skill with the largest increase between 2019 and 2023 is "Analyse call centre activities" with +27 job ads
# The skill with the largest decrease (excluding NA values) is "Accounting techniques" with -13 job ads

# 2.5.1 What are the most relevant skills for the occupations:
# - "Statistical, finance and insurance clerks" (ESCO level 4, 4312)
# - "Finance managers" (ESCO level 4, 1211)

# Statistical, finance and insurance clerks:
ril_4312 <- skill %>%
  filter(idesco_level_4 == 4312) %>%
  select(idesco_level_4, escoskill_level_3) %>%
  group_by(escoskill_level_3) %>%
  summarize(n_group = n()) %>%
  arrange(desc(n_group))

group_4312 <- skill %>%
  select(escoskill_level_3) %>%
  group_by(escoskill_level_3) %>%
  summarize(skill_tot = n())

x_4312 <- full_join(ril_4312, group_4312)
x_4312$rilevanti <- x_4312$n_group/x_4312$skill_tot
x_4312 <- arrange(x_4312, desc(rilevanti))

# 65.3% of the requests for the skill "Issue purchase orders" come from job ads for the role "Statistical, finance and insurance clerks"
# 34.5% of the requests for the skill "Analyse call center activities" come from job ads for this role

# Finance managers:
ril_1211 <- skill %>%
  filter(idesco_level_4 == 1211) %>%
  select(idesco_level_4, escoskill_level_3) %>%
  group_by(escoskill_level_3) %>%
  summarize(n_group = n()) %>%
  arrange(desc(n_group))

group_1211 <- skill %>%
  select(escoskill_level_3) %>%
  group_by(escoskill_level_3) %>%
  summarize(skill_tot = n())

x_1211 <- full_join(ril_1211,group_1211)
x_1211$rilevanti <- x_1211$n_group/x_1211$skill_tot
x_1211 <- arrange(x_1211, desc(rilevanti))

# 100% of the requests for the skill "Manage securities" come from job ads for the role "Finance managers"
# 78.9% of the requests for the skill "Control financial resources" come from job ads for this role
# 61.5% of the requests for the skill "Financial management" come from job ads for this role