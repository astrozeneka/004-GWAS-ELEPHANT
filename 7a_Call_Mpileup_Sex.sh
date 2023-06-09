#!/bin/bash
#SBATCH -p memory
#SBATCH -N 1 -c 96
#SBATCH -t 5-00:00:00
#SBATCH -J BWAjob
#SBATCH -A proj5034

module purge
module load SAMtools/1.9-intel-2019b
module load BCFtools/1.10.2-intel-2019b

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
    genome_males+=("${genome}_q20_sorted.bam")
done < by_sex/males.txt

genome_females=()
while IFS= read -r genome; do
    genome_females+=("${MAP_DIRECTORY}/${genome}_q20_sorted.bam")
done < by_sex/females.txt

echo $male
echo $female

cwd=$(pwd)
cd $MAP_DIRECTORY
if $male; then
    samtools mpileup -f "${FASTA_DIRECTORY}/${FASTA_FILE}" "${genome_males[@]}" > "${VCF_DIRECTORY}/male.pileup"
elif $female; then
    samtools mpileup -f "${FASTA_DIRECTORY}/${FASTA_FILE}" "${genome_females[@]}" > "${VCF_DIRECTORY}/female.pileup"
fi
cd $cwd
