#!/bin/bash

module purge

module use -a /contrib/miniconda3/modulefiles
module load miniconda3/4.5.12
conda activate pygraf

# SSM: Load intel and a different version of wgrib2
module load intel/18.0.5.274
module load wgrib2/2.0.8

module list
