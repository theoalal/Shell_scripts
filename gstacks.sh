#!/bin/bash -l
#SBATCH --job-name=pop_populations
#SBATCH --output=pop_persulcatus_out
#SBATCH --error=pop_persulcatus_err
#SBATCH --time=24:00:00
#SBATCH --account=project_2005863
#SBATCH --mem-per-cpu=2000
#SBATCH --partition=large
#SBATCH --ntasks=10

module load gcc/9.4.0
module load samtools/1.16.1
module load stacks/2.62

mkdir -p 5_gstacks_persulcatus

gstacks -I ./aligned_persulcatus -M popmap -O 5_gstacks_persulcatus -t 20 

