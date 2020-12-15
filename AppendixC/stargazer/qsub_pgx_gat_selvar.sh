#!/bin/bash -l
#PBS -N gatk_selectpgxvariants
#PBS -l ncpus=4
#PBS -l mem=48gb
#PBS -l walltime=1:00:00

cd $PBS_O_WORKDIRi

module purge
module load java/1.8.0_162

/home/n10135651/Tools/gatk-4.1.4.0/gatk --java-options "-Xmx36G" SelectVariants -R /home/n10135651/Database2/GATK/TIWI_ref/hs37d5wphix.fa -V /scratch/NagarajLab_BG/indigen_proj/8_jointgenotypge/sentieon_combined_vcf/tiwi_120_cohort_vqsr_filtered.vcf -L /home/n10135651/SG_arvind_pgkb/Stargazer_v1.0.6/Stargazer_v1.0.6/pgx_interval_stg.list --disable-sequence-dictionary-validation true -O /home/n10135651/SG_arvind_pgkb/all_pgx_vcf/tiwi_120_cohort_pgxsg.vcf

