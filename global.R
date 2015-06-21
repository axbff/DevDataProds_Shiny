library(datasets)

datasetsList = objects("package:datasets")
datasetsList = datasetsList[sapply(datasetsList, function(x){class(get(x))[1]}) %in% "data.frame"]