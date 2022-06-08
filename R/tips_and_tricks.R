# R tips and tricks

# Last updated 2022-06-08

# Load packages ----

library(tidyverse)

# Tidyverse ----

# Calculate summary statistics for numeric variables 
# Source : Twitter @ChBurkhart

mpg %>% 
  group_by(manufacturer) %>% 
  summarise(across(where(is.numeric),
                   list(mean = ~ mean(.x, na.rm = TRUE),
                        sd = ~ sd(.x, na.rm = TRUE)),
                   .names = "{.col}_{.fn}")) %>% 
  pivot_longer(cols = contains(c("sd", "mean")),
               names_to = c("variable", ".value"),
               names_sep = "_")
