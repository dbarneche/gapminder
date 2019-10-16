file_read  <-  function (fileName, ...) {
    read.csv(fileName, header = TRUE, stringsAsFactors = FALSE, ...)
}

summarise_data  <-  function (data) {
    rx  <-  range(data$lnGdpPercap)
    subset(data, lnGdpPercap %in% rx)
}

makeFigure  <- function (data, lines_data) {
    ggplot() +
        geom_point(data = data, aes(x = lnGdpPercap, y = lnLifeExp, color = continent), alpha = 0.3) +
        geom_line(data = lines_data, aes(x = lnGdpPercap, y = predicted, color = continent)) + 
        labs(title = 'Whole time series', x = 'log(gdpPercap)', y = 'log(lifeExp)') + 
        theme_bw() +
        theme(plot.title = element_text(hjust = 0.5))
}
