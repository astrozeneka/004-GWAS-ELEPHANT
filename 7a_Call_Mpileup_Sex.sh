#!/bin/bash
#SBATCH -p memory
#SBATCH -N 1 -c 96
#SBATCH -t 5-00:00:00
#SBATCH -J BWAjob
#SBATCH -A proj5034

module purge
module load SAMtools/1.9-intel-2019b


# Argument parsing
female=false
male=false
while getopts "fm" opt; do
    case $opt in
        f)
            female=true
            ;;
        m)
            male=true
            ;;
        \?)
            echo "Invalid option: -$OPTARG" >&2
            exit 1
            ;;
    esac
done


source ./variables.txt

genome_males=()
while IFS= read -r genome; do
    genome_males+=("$genome")
done < by_sex/males.txt

genome_females=()
while IFS= read -r genome; do
    genome_females+=("$genome")
done < by_sex/females.txt

if $male; then
    echo samtools mpileup -uf "${FASTA_DIRECTORY}/${FASTA_FILE}" "${genome_males[*]}_q20_sorted.bam" | bcftools call -mv > "${VCF_DIRECTORY}/male.vcf"
elif $female; then
    echo samtools mpileup -uf "${FASTA_DIRECTORY}/${FASTA_FILE}" "${genome_females[*]}_q20_sorted.bam" | bcftools call -mv> "${VCF_DIRECTORY}/female.vcf"
fi