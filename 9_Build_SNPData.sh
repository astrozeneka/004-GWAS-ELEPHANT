#!/bin/bash
#SBATCH -p memory
#SBATCH -N 1 -c 96
#SBATCH -t 5-00:00:00
#SBATCH -J BWAjob
#SBATCH -A proj5034

module purge
module load BCFtools/1.10.2-intel-2019b
module load SAMtools/1.9-intel-2019b

source ./variables.txt
group=male

echo bcftools filter -i 'Type="snp"' "${VCF_DIRECTORY}/${group}.vcf" '|' bcftools query -f '%CHROM\t%POS\t%INFO/PV\n' '>' "${VCF_DIRECTORY}/${group}_data.txt"
