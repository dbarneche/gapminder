plan  <-  drake_plan(
    data       =  file_read('data/gapminder-FiveYearData.csv') %>% mutate(lnLifeExp = log(lifeExp), lnGdpPercap = log(gdpPercap)),
    model      =  lmer(lnLifeExp ~ lnGdpPercap + year + (1 | continent), data = data),
    coefs      =  coef(model)$continent,
    lines_data =  data %>% mutate(predicted = predict(model)) %>% ddply(.(continent) , summarise_data),
    figure     =  makeFigure(data, lines_data),
    report     =  render(knitr_in("doc/report.Rmd"), output_file = file_out("output/doc/report.html"), output_dir = "output/doc", quiet = TRUE)
)
