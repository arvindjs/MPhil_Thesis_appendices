#!/bin/bash -l
#PBS -N sentieonapply_var
#PBS -l select=1:ncpus=12:mem=24gb:ht=true
#PBS -l walltime=00:30:00
cd $PBS_O_WORKDIR
module purge
module load python/2.7.15-foss-2018a

export SENTIEON_LICENSE=/home/n10357050/Tools/Queensland_University_Of_Technology_eval.lic
export SENTIEON_INSTALL_DIR=/home/n10357050/Tools/sentieon-genomics-201808.08

/home/n10357050/Tools/sentieon-genomics-201808.08/bin/sentieon driver -t 24 -r /scratch/NagarajLab_BG/indigen_proj/TIWI_ref/hs37d5wphix.fa \
   --algo ApplyVarCal -v /scratch/NagarajLab_BG/indigen_proj/8_jointgenotypge/sentieon_combined_vcf/tiwi_120_cohort.vcf \
   --var_type SNP --recal /scratch/NagarajLab_BG/indigen_proj/8_jointgenotypge/sentieon_combined_vcf/tiwi_120_snp.recal --tranches_file /scratch/NagarajLab_BG/indigen_proj/8_jointgenotypge/sentieon_combined_vcf/tiwi_120_snp.tranches --sensitivity 99.9 /scratch/NagarajLab_BG/indigen_proj/8_jointgenotypge/sentieon_combined_vcf/tiwi_120_cohort_vqsr_snp.vcf

/home/n10357050/Tools/sentieon-genomics-201808.08/bin/sentieon driver -t 24 -r /scratch/NagarajLab_BG/indigen_proj/TIWI_ref/hs37d5wphix.fa \
  --algo ApplyVarCal -v /scratch/NagarajLab_BG/indigen_proj/8_jointgenotypge/sentieon_combined_vcf/tiwi_120_cohort_vqsr_snp.vcf \
  --var_type INDEL --recal /scratch/NagarajLab_BG/indigen_proj/8_jointgenotypge/sentieon_combined_vcf/tiwi_120_indel.recal --tranches_file /scratch/NagarajLab_BG/indigen_proj/8_jointgenotypge/sentieon_combined_vcf/tiwi_120_indel.tranches --sensitivity 99.9  /scratch/NagarajLab_BG/indigen_proj/8_jointgenotypge/sentieon_combined_vcf/tiwi_120_cohort_vqsr_filtered.vcf
