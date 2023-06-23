#!/bin/bash
#SBATCH -p memory
#SBATCH -N 1 -c 120
#SBATCH -t 24:00:00
#SBATCH -J Stacks
#SBATCH -A proj5034

module load foss/2021b
export PATH=$PATH:/tarafs/data/project/proj5034-AGBKU/local/bin/

source ./variables.txt

group="tusk"
export STACK_RESULT_DIRECTORY="/tarafs/data/home/hrasoara/proj5034-AGBKU/map_bwa_ema_Ryan/result_stacks_${group}_2/"
export FINAL_BAM_DIRECTORY="/tarafs/data/home/hrasoara/proj5034-AGBKU/map_bwa_ema_Ryan/sorted_final_bam/"

ref_map.pl --samples "${FINAL_BAM_DIRECTORY}" --popmap "popmap/EMA_popmap_${group}.txt" \
  -o "${STACK_RESULT_DIRECTORY}" -T 120
