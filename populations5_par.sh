#!/bin/bash -l
#SBATCH --job-name=pop5_populations
#SBATCH --output=pop_par5_persulcatus_out
#SBATCH --error=pop_par5_persulcatus_err
#SBATCH --time=24:00:00
#SBATCH --account=project_2005863
#SBATCH --mem-per-cpu=2000
#SBATCH --partition=large
#SBATCH --ntasks=10

module load gcc/9.4.0
module load samtools/1.16.1
module load stacks/2.62

mkdir -p 05_populations_persulcatus

populations -P ./aligned_persulcatus -M popmap -R 0.8 --min-maf 0.05 --write-random-snp --vcf --phylip --fasta-loci --smooth --sigma --genepop -f p_value --hwe --fstats --structure --ordered-export -O 05_populations_persulcatus -t 20 

