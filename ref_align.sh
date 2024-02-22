#!/bin/bash -l
#SBATCH --job-name=bwa_mem
#SBATCH --output=bwa_mem_pers_out
#SBATCH --error=bwa_mem_pers_err
#SBATCH --time=3-00:00:00
#SBATCH --account=project_2005863
#SBATCH --mem-per-cpu=20000
#SBATCH --partition=large
#SBATCH --ntasks=20

module load gcc/9.1.0
module load bwa-mem2/2.2
module load samtools/1.7

mkdir -p aligned_persulcatus

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
KK10168-ric-a-f
KK1019-per-a-f
KK10487-ric-a-f
KK1077-ric-a-f
KK1088-per-a-f
KK1106-ric-a-f
KK1148-per-a-m
KK1153-per-a-f
KK12067-ric-a-f
KK12068-per-a-f
KK12234-per-a-f
KK12244-ric-a-f
KK12302-per-a-f
KK127-ric-a-f
KK12907-ric-a-f
KK1296-ric-a-f
KK13017-per-a-f
KK13018-per-a-f
KK13067-ric-a-f
KK13068-ric-a-f
KK13069-ric-a-f
KK13380-ric-a-f
KK13442-ric-a-f
KK13443-ric-a-f
KK13444-ric-a-f
KK13445-ric-a-f
KK13516-ric-a-m
KK1383-per-a-f
KK1384-per-a-f
KK1385-per-a-f
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
KK16680-per-a-f
KK17101-ric-a-f
KK17288-per-a-f
KK1749-per-a-f
KK1750-per-a-m
KK1766-per-a-f
KK1773-per-a-f
KK1789-per-a-f
KK18046-ric-a-f
KK18308-ric-a-f
KK1878-per-a-f
KK19050-per-a-f
KK1913-ric-a-f
KK1915-ric-a-f
KK19637-per-a-f
KK19640-per-a-f
KK19646-per-a-f
KK19652-per-a-f
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
KK2163-per-a-f
KK2251-ric-a-f
KK2254-per-a-f
KK2265-per-a-f
KK2293-per-a-m
KK2326-per-a-f
KK2329-per-a-f
KK2523-ric-a-f
KK2765-per-a-f
KK2766-per-a-f
KK2767-per-a-f
KK2768-per-a-f
KK2771-ric-a-f
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
KK34-ric-a-m
KK3639-ric-a-f
KK3730-ric-a-f
KK3732-ric-a-f
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
KK4413-ric-a-f
KK4449-per-a-f
KK4451-per-a-f
KK487-per-a-f
KK4932-ric-a-f
KK4933-ric-a-f
KK4968-per-a-f
KK507-per-a-f
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
KK6096-per-a-f
KK6188-per-a-f
KK6200-ric-a-f
KK6206-ric-a-f
KK6221-ric-a-f
KK6246-per-a-m
KK6253-per-a-f
KK6292-per-a-m
KK6369-per-a-f
KK6407-per-a-m
KK6548-ric-a-f
KK6554-ric-a-f
KK6556-ric-a-f
KK6560-ric-a-f
KK6567-ric-a-f
KK6743-ric-a-f
KK7091-per-a-f
KK7092-per-a-f
KK7097-per-a-m
KK7264-per-a-f
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
        bwa-mem2 mem -t 10 /scratch/project_2005863/data/ixo_persul/ixopers.fna ${sample}_?*_R1_mod.fastq.gz |
         samtools view -b |
         samtools sort --threads 10 > aligned_persulcatus/${sample}.bam
done

