#!/bin/bash -l
#PBS -N gatk_selectpgxvariants
#PBS -l ncpus=8
#PBS -l mem=36gb
#PBS -l walltime=23:00:00

cd $PBS_O_WORKDIRi

module purge
module load java/1.8.0_162
while read line
do
/home/n10135651/Tools/gatk-4.1.4.0/gatk --java-options "-Xmx32G" SelectVariants -R /home/n10135651/Database2/1000G_Phase3reference/human_g1k_v37.fasta -V $line -L /home/n10135651/SG_arvind_pgkb/Stargazer_v1.0.6/Stargazer_v1.0.6/pgx_interval_stg.list --disable-sequence-dictionary-validation true -O /home/n10135651/Project/4_simons_Genome/SGDP_pgx_vcf/${line:41:-7}"_pgx.vcf"
done < <(ls -1 /home/n10135651/Project/4_simons_Genome/*.vcf.gz)
