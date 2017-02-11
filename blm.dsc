scenarios:
  exec: datamaker.R
  seed: R(1:50)
  params:
    data_set: "wheat"
    test_size: 100
    phenotype_id: 1
    .alias: args = Pack(data.name = data_set, test.size = test_size, phenotype.id = phenotype_id)
  return: input = data$input, meta = data$meta

bayeslasso:
  exec: bayeslasso.wrapper.R
  .alias: bayeslasso
  params:
    input: $input
    nIter: 1.1E4
    burnin: 1E3
    .alias: args = Pack()
  return: prediction

gemma_bslmm(bayeslasso):
  exec: gemma.bslmm.wrapper.R
  .alias: gemma_bslmm
  params:
    result: File()
    .alias: args = Pack(w = nIter, s = burnin, result = result)

rrblup:
  exec: rrblup.wrapper.R
  .alias: rrblup
  params:
    input: $input
  return: prediction

rrblup_gkernel(rrblup):
  exec: rrblup.gkernel.wrapper.R
  .alias: rrblup_gkernel

score:
  exec: score.R
  params:
    meta: $meta
    prediction: $prediction
  return: mse = output$mse, pcor = output$pcor, slope = output$slope

DSC:
  run: scenarios * (bayeslasso, gemma_bslmm, rrblup, rrblup_gkernel) * score 
  output: dsc_blm
  exec_path: datamakers, methods, .
  R_libs: BLR, rrBLUP
