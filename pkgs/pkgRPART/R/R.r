#' Simple package to build a RPART classifier for the Bank sales data.
#'
#' @return Saved model file
#' @export fn_rpart
#'
#' @examples fn_rpart()
fn_rpart <- function(){

  data <- myUtils::load_data_raw()
  train_data <- data[[1]]
  test_data <- data[[2]]

  # Build a RPART classification model fitControl <- trainControl(method = 'repeatedcv', number =
  # 5, repeats = 5)
  features <- names(train_data)[!names(train_data) %in% "y"]
  library(rpart)
  features.form <- paste(features, collapse = '+')
  model <- rpart(as.formula(paste( 'y ~',features.form, collapse = ' ')), data = train_data , maxdepth = 30)

  # Save the model to the project data folder
  path_vector <- strsplit(getwd(),split='/')
  pos <- match('BankSales',path_vector[[1]])
  proj_home <- paste(path_vector[[1]][1:pos],collapse = '/')
  model_file = paste(proj_home,'/pkgs/pkgRPART/data/model_rpart.rds',sep='')
  saveRDS(model, file = model_file)


}
