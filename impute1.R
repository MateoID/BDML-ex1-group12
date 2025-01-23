# install pacman
if(!require(pacman)) install.packages("pacman") ; require(pacman)
p_load(rio, # import/export data
       tidyverse, # tidy-data
       skimr, # summary data
       visdat, # visualizing missing data
       corrplot, # Correlation Plots 
       stargazer) # tables/output to TEX. 

## load data
db <- import("https://github.com/ignaciomsarmiento/datasets/blob/main/GEIH_sample1.Rds?raw=true")
## print data
head(db)
tail(db)
## summary db
skim(db) %>% head()

## summary var
summary(db$y_salary_m)

des_vars <- c("y_salary_m", "sex", "age")
stargazer(df[des_vars], type="text")
####Data+ Mapping ####
ggplot(data = db , mapping = aes(x = age , y = y_ingLab_m)) +
  geom_point(col = "red" , size = 0.5)

ggplot(db, aes(maxEducLevel)) +
  geom_histogram(color = "#000000", fill = "#0099F8") +
  ggtitle("Max Edu  Distribution") +
  theme_classic() +
  theme(plot.title = element_text(size = 18))
# calculating the most commun value of Y_salary_m. 
mode_y <- as.numeric(names(sort(table(db$y_salary_m), decreasing = TRUE)[1]))

# Imputing the missing value. 
db <- db  %>%
  mutate(y_salary_m = ifelse(is.na(y_salary_m) == TRUE, mode_y , y_salary_m))
# total income in millions
db <- db  %>%
  mutate(ingtot =ingtot/1000000 )

# Distribution of total income
ggplot(db, aes(ingtot)) +
  geom_histogram(color = "#000000", fill = "#0099F8") +
  geom_vline(xintercept = median(db$ingtot, na.rm = TRUE), linetype = "dashed", color = "red") +
  geom_vline(xintercept = mean(db$ingtot, na.rm = TRUE), linetype = "dashed", color = "blue") +  
  ggtitle(" Ingreso Total") +
  theme_classic() +
  theme(plot.title = element_text(size = 18))
