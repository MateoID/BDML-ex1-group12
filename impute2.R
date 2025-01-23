# Include your code here for you second imputation method

if(!require(pacman)) install.packages("pacman") ; require(pacman)
# require/install packages on this session
p_load(rio, # import/export data
       tidyverse, # tidy-data
       skimr, # summary data
       visdat, # visualizing missing data
       corrplot, # Correlation Plots 
       stargazer) # tables/output to TEX. 
        
## load data
df <- import("https://github.com/ignaciomsarmiento/datasets/blob/main/GEIH_sample1.Rds?raw=true")
db <- as_tibble(df) ## from dataframe to tibble
