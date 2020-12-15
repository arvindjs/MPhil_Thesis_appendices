#!/bin/bash -l
#PBS -N 1kg_selectpgxvariants
#PBS -l ncpus=4
#PBS -l mem=64gb
#PBS -l walltime=24:00:00

cd $PBS_O_WORKDIRi

module purge
module load java/1.8.0_162

/home/n10135651/Tools/gatk-4.1.4.0/gatk IndexFeatureFile -F /scratch/NagarajLab_BG/1kg_plink/All_1KGP3_genotypes.vcf

/home/n10135651/Tools/gatk-4.1.4.0/gatk --java-options "-Xmx48G" SelectVariants -R /home/n10135651/Database2/GATK/TIWI_ref/hs37d5/hs37d5.fa -V /scratch/NagarajLab_BG/1kg_plink/All_1KGP3_genotypes.vcf -L /home/n10135651/SG_arvind_pgkb/Stargazer_v1.0.6/Stargazer_v1.0.6/pgx_interval_stg.list --disable-sequence-dictionary-validation true -O /home/n10135651/Project/1_Boold_Genotyping/1000G_Phase3/1kg_PGX_vcf/1kg_pgx_var.vcf

