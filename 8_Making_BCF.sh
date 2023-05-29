#!/bin/bash
#SBATCH -p memory
#SBATCH -N 1 -c 96
#SBATCH -t 5-00:00:00
#SBATCH -J BWAjob
#SBATCH -A proj5034

module purge
module load BCFtools/1.10.2-intel-2019b

# In this script, I focus only on male secific loci
group=male
echo "${VCF_DIRECTORY}/${group}.pileup" "|" bcftools call -mv -Ob -o "${VCF_DIRECTORY}/${group}.bcf"