# Script Settings and Resources
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

# Data Import and Cleaning
raw_df <- read.csv(file="../Data/week3.csv")
raw_df$timeStart<- as.POSIXct(raw_df$timeStart)
raw_df$timeEnd<- as.POSIXct(raw_df$timeEnd)
clean_df<- raw_df[raw_df$timeStart >= "2017-07-01 00:00:00" | raw_df$timeStart < "2017-06-01 00:00:00", ] # it doesnt seem like anyone did anything before June, but this should be a more complete answer than if I simply had it be >2017..
clean_df <- 