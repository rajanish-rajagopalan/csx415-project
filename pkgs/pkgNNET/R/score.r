#' Predict function to process the new data and return confusion matrix.
#'
#' @return confussion matrix table and writes the sales leads to data folder
#' @export score
#'
#' @examples score(new_data)
score <- function(new_data){

  if (missing(new_data)){
    data <- myUtils::load_data_vector()
    new_data <- data[[2]]
  }

  features <- names(new_data)[!names(new_data) %in% "y"]

  # read the model to the project data folder
  path_vector <- strsplit(getwd(),split='/')
  pos <- match('BankSales',path_vector[[1]])
  proj_home <- paste(path_vector[[1]][1:pos],collapse = '/')
  model_file = paste(proj_home,'/pkgs/pkgNNET/data/model_nnet.rds',sep='')
  model_nnet <- readRDS(model_file)

  # Use the model to predict dependent variable of test data
  predictions <-
    caret::predict.train(object = model_nnet, new_data[, features], type = "raw")


  # Review Confusion Matrix and statistics
  conf_matrix <- caret::confusionMatrix(predictions, new_data[, "y"])
  leads <- cbind(new_data[,features],predictions)
  write.csv(leads[leads$predictions == 1, features] , file = paste(proj_home,'/data/nnet_sales_leads.csv',sep=''))
  return (conf_matrix$table)
}
