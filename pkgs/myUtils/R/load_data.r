#' Basic utilities for the project
#'
#' @return list(train_data, test_data)
#' @export load_data
#'
#' @examples load_data()
load_data <- function(){

  # Read the bank file
  raw_data <-
    #read.csv("./../../data/bank.csv")
    read.csv("/home/rajanish/Berkeley/DataScience/BankSales/data/bank.csv")
  raw_data$y <- ifelse(raw_data$y == "yes", 1, 0)

  # Convert the categorical data to one hot vectors and dependent variable to factors
  dmy <- caret::dummyVars(" ~ .", data = raw_data, fullRank = T)
  vector_data <- data.frame(predict(dmy, newdata = raw_data))
  vector_data$y <- as.factor(vector_data$y)
  #vector_data <- raw_data

  # Split the available data into Train and Test data
  ind <-
    sample(2,
           nrow(vector_data),
           replace = TRUE,
           prob = c(0.8, 0.2))
  train_data <- vector_data[ind == 1,]
  test_data <- vector_data[ind == 2,]

  return(list(train_data,test_data))

}
