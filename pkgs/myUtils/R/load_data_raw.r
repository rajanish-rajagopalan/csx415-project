#' Basic utilities for the project, reads the raw data
#' and splits the data into train and test data
#' @return list(train_data, test_data)
#' @export load_data_raw
#'
#' @examples load_data_raw()
load_data_raw <- function(){

  # Read the bank file
  path_vector <- strsplit(getwd(),split='/')
  pos <- match('BankSales',path_vector[[1]])
  proj_home <- paste(path_vector[[1]][1:pos],collapse = '/')
  raw_data <-read.csv(paste(proj_home,'/data/bank.csv',sep=''))

  # Split the available data into Train and Test data
  ind <- sample(2,nrow(raw_data), replace = TRUE, prob = c(0.8,0.2))
  train_data <- raw_data[ind==1,]
  test_data <- raw_data[ind==2,]

  return(list(train_data,test_data))

}
