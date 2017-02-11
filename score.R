score = function(meta, prediction){

  # known truth: observed phenotypes in the test set
  true.value = meta$true.value
  
  # predictioned phenotypes 
  
  # mean square error (mse)
  mse = mean((true.value-prediction)^2)
  
  # root mean square error (rmse)
  rmse = sqrt(mean((true.value-prediction)^2))
  
  # pearson correlation
  pcor = cor(prediction, true.value)
  
  # simple regression slope
  slope = lm(true.value~prediction)$coef[2]
  
  return(list(mse=mse, rmse=rmse, pcor=pcor, slope=slope))
}
output = score(meta, prediction)
