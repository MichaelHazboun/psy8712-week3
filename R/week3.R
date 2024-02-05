# Script Settings and Resources
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

# Data Import and Cleaning
raw_df <- read.csv(file="../Data/week3.csv")
raw_df$timeStart<- as.POSIXct(raw_df$timeStart)
raw_df$timeEnd<- as.POSIXct(raw_df$timeEnd)
clean_df<- raw_df[raw_df$timeStart >= "2017-07-01 00:00:00" | raw_df$timeStart < "2017-06-01 00:00:00", ] # it doesnt seem like anyone did anything before June, but this should be a more complete answer than if I simply had it be >2017..
clean_df <- clean_df[clean_df$q6 ==1,]

# Analysis
clean_df$timeSpent <- difftime(clean_df$timeEnd,clean_df$timeStart, tz = "POSIXlt", units = "secs") #tz is bad
hist(as.numeric(clean_df$timeSpent))
frequency_tables_list <- lapply(clean_df[,5:14],table)
lapply(frequency_tables_list,barplot)
sum(clean_df$q1>=clean_df$q2 & clean_df$q2 != clean_df$q3)
for (i in frequency_tables_list){
  barplot(i) } # works without {}
# () Parenthesis
# [] Brackets
# {} Curly brackets