#!/bin/bash -l
#PBS -N sent_gatk_depth
#PBS -l select=1:ncpus=12:mem=128gb:ht=true
#PBS -l walltime=24:00:00
cd $PBS_O_WORKDIRi

module purge
module load python/2.7.15-foss-2018a

export SENTIEON_LICENSE=/scratch/NagarajLab_BG/Tools/sentieon-genomics-201911/Queensland_University_Of_Technology_eval.lic
export SENTIEON_INSTALL_DIR=/scratch/NagarajLab_BG/Tools/sentieon-genomics-201911/

doc_argument=""
while read -r line; do
 doc_argument=$doc_argument" -i $line"
done </scratch/NagarajLab_BG/SGDP_rest_bams/sgd_pgx_bam.list

/scratch/NagarajLab_BG/Tools/sentieon-genomics-201911/bin/sentieon driver -t 4 -r /home/n10135651/Database2/GATK/TIWI_ref/hs37d5/hs37d5.fa --interval /home/n10135651/SG_arvind_pgkb/Stargazer_v1.0.6/Stargazer_v1.0.6/pgx_interval_stg.list \
   $doc_argument --algo CoverageMetrics \
   --min_map_qual 20 --omit_interval_stat --omit_sample_stat --omit_locus_stat \
   /home/n10135651/Project/4_simons_Genome/SGDP_pgx_gdf/sgd_pgx.gdf
