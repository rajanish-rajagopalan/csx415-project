# Test input file column count
#expect_length(read.csv(paste(getwd(),'/data/bank.csv',sep='')), 17)

#print(getwd())
path_vector <- strsplit(getwd(),split='/')
pos <- match('BankSales',path_vector[[1]])
proj_home <- paste(path_vector[[1]][1:pos],collapse = '/')
# Test the GLM model function
testthat::expect_error(pkgGLM::fn_glm(), NA)
testthat::expect_true(file.exists(paste(proj_home,'/pkgs/pkgGLM/data/model_glm.rds',sep='')))

# Test the NNET model function
testthat::expect_error(pkgNNET::fn_nnet(), NA)
testthat::expect_true(file.exists(paste(proj_home,'/pkgs/pkgNNET/data/model_nnet.rds',sep='')))

# Test the RPART score function
testthat::expect_error(pkgRPART::fn_rpart(), NA)
testthat::expect_true(file.exists(paste(proj_home,'/pkgs/pkgRPART/data/model_rpart.rds',sep='')))

# Test the GLM score function
expect_length(pkgGLM::score(),4)

# Test the NNET score function
expect_length(pkgNNET::score(),4)

# Test the RPART score function
expect_length(pkgRPART::score(),4)

# Sample test
expect_equal(1, 1)