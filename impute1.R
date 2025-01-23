db <- db  %>%
  mutate(ingtot = ifelse(is.na(ingtot) == TRUE, median(db$ingtot, na.rm = TRUE) , ingtot))

db = db %>% 
     group_by(directorio) %>% 
     mutate(mean_y_total_m = median(y_total_m,na.rm=T))

# Imputing the missing value.
db = db %>%
     mutate(y_total_m = ifelse(test = is.na(y_total_m)==T,
                               yes = mean_y_total_m,
                               no = y_total_m))
