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
# In this script, I focus only on male specific loci
group=male
# cat "${VCF_DIRECTORY}/${group}.pileup" | bcftools call -mv -Ob -o "${VCF_DIRECTORY}/${group}.bcf"
bcftools mpileup -Ou -f "${FASTA_DIRECTORY}/${FASTA_FILE}" "${VCF_DIRECTORY}/${group}.pileup" > "${VCF_DIRECTORY}/${group}.bcf"
# cat "${VCF_DIRECTORY}/${group}.pileup" | sam2vcf.pl -r "${FASTA_DIRECTORY}/${FASTA_FILE}" > "${VCF_DIRECTORY}/${group}.vcf"
