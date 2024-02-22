#!/bin/bash -l
#SBATCH --job-name=pers_rici_stacks
#SBATCH --output=pers_rici_stacks_out
#SBATCH --error=pers_rici_stacks_err
#SBATCH --time=24:00:00
#SBATCH --account=project_2005863
#SBATCH --mem-per-cpu=2000
#SBATCH --partition=large
#SBATCH --ntasks=10

module load gcc/9.4.0
module load samtools/1.16.1
module load stacks/2.62

mkdir -p persul_rici_stacks

gstacks -I ./aligned_persul -M ./popmap_pure_species -O persul_rici_stacks -t 8 

