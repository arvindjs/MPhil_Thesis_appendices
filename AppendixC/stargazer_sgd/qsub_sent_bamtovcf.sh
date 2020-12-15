#!/bin/bash -l
#PBS -N sent_gatk_varcall
#PBS -l select=1:ncpus=12:mem=96gb:ht=true
#PBS -l walltime=72:00:00
cd $PBS_O_WORKDIR

module purge
module load python/2.7.15-foss-2018a

export SENTIEON_LICENSE=/scratch/NagarajLab_BG/Tools/sentieon-genomics-201911/Queensland_University_Of_Technology_eval.lic
export SENTIEON_INSTALL_DIR=/scratch/NagarajLab_BG/Tools/sentieon-genomics-201911/

while read -r line; do
 echo $line
 /scratch/NagarajLab_BG/Tools/sentieon-genomics-201911/bin/sentieon driver -t 12 -r /home/n10135651/Database2/GATK/TIWI_ref/hs37d5/hs37d5.fa -i $line \
   --interval /home/n10135651/SG_arvind_pgkb/Stargazer_v1.0.6/Stargazer_v1.0.6/pgx_interval_stg.list \
   --algo Haplotyper -d /scratch/NagarajLab_BG/Database2/dbsnp_138.b37.vcf \
   --emit_mode GVCF /home/n10135651/Project/4_simons_Genome/SGDP_pgx_vcf/GVCFs/${line:44:-12}"_g.vcf"
done </scratch/NagarajLab_BG/SGDP_rest_bams/sgd_pgx_bam.list

/scratch/NagarajLab_BG/Tools/sentieon-genomics-201911/bin/sentieon driver -t 24 -r /home/n10135651/Database2/GATK/TIWI_ref/hs37d5/hs37d5.fa \
   --interval /home/n10135651/SG_arvind_pgkb/Stargazer_v1.0.6/Stargazer_v1.0.6/pgx_interval_stg.list \
   --algo GVCFtyper \
   -d /home/n10135651/Database2/GATK/dbsnp_138.hg19wochr.vcf \
   /home/n10135651/Project/4_simons_Genome/SGDP_pgx_vcf/sgd_pgx_230.vcf  /home/n10135651/Project/4_simons_Genome/SGDP_pgx_vcf/GVCFs/*_g.vcf
	
/scratch/NagarajLab_BG/Tools/sentieon-genomics-201911/bin/sentieon driver -t 24 -r /home/n10135651/Database2/GATK/TIWI_ref/hs37d5/hs37d5.fa \
   --algo VarCal -v /home/n10135651/Project/4_simons_Genome/SGDP_pgx_vcf/sgd_pgx_230.vcf \
   --annotation QD --annotation MQ --annotation MQRankSum --annotation ReadPosRankSum --annotation FS --annotation SOR \
   --var_type SNP \
   --resource /scratch/NagarajLab_BG/Database2/1000G_phase1.snps.high_confidence.b37.vcf --resource_param 1000G,known=false,training=true,truth=false,prior=10.0 \
   --resource /scratch/NagarajLab_BG/Database2/dbsnp_138.b37.vcf --resource_param dbsnp,known=true,training=false,truth=false,prior=2.0 \
   --resource /scratch/NagarajLab_BG/Database2/hapmap_3.3.b37.vcf --resource_param hapmap,known=false,training=true,truth=true,prior=15.0 \
   --tranches_file /home/n10135651/Project/4_simons_Genome/SGDP_pgx_vcf/sgd_pgx_230_snp.tranches \
   /home/n10135651/Project/4_simons_Genome/SGDP_pgx_vcf/sgd_pgx_230_snp.recal

/scratch/NagarajLab_BG/Tools/sentieon-genomics-201911/bin/sentieon driver -t 24 -r /home/n10135651/Database2/GATK/TIWI_ref/hs37d5/hs37d5.fa \
   --algo VarCal -v /home/n10135651/Project/4_simons_Genome/SGDP_pgx_vcf/sgd_pgx_230.vcf \
   --annotation QD --annotation MQ --annotation MQRankSum --annotation ReadPosRankSum --annotation FS --annotation SOR \
   --var_type INDEL \
   --resource /scratch/NagarajLab_BG/Database2/dbsnp_138.b37.vcf --resource_param dbsnp,known=true,training=false,truth=false,prior=2.0 \
   --resource /scratch/NagarajLab_BG/Database2/Mills_and_1000G_gold_standard.indels.b37.vcf --resource_param Mills,known=false,training=true,truth=true,prior=12.0 \
   --tranches_file /home/n10135651/Project/4_simons_Genome/SGDP_pgx_vcf/sgd_pgx_230_indel.tranches \
   /home/n10135651/Project/4_simons_Genome/SGDP_pgx_vcf/sgd_pgx_230_indel.recal

/scratch/NagarajLab_BG/Tools/sentieon-genomics-201911/bin/sentieon driver -t 24 -r /home/n10135651/Database2/GATK/TIWI_ref/hs37d5/hs37d5.fa \
   --algo ApplyVarCal -v /home/n10135651/Project/4_simons_Genome/SGDP_pgx_vcf/sgd_pgx_230.vcf \
   --var_type SNP --recal /home/n10135651/Project/4_simons_Genome/SGDP_pgx_vcf/sgd_pgx_230_snp.recal --tranches_file /home/n10135651/Project/4_simons_Genome/SGDP_pgx_vcf/sgd_pgx_230_snp.tranches --sensitivity 99.9 /home/n10135651/Project/4_simons_Genome/SGDP_pgx_vcf/sgd_pgx_230_vqsr_snp.vcf

/scratch/NagarajLab_BG/Tools/sentieon-genomics-201911/bin/sentieon driver -t 24 -r /home/n10135651/Database2/GATK/TIWI_ref/hs37d5/hs37d5.fa \
  --algo ApplyVarCal -v /home/n10135651/Project/4_simons_Genome/SGDP_pgx_vcf/sgd_pgx_230_vqsr_snp.vcf \
  --var_type INDEL --recal /home/n10135651/Project/4_simons_Genome/SGDP_pgx_vcf/sgd_pgx_230_indel.recal --tranches_file /home/n10135651/Project/4_simons_Genome/SGDP_pgx_vcf/sgd_pgx_230_indel.tranches --sensitivity 99.9  /home/n10135651/Project/4_simons_Genome/SGDP_pgx_vcf/sgd_pgx_230_vqsr_filtered.vcf
