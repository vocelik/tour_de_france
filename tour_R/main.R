library(tidyverse)
library(tidymodels)

rider <- read_csv("Tour de France_riders.csv")
stages <- read_csv("Tour de France_stages.csv")
stage_types <- read_csv("Tour de France_stage_types.csv")

df <- stages %>%
    janitor::clean_names() %>%
    left_join(stage_types %>% select(-X1)) %>%
    left_join(rider %>% janitor::clean_names() %>%
                  unite(rider, last_names, first_name, sep = " ") %>%
                  select(-x1) %>%
                  rename(career_points = gc)) %>%
    select(rider, rnk, gc, gc_time, age, time, year,
           stage, type, nationality:climber)
