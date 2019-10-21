library("tidyverse")
library("gapminder")

gapminder
write_csv(gapminder, "./gapminder.csv")
View(gapminder)

gapminder_sum <- gapminder %>%
  group_by(continent) %>% 
  summarize(ave_lifeExp = mean(lifeExp))

View(gapminder_sum)
write_csv(gapminder_sum, './gapminder_sum.csv')

View(gapminder_sum)
write_csv(gapminder_sum, here::here('gapminder_sum.csv'))

write_csv(gapminder_sum, here::here("gapminder_sum.csv")
          
gapminder_sum %>% 
ggplot(aes(x = continent,
           y = ave_lifeExp))+
  geom_point() +
  theme_bw()

gapminder_csv <- read_csv("./gapminder_sum.csv")
View(gapminder_csv)
          
ls()
list=ls()
remove(list=ls())
ls()
          
########## PACKAGE HERE ##########          
install.packages("here")
library("here")
          
write_csv(here::here("test", "tes", "te", "t", gapminder.csv)) #Creates a folder
          
data_url <- "http://gattonweb.uky.edu/sheather/book/docs/datasets/GreatestGivers.xls"
          
#download.file(url = data_url,
              #destfile = paste('./datasets/', file_name))
          
download.file(url = data_url, 
              destfile = here::here("test", "greatestGivers.xls"))
          
file_name <- basename(data_url)
          
file_name
          
library(readxl)
philanthropists <- read_excel(here::here("test",file_name), trim_ws = TRUE)
View(philanthropists)
head(philanthropists)
          
library(here)
mri_file = "Firas-MRI.xlsx"
mri <- read_excel(mri_file)
          
mri <- Firas_MRI
          