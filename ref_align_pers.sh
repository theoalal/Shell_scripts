#!/bin/bash -l
#SBATCH --job-name=bwa_mem
#SBATCH --output=bwa_mem_pers_out
#SBATCH --error=bwa_mem_pers_err
#SBATCH --time=3-00:00:00
#SBATCH --account=project_2005863
#SBATCH --mem-per-cpu=40000
#SBATCH --partition=large
#SBATCH --ntasks=20

module load gcc/9.4.0
module load bwa-mem2/2.2
module load samtools/1.16.1

mkdir -p aligned_persul

files="JG10-per-a-f
JG1-per-a-m
JG2-per-a-m
JG3-per-a-f
JG4-per-a-f
JG6-per-a-m
JG7A-per-a-f
JG7B-per-a-f
JG7C-per-a-f
JG8-per-a-f
JG9-per-a-m
KK1019-per-a-f
KK1088-per-a-f
KK1148-per-a-m
KK1153-per-a-f
KK12068-per-a-f
KK12234-per-a-f
KK12302-per-a-f
KK13017-per-a-f
KK13018-per-a-f
KK1383-per-a-f
KK1384-per-a-f
KK1385-per-a-f
KK16680-per-a-f
KK17288-per-a-f
KK1749-per-a-f
KK1750-per-a-m
KK1766-per-a-f
KK1773-per-a-f
KK1789-per-a-f
KK1878-per-a-f
KK19050-per-a-f
KK19637-per-a-f
KK19640-per-a-f
KK19646-per-a-f
KK19652-per-a-f
KK2163-per-a-f
KK2254-per-a-f
KK2265-per-a-f
KK2293-per-a-m
KK2326-per-a-f
KK2329-per-a-f
KK2765-per-a-f
KK2766-per-a-f
KK2767-per-a-f
KK2768-per-a-f
KK2785-per-a-f
KK2804-per-a-f
KK2818-per-a-f
KK2819-per-a-f
KK2820-per-a-f
KK2821-per-a-m
KK2822-per-n-
KK2860-per-a-f
KK3019-per-a-f
KK3076-per-a-f
KK3085-per-a-m
KK3086-per-a-f
KK3087-per-a-m
KK3145-per-a-f
KK3256-per-a-f
KK3294-per-a-f
KK3385-per-a-f
KK3780-per-a-f
KK3781-per-a-f
KK3796-per-a-f
KK3820-per-a-f
KK3897-per-a-f
KK3968-per-a-f
KK4177-per-a-f
KK4181-per-a-f
KK4186-per-a-f
KK4196-per-a-f
KK4198-per-a-f
KK4200-per-a-f
KK4204-per-a-f
KK4205-per-a-f
KK4396-per-a-f
KK4449-per-a-f
KK4451-per-a-f
KK487-per-a-f
KK4968-per-a-f
KK507-per-a-f
KK6096-per-a-f
KK6188-per-a-f
KK6246-per-a-m
KK6253-per-a-f
KK6292-per-a-m
KK6369-per-a-f
KK6407-per-a-m
KK7091-per-a-f
KK7092-per-a-f
KK7097-per-a-m
KK7264-per-a-f"

for sample in $files
do
        bwa-mem2 mem -t 10 /scratch/project_2005863/data/ixo_persul/ixopers.fna ${sample}_?*_R1_mod.fastq.gz |
         samtools view -b |
         samtools sort --threads 10 > aligned_persul/${sample}.bam
done

