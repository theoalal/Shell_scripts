#!/bin/bash -l
#SBATCH --job-name=pop_populations
#SBATCH --output=pop_par_persulcatus_out
#SBATCH --error=pop_par_persulcatus_err
#SBATCH --time=24:00:00
#SBATCH --account=project_2005863
#SBATCH --mem-per-cpu=2000
#SBATCH --partition=large
#SBATCH --ntasks=10

module load gcc/9.1.0
module load samtools/1.10
module load stacks/2.60

mkdir -p 03_populations_persulcatus

populations -P ./aligned_persulcatus -M popmap_pop -R 0.8 --min-maf 0.05 --write-random-snp --vcf --structure --ordered-export -O 03_populations_persulcatus -t 20 

