mode_y <- as.numeric(names(sort(table(db$y_salary_m), decreasing = TRUE)[1]))

# Imputing the missing value. 
db <- db  %>%
  mutate(y_salary_m = ifelse(is.na(y_salary_m) == TRUE, mode_y, y_salary_m))

# total income in millions
db <- db  %>%
  mutate(ingtot = ingtot/1000000)
