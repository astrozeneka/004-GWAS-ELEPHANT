#!/bin/bash
#SBATCH -p memory
#SBATCH -N 1 -c 96
#SBATCH -t 5-00:00:00
#SBATCH -J BWAjob
#SBATCH -A proj5034

module load VCFtools/0.1.16-GCC-8.3.0

source ./variables.txt
group=male

vcftools -vcf "${VCF_DIRECTORY}/${group}.vcf" -keep allindivs -out gbryri –weir-fst-pop \
    gbrindivs –weir-fst-pop yriindivs