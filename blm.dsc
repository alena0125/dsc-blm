simulate: datamaker.R
  seed: R(1:50)
  data_set: "wheat"
  test_size: 100
  phenotype_id: 1
  @ALIAS: args = List(data.name = data_set, test.size = test_size, phenotype.id = phenotype_id)
  $data: data$input
  $meta: data$meta

rrblup: rrblup.wrapper.R
  data: $data
  $prediction: prediction

rrblup_gkernel(rrblup): rrblup.gkernel.wrapper.R

bayeslasso(rrblup): bayeslasso.wrapper.R
  nIter: 1.1E4
  burnin: 1E3
  result: file()
  @ALIAS: args = List()

gemma_bslmm(bayeslasso): gemma.bslmm.wrapper.R
  result: file(debug)
  @ALIAS: args = List(w = nIter, s = burnin, result = result)

score: score.R
  meta: $meta
  prediction: $prediction
  $mse: output$mse
  $pcor: output$pcor
  $slope: output$slope

DSC:
  define:
    method: bayeslasso, gemma_bslmm, rrblup, rrblup_gkernel
  run: simulate * method * score
  output: dsc_blm
  exec_path: datamakers, methods, .
  R_libs: BLR, rrBLUP
