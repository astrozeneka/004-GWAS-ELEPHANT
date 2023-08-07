#!/bin/bash
#SBATCH -p memory
#SBATCH -N 1 -n 120
#SBATCH --mem=100GB
#SBATCH -t 5-00:00:00
#SBATCH -A proj5034
#SBATCH -J blastxjob

module purge
module load BLAST+
module load BLASTDB

DB = "/tarafs/data/project/proj5034-AGBKU/map_bwa_ema_Ryan/EMA_genome/uniprotkb-swiss-prot_database/swissprot"
DATADIR="/tarafs/data/home/hrasoara/Projects/004-GWAS-ELEPHANT/data/306_GeneAnnotation"
QUERY_SIG="genes-regions-significant.fasta"
QUERY_POT="genes-regions-potential.fasta"

blastx -db "${DB}" \
  -num_threads 120 \
  -query "${DATADIR}/${QUERY_SIG}" \
  -evalue 0.000001 \
  -outfmt 6 > "${DATADIR}/blastx_e6.xml"