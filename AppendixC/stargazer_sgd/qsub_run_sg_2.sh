#!/bin/bash -l
#PBS -N pgx_sg
#PBS -l select=1:ncpus=4:mem=128gb
#PBS -l walltime=96:00:00
cd $PBS_O_WORKDIR

module purge
module load java/1.8.0_162
module load r/3.5.1-foss-2018a
module load python/3.6.4-foss-2018a


while IFS="," read -r col1 col2
do 

  python /home/n10135651/Tools/Stargazer_v1.0.8/stargazer.py genotype -t $col1 -c $col2 --vcf /home/n10135651/Project/4_simons_Genome/SGDP_pgx_vcf/sgd_pgx_230_vqsr_filtered.vcf --gdf /home/n10135651/Project/4_simons_Genome/SGDP_pgx_gdf/sgd_pgx_rev.gdf --data wgs -o "$col1"_sgd --output_dir /home/n10135651/Project/4_simons_Genome/sgd_sg/"$col1"

done </home/n10135651/SG_arvind_pgkb/target_control.csv

