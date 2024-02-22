#!/bin/bash -l
#SBATCH --job-name=pop_pers
#SBATCH --output=pop_pers_rici_out
#SBATCH --error=pop_pers_rici_err
#SBATCH --time=24:00:00
#SBATCH --account=project_2005863
#SBATCH --mem-per-cpu=2000
#SBATCH --partition=large
#SBATCH --ntasks=10

module load gcc/9.4.0
module load samtools/1.16.1
module load stacks/2.62

mkdir -p per_rici_populations

populations -P ./aligned_per_rici -M popmap_pure_species -R 0.8 --min-maf 0.05 --write-random-snp --vcf --phylip --fasta-loci --hwe --fstats --genepop --structure --ordered-export -O per_rici_populations -t 20 

