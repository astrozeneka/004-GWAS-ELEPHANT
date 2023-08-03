###################################### GEMMA ######################################
#!/bin/bash
#SBATCH -p memory
#SBATCH -N 1 -c 96
#SBATCH -t 5-00:00:00
#SBATCH -J gemma
#SBATCH -A proj5034

source ~/.bashrc
conda activate gemma

source variables.txt
export PLINK_RESULT_DIRECTORY="/tarafs/data/home/hrasoara/proj5034-AGBKU/map_bwa_ema_Ryan/result_plink_tusk_2"
export GEMMA_OUTPUT_DIRECTORY="/tarafs/data/home/hrasoara/proj5034-AGBKU/map_bwa_ema_Ryan/gemma_tusk/tusk"
export PHENO_FILE="/tarafs/data/home/hrasoara/proj5034-AGBKU/map_bwa_ema_Ryan/gemma_tusk/pheno.txt"

#1
gemma -bfile "${PLINK_RESULT_DIRECTORY}/snp-tusk" \
-gk -p "${PHENO_FILE}" \
-o "gemma_tusk"


#2
#gemma -bfile /tarafs/data/project/proj5034-AGBKU/map_bwa_ema_Ryan/plink_ema_hair/snp.hair -k gemma_kinship.cXX.txt -lmm 1 -o gemma_lmm1