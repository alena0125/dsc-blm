# dsc2-blm
Application of DSC2 framework to Bayesian linear models. 

The first version of this benchmark was adapted from [[1]](https://github.com/xiangzhu/dscr_blm) which was initially developed under [DSCR](https://github.com/stephens999/dscr) framework. To run this benchmark you need to install the Python (minimum version required is 3.6) program `dsc`:

```
pip install dsc
```

If you run into issues with the installation please find more information on the DSC2 [installation guide](https://stephenslab.github.io/dsc-wiki/manual/installation.html). 

## Running the benchmark
```
$ dsc blm.dsc -c 8
INFO: DSC script exported to dsc_blm.html
INFO: Constructing DSC from blm.dsc ...
INFO: Building execution graph ...
INFO: DSC in progress ...
DSC: 100%|██████████████████████████████| 10/10 [42:36<00:00, 213.46s/it]
INFO: Building DSC database ...
INFO: DSC complete!
INFO: Elapsed time 2558.711 seconds.
```

## Credits
* Developed by Xiang Zhu and Gao Wang
* Maintained by Peter Carbonetto and Gao Wang
* Supported by Stephens Lab
