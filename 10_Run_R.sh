#!/bin/bash

#SBATCH -p compute
#SBATCH -N 1 -c 1
#SBATCH -t 12:00:00
#SBATCH -J ACO_MIcrosatelliteMarkers
#SBATCH -A proj5034

source ~/.bashrc
conda activate RScript

/tarafs/data/project/proj5034-AGBKU/conda/envs/RScript/bin/Rscript ./10_R_Test_plotVCF.R