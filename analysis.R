library(lme4)
library(plyr)
library(dplyr)
library(ggplot2)
source('R/functions.R')

data  <-  file_read('data/gapminder-FiveYearData.csv') %>% mutate(lnLifeExp = log(lifeExp), lnGdpPercap = log(gdpPercap))

model  <-  lmer(lnLifeExp ~ lnGdpPercap + year + (1 | continent), data = data)

output_model  <-  coef(model)$continent

lines_data  <-  data %>% mutate(predicted = predict(model)) %>% ddply(.(continent) , summarise_data)
    
makeFigure(data, lines_data)
