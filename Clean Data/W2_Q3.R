install.packages("sqldf")
library(sqldf)


acs <- read.csv("C:/DataScience/Clean Data/data/acs.csv", header = TRUE)

sqldf("select distinct AGEP from acs order by AGEP")