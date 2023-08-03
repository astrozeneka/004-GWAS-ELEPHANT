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
export GEMMA_OUTPUT_DIRECTORY="/tarafs/data/home/hrasoara/proj5034-AGBKU/map_bwa_ema_Ryan/gemma_tusk"
export PHENO_FILE="/tarafs/data/home/hrasoara/proj5034-AGBKU/map_bwa_ema_Ryan/gemma_tusk/pheno.txt"

#1
gemma -bfile "${PLINK_RESULT_DIRECTORY}/snp-tusk" \
-gk -p "${PHENO_FILE}" \
-o "gemma_tusk"
mv output/* "${GEMMA_OUTPUT_DIRECTORY}/"
rm -R output

#rm -R "${GEMMA_OUTPUT_DIRECTORY}"
#mv -R "gemma_tusk" "${GEMMA_OUTPUT_DIRECTORY}"

#2
gemma -bfile "${PLINK_RESULT_DIRECTORY}/snp-tusk" \
-k "${GEMMA_OUTPUT_DIRECTORY}/gemma_tusk.cXX.txt" \
-lmm 1 -o gemma_lmm1
rm output/* "${GEMMA_OUTPUT_DIRECTORY}/"
rm -R output