#!/bin/bash
#SBATCH -p memory
#SBATCH -N 1 -c 120
#SBATCH -t 24:00:00
#SBATCH -J population
#SBATCH -A proj5034

module load foss/2021b
export PATH=$PATH:/tarafs/data/project/proj5034-AGBKU/local/bin/


source ./variables.txt
group="tusk"
export STACK_RESULT_DIRECTORY="/tarafs/data/home/hrasoara/proj5034-AGBKU/map_bwa_ema_Ryan/result_stacks_${group}_2"
export POPULATION_RESULT_DIRECTORY="/tarafs/data/home/hrasoara/proj5034-AGBKU/map_bwa_ema_Ryan/result_population_${group}_200"

populations -P "${STACK_RESULT_DIRECTORY}" \
  -O "${POPULATION_RESULT_DIRECTORY}" \
  -M "popmap/EMA_popmap_tusk.txt" \
  --min-samples-per-pop 0.60 \
  --min-maf 0.05 \
  --max-obs-het 0.8 \
  --fstats \
  --fst-correction \
  --genepop \
  --vcf \
  --plink \
  --structure \
  --gtf \
  --fasta-loci \
  --fasta-samples \
  -t 120
