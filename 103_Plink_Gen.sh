#!/bin/bash
#SBATCH -p memory
#SBATCH -N 1 -c 96
#SBATCH -t 24:00:00
#SBATCH --mem=100GB
#SBATCH -J plink
#SBATCH -A proj5034

source ~/.bashrc
conda activate plink

source ./variables.txt
group="tusk"
export POPULATION_RESULT_DIRECTORY="/tarafs/data/home/hrasoara/proj5034-AGBKU/map_bwa_ema_Ryan/result_population_${group}_2"
export PLINK_RESULT_DIRECTORY="/tarafs/data/home/hrasoara/proj5034-AGBKU/map_bwa_ema_Ryan/result_population_tusk_2/result_plink_tusk_2"

plink --allow-extra-chr --make-bed --double-id --threads 96 \
  --vcf "${POPULATION_RESULT_DIRECTORY}/populations.snps.vcf" \
  --out "${PLINK_RESULT_DIRECTORY}/snp-tusk"

# Need to edit the fam file after it