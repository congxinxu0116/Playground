
predictTemperature <- function(startDate, endDate, temperature, n) {
  
  temperature <- ts(as.numeric(temperature), frequency = 24)

  model <- arima(temperature, order = c(4, 0, 0), method = 'CSS')

  output <- as.vector(predict(model, n*24)[["pred"]])

  return(output)
}

library(readr)
stdin <- "C:\\Users\\DaDa\\Documents\\GitHub\\Playground\\input000.txt"
stdout <- "C:\\Users\\DaDa\\Documents\\GitHub\\Playground\\output000.txt"

startDate <- read_lines(stdin, n_max  = 1)

endDate <- read_lines(stdin, skip = 1, n_max = 1)

temperatureCount <- as.integer(trimws(read_lines(stdin, skip = 2, n_max = 1), which = "both"))
temperature <- read_lines(stdin, skip = 3, n_max = temperatureCount)
temperature <- trimws(temperature, which = "both")
temperature <- as.numeric(temperature)

n <- as.integer(trimws(read_lines(stdin, skip = temperatureCount + 3, n_max = 1), which = "both"))

result <- predictTemperature(startDate, endDate, temperature, n)

actual <- read.table(stdout, sep = "\t")

actual$result <- result

actual$check <- ifelse(actual$V1 - actual$result > 5, 'Yes', "No")
table(actual$check)
