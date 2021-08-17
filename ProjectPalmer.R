install.packages("tidyverse")            #Installing & Loading Packages
library(tidyverse)
    
install.packages("ggplot2")             #Package for Visualization
library(ggplot2)

library(tibble)                         #handling DataFrames
library(dplyr)                          #data manipulation mutate()/select()
library(tidyr)                          #creating data
library(janitor)                        #%>% pipe FUNCTION
library(here)
library(skimr)                          #group_by()

--------------------------------------------------------------------------------

install.packages("palmerpenguins")       #Installing Data Set
library(palmerpenguins)
View(penguins)        


--------------------------------------------------------------------------------

head(penguins)                           #previewing the data set
glimpse(penguins)

npenguins <- na.omit(penguins)           #Removing the null values 
View(npenguins)




-----------------#Calculating Body Mass for each island-------------------------

npenguins %>% select(species) %>%         #Distinct species
  distinct() 

Adelie_bodymass<-npenguins %>% filter(species=="Adelie") %>%
  summarise(mean_bodymass_Adelie=mean(body_mass_g))


Chinstrap_bodymass<-npenguins %>% filter(species=="Chinstrap") %>%
  summarise(mean_bodymass_Chinstrap=mean(body_mass_g))

Gentoo_bodymass<-npenguins %>% filter(species=="Gentoo") %>%
  summarise(mean_bodymass_Gentoo=mean(body_mass_g))

mass_g <- npenguins %>% group_by(species) %>% 
  summarise(mean_mass_g=mean(body_mass_g))
View(mass_g)

total<-npenguins %>% group_by(island) %>% 
  summarise(mean_bill_length_mm=mean(bill_length_mm))




------------------------------#Visualization------------------------------------

penguins %>%
  count(species) %>%
  ggplot() + geom_col(aes(x = species, y = n, fill = species)) +
  geom_label(aes(x = species, y = n, label = n)) +
  scale_fill_manual(values = c("darkorange","purple","cyan4")) + theme_minimal() 
  +labs(title = 'Penguins Species & Count')


total%>% ggplot() + geom_col(aes(x=island, y=mean_bill_length_mm,
                                                   fill = mean_bill_length_mm))+
  geom_label(aes(x = island, y = mean_bill_length_mm, 
                 label =mean_bill_length_mm,)) + labs(title = 'Penguins island & mean_bill_length_mm')





