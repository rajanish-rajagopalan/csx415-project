#' Simple package to build a Neural Network classifier for the Bank sales data.
#'
#' @return Saved model file
#' @export fn_nnet
#'
#' @examples fn_nnet()
fn_nnet <- function()

{
  data <- myUtils::load_data_vector()
  train_data <- data[[1]]
  test_data <- data[[2]]

  # Build a Neural Network classification model
  features <- names(train_data)[!names(train_data) %in% "y"]
  model_nnet <-
    caret::train(
      x = train_data[, features],
      y = train_data[, "y"],
      method = "nnet",
      tuneLength = 2,
      maxit = 500,
      trace = FALSE
    )  ### increase the iterations later

  # Save the model to the project data folder
  path_vector <- strsplit(getwd(),split='/')
  pos <- match('BankSales',path_vector[[1]])
  proj_home <- paste(path_vector[[1]][1:pos],collapse = '/')
  model_file = paste(proj_home,'/pkgs/pkgNNET/data/model_nnet.rds',sep='')
  saveRDS(model_nnet, file = model_file)

}
