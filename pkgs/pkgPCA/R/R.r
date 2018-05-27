data <- myUtils::load_data()

train_data <- data[[1]]
test_data <- data[[2]]

features <- names(train_data)[!names(train_data) %in% c("duration","pdays","day","balance","y")]
x <- train_data[, features]
y <- train_data[, "y"]

pr <- prcomp(x)
plot(pr$x[,1],pr$x[,2])
