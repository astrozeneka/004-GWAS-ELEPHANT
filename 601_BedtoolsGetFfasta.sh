#!/bin/bash

#SBATCH -p memory
#SBATCH -N 1 -c 1

module load BEDTools/2.28.0-intel-2019b

FASTA_DIRECTORY="/tarafs/data/home/hrasoara/gwas-ema"
FASTA_FILE="GCA_024166365.1_mEleMax1_primary_haplotype_genomic.fna"

bedtools getfasta -fi "${FASTA_DIRECTORY}/${FASTA_FILE}" -bed data/306_GeneAnnotation/regions-pot.bed -fo genes-regions-potential.fasta
bedtools getfasta -fi "${FASTA_DIRECTORY}/${FASTA_FILE}" -bed data/306_GeneAnnotation/regions-sig.bed -fo genes-regions-significant.fasta

