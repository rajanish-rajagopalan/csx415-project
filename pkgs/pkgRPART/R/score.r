#' Predict function to process the new data and return confusion matrix.
#'
#' @return confussion matrix table and writes the sales leads to data folder
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
  path_vector <- strsplit(getwd(),split='/')
  pos <- match('BankSales',path_vector[[1]])
  proj_home <- paste(path_vector[[1]][1:pos],collapse = '/')
  model_file = paste(proj_home,'/pkgs/pkgRPART/data/model_rpart.rds',sep='')
  model <- readRDS(model_file)

  # Use the model to predict dependent variable of test data
  preds <- predict(model,new_data[,features], type='class')
  confusion <- table(new_data$y, preds)

  # Write sales lead
  leads <- cbind(new_data[,features],preds)
  write.csv(leads[leads$preds == 'yes', features] , file = paste(proj_home,'/data/rpart_sales_leads.csv',sep=''))
  return (confusion)
}
