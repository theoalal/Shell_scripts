#!/bin/bash -l
#SBATCH --job-name=bwa_mem
#SBATCH --output=bwa_mem_ric_out
#SBATCH --error=bwa_mem_ric_err
#SBATCH --time=3-00:00:00
#SBATCH --account=project_2005863
#SBATCH --mem-per-cpu=40000
#SBATCH --partition=large
#SBATCH --ntasks=20

module load gcc/9.4.0
module load bwa-mem2/2.2
module load samtools/1.16.1

mkdir -p aligned_rici

files="KK10168-ric-a-f
KK10487-ric-a-f
KK1077-ric-a-f
KK1106-ric-a-f
KK12067-ric-a-f
KK12244-ric-a-f
KK127-ric-a-f
KK12907-ric-a-f
KK1296-ric-a-f
KK13067-ric-a-f
KK13068-ric-a-f
KK13069-ric-a-f
KK13380-ric-a-f
KK13442-ric-a-f
KK13443-ric-a-f
KK13444-ric-a-f
KK13445-ric-a-f
KK13516-ric-a-m
KK14513-ric-a-f
KK14529-ric-a-f
KK15038-ric-a-f
KK15041-ric-a-f
KK15053-ric-n-
KK16036-ric-a-f
KK16325-ric-a-f
KK16326-ric-a-f
KK16327-ric-a-f
KK16328-ric-a-f
KK17101-ric-a-f
KK18046-ric-a-f
KK18308-ric-a-f
KK1913-ric-a-f
KK1915-ric-a-f
KK19782-ric-a-f
KK1980-ric-a-f
KK20103-ric-a-f
KK2060-ric-a-f
KK2061-ric-a-f
KK2063-ric-a-f
KK2064-ric-a-f
KK2065-ric-a-f
KK2066-ric-a-m
KK2067-ric-a-m
KK2068-ric-a-m
KK2069-ric-a-m
KK2070-ric-a-m
KK2071-ric-a-f
KK2251-ric-a-f
KK2523-ric-a-f
KK2771-ric-a-f
KK34-ric-a-m
KK3639-ric-a-f
KK3730-ric-a-f
KK3732-ric-a-f
KK4413-ric-a-f
KK4932-ric-a-f
KK4933-ric-a-f
KK5090-ric-a-f
KK5094-ric-a-f
KK5095-ric-a-f
KK5134-ric-a-f
KK5266-ric-a-f
KK5272-ric-a-f
KK5289-ric-a-m
KK5290-ric-a-m
KK5424-ric-a-f
KK5425-ric-a-f
KK5426-ric-a-f
KK552-ric-a-f
KK6200-ric-a-f
KK6206-ric-a-f
KK6221-ric-a-f
KK6548-ric-a-f
KK6554-ric-a-f
KK6556-ric-a-f
KK6560-ric-a-f
KK6567-ric-a-f
KK6743-ric-a-f
KK7349-ric-a-f
KK7350-ric-a-f
KK7635-ric-a-f
KK7636-ric-a-f
KK79-ric-a-f
KK867-ric-a-f
KK878-ric-a-f
KK8790-ric-a-m
KK883-ric-a-f
KK887-ric-a-f
V4662-ric-a-F
V4663-ric-a-F
V9329-ric-a-M
V9354-ric-a-F
V9355-ric-a-F
V9356-ric-a-F
V9357-ric-a-F"

for sample in $files
do
        bwa-mem2 mem -t 10 /scratch/project_2005863/data/ixo_rici/ixorici.fna.gz ${sample}_?*_R1_mod.fastq.gz |
         samtools view -b |
         samtools sort --threads 10 > aligned_rici/${sample}.bam
done

