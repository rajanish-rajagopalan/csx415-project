inputs:
./data/bank.csv # contains the marketing team data with all the customer attributes and outcome of the call (will the customer buy a product or not)

outputs:
The build_models.r file in src folder builds out all the required models using the packages. The models are stored in the package data folder.
The Rmarkdown files in the reports folder scores the model, writes out the sales lead file in the project data folder and documents the results.