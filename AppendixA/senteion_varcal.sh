#!/bin/bash -l
#PBS -N sentieonvarcall
#PBS -l select=1:ncpus=12:mem=24gb:ht=true
#PBS -l walltime=2:00:00
cd $PBS_O_WORKDIR
module purge
module load python/2.7.15-foss-2018a

export SENTIEON_LICENSE=/home/n10357050/Tools/Queensland_University_Of_Technology_eval.lic
export SENTIEON_INSTALL_DIR=/home/n10357050/Tools/sentieon-genomics-201808.08

/home/n10357050/Tools/sentieon-genomics-201808.08/bin/sentieon driver -t 24 -r /scratch/NagarajLab_BG/indigen_proj/TIWI_ref/hs37d5wphix.fa \
   --algo VarCal -v /scratch/NagarajLab_BG/indigen_proj/8_jointgenotypge/sentieon_combined_vcf/tiwi_120_cohort.vcf \
   --annotation QD --annotation MQ --annotation MQRankSum --annotation ReadPosRankSum --annotation FS --annotation SOR \
   --var_type SNP \
   --resource /scratch/NagarajLab_BG/Database2/1000G_phase1.snps.high_confidence.b37.vcf --resource_param 1000G,known=false,training=true,truth=false,prior=10.0 \
   --resource /scratch/NagarajLab_BG/Database2/dbsnp_138.b37.vcf --resource_param dbsnp,known=true,training=false,truth=false,prior=2.0 \
   --resource /scratch/NagarajLab_BG/Database2/hapmap_3.3.b37.vcf --resource_param hapmap,known=false,training=true,truth=true,prior=15.0 \
   --tranches_file /scratch/NagarajLab_BG/indigen_proj/8_jointgenotypge/sentieon_combined_vcf/tiwi_120_snp.tranches \
   /scratch/NagarajLab_BG/indigen_proj/8_jointgenotypge/sentieon_combined_vcf/tiwi_120_snp.recal

/home/n10357050/Tools/sentieon-genomics-201808.08/bin/sentieon driver -t 24 -r /scratch/NagarajLab_BG/indigen_proj/TIWI_ref/hs37d5wphix.fa \
   --algo VarCal -v /scratch/NagarajLab_BG/indigen_proj/8_jointgenotypge/sentieon_combined_vcf/tiwi_120_cohort.vcf \
   --annotation QD --annotation MQ --annotation MQRankSum --annotation ReadPosRankSum --annotation FS --annotation SOR \
   --var_type INDEL \
   --resource /scratch/NagarajLab_BG/Database2/dbsnp_138.b37.vcf --resource_param dbsnp,known=true,training=false,truth=false,prior=2.0 \
   --resource /scratch/NagarajLab_BG/Database2/Mills_and_1000G_gold_standard.indels.b37.vcf --resource_param Mills,known=false,training=true,truth=true,prior=12.0 \
   --tranches_file /scratch/NagarajLab_BG/indigen_proj/8_jointgenotypge/sentieon_combined_vcf/tiwi_120_indel.tranches \
   /scratch/NagarajLab_BG/indigen_proj/8_jointgenotypge/sentieon_combined_vcf/tiwi_120_indel.recal
