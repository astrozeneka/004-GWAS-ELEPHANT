#!/bin/bash
#SBATCH -p memory
#SBATCH -N 1 -c 32
#SBATCH -t 24:00:00
#SBATCH --mem=100GB
#SBATCH -J plink
#SBATCH -A proj5034

source ~/.bashrc
conda activate plink

source variables.txt
group="tusk"

export POPULATION_RESULT_DIRECTORY="/tarafs/data/home/hrasoara/proj5034-AGBKU/map_bwa_ema_Ryan/result_population_${group}_2"
export PLINK_RESULT_DIRECTORY="/tarafs/data/home/hrasoara/proj5034-AGBKU/map_bwa_ema_Ryan/result_plink_tusk_2"
export ROH_RESULT_DIRECTORY="/tarafs/data/home/hrasoara/proj5034-AGBKU/map_bwa_ema_Ryan/result_plink_tusk_2/roh"

plink --threads 32 --allow-no-sex --allow-extra-chr \
  --bfile "${PLINK_RESULT_DIRECTORY}/snp-tusk" \
  --homozyg --out "${ROH_RESULT_DIRECTORY}"
echo "Done"
