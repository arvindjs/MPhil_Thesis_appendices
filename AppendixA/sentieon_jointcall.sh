#!/bin/bash -l
#PBS -N sentieonjointcall
#PBS -l select=1:ncpus=48:mem=980gb:ht=true
#PBS -l walltime=166:00:00
cd $PBS_O_WORKDIR
module purge
module load python/2.7.15-foss-2018a
export SENTIEON_LICENSE=/home/n10357050/Tools/Queensland_University_Of_Technology_eval.lic
export SENTIEON_INSTALL_DIR=/home/n10357050/Tools/sentieon-genomics-201808.08/

/home/n10357050/Tools/sentieon-genomics-201808.08/bin/sentieon driver -t 96 -r /scratch/NagarajLab_BG/indigen_proj/TIWI_ref/hs37d5wphix.fa \
   --interval /home/n10357050/intervals_b37_wgs_consolidated_calling_intervals.list \
   --algo GVCFtyper \
   sentieon_combined_vcf/tiwi_120_cohort.vcf   /scratch/NagarajLab_BG/indigen_proj/8_jointgenotypge/*_g.vcf

