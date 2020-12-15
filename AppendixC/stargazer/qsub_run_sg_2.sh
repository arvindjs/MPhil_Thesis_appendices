#!/bin/bash -l
#PBS -N pgx_sg
#PBS -l ncpus=2
#PBS -l mem=48gb
#PBS -l walltime=12:00:00
#PBS -M arvind.jayashankar@hdr.qut.edu.au
cd $PBS_O_WORKDIR

module purge
module load java/1.8.0_162
module load r/3.5.1-foss-2018a
module load python/3.6.4-foss-2018a

while IFS="," read -r col1 col2
do 

python  /home/n10135651/Tools/Stargazer_v1.0.8/stargazer.py genotype -t $col1 -c $col2 --data wgs --vcf ~/SG_arvind_pgkb/all_pgx_vcf/tiwi_120_cohort_vqsr_filtered_pgxsg_norm.vcf --gdf ~/SG_arvind_pgkb/all_pgx_gdf/tiwi_120_cohort_pgxsg.gdf -o "$col1"_tiwi  --output_dir /home/n10135651/SG_arvind_pgkb/Results/$col1/

done </home/n10135651/SG_arvind_pgkb/target_control.csv
