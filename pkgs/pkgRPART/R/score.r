#' Predict function to process the new data and return confusion matrix.
#'
#' @return confussion matrix table
#' @export score
#'
#' @examples score(new_data)
score <- function(new_data){

  if (missing(new_data)){
    data <- myUtils::load_data_raw()
    new_data <- data[[2]]
  }

  features <- names(new_data)[!names(new_data) %in% "y"]

  # read the model to the project data folder
  model_file = "/home/rajanish/Berkeley/DataScience/BankSales/pkgs/pkgRPART/data/model_rpart.rds"
  model <- readRDS(model_file)

  # Use the model to predict dependent variable of test data
  confusion <- table(new_data$y, predict(model,new_data[,features], type='class'))

  return (confusion)
}
