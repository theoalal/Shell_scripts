#!/bin/bash -l
#SBATCH --job-name=bwa_mem
#SBATCH --output=bwa_mem_out
#SBATCH --error=bwa_mem_err
#SBATCH --time=3-00:00:00
#SBATCH --account=project_2005863
#SBATCH --mem-per-cpu=20000
#SBATCH --partition=large
#SBATCH --ntasks=20

module load gcc/9.4.0
module load bwa-mem2/2.2.1
module load samtools/0.1.19

mkdir -p aligned

files="JG10-per-a-f
JG1-per-a-m
JG2-per-a-m
JG3-per-a-f
JG4-per-a-f
JG6-per-a-m
JG7A-per-a-f
JG7B-per-a-f
JG7C-per-a-f
JG7D-per-a-f
JG7E-per-a-f
JG7F-per-a-f
JG8-per-a-f
JG9-per-a-m
V4662-ric-a-F
V4663-ric-a-F
V9329-ric-a-M
V9354-ric-a-F
V9355-ric-a-F
V9356-ric-a-F
V9357-ric-a-F"

for sample in $files
do
        bwa mem -t 10 /scratch/project_2005863/data/OED169023 ${sample}_?*_R1_mod.fastq.gz |
         samtools view -b |
         samtools sort --threads 10 > aligned/${sample}.bam
done

