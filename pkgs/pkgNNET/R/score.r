#' Predict function to process the new data and return confusion matrix.
#'
#' @return confussion matrix table
#' @export score
#'
#' @examples score(new_data)
score <- function(new_data){

  if (missing(new_data)){
    data <- myUtils::load_data()
    new_data <- data[[2]]
  }

  features <- names(new_data)[!names(new_data) %in% "y"]

  # read the model to the project data folder
  model_file = "/home/rajanish/Berkeley/DataScience/BankSales/pkgs/pkgNNET/data/model_nnet.rds"
  model_nnet <- readRDS(model_file)

  # Use the model to predict dependent variable of test data
  predictions <-
    caret::predict.train(object = model_nnet, new_data[, features], type = "raw")


  # Review Confusion Matrix and statistics
  conf_matrix <- caret::confusionMatrix(predictions, new_data[, "y"])
  #print(conf_matrix$table)
  return (conf_matrix$table)
}
