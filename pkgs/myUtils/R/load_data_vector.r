#' Basic utilities for the project, reads the raw data, converts them to one hot vector
#' and splits the data into train and test data
#' @return list(train_data, test_data)
#' @export load_data_vector
#'
#' @examples load_data_vector()
load_data_vector <- function(){

  # Read the bank file
  path_vector <- strsplit(getwd(),split='/')
  pos <- match('BankSales',path_vector[[1]])
  proj_home <- paste(path_vector[[1]][1:pos],collapse = '/')
  raw_data <-read.csv(paste(proj_home,'/data/bank.csv',sep=''))

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
