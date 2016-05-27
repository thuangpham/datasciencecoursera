
# Fourth Column of Nine Column is Column Nino3 SST
#Week field + blanks = 15
#Nino1+2 SST = 4
#Nino1+2 SSTA + blanks = 9
#Nino3 SST=4

data <- read.fwf(file=url("https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"),
              widths = c(15, 4, 9, 4), header = FALSE, sep = "\t", skip = 4)

sum(data$V4)
