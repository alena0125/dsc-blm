# dsc-blm
Application of DSC framework to Bayesian linear models. 

The first version of this benchmark was adapted from [[1]](https://github.com/xiangzhu/dscr_blm) which was initially developed under [DSCR](https://github.com/stephens999/dscr) framework. To run this benchmark you need to install the Python (minimum version required is 3.6) program `dsc`:

```
pip install dsc
```
If you run into issues with the installation please find more information on the DSC [installation guide](https://stephenslab.github.io/dsc-wiki/installation.html). 

## Running the benchmark

To run only one replicate with 8 CPU threads,

```
$ dsc blm.dsc -c 8

INFO: DSC script exported to dsc_blm.html
INFO: Constructing DSC from blm.dsc ...
INFO: Building execution graph & running DSC ...
DSC: 100%|██████████████████████████████| 10/10 [00:46<00:00,  5.83s/it]
INFO: Building DSC database ...
INFO: DSC complete!
INFO: Elapsed time 57.421 seconds.
```

To run with many replicates, 

```
dsc blm.dsc -c 8 --replicate 100
```

## Credits
* Developed by Xiang Zhu and Gao Wang
* Maintained by Peter Carbonetto and Gao Wang
* Supported by Stephens Lab
