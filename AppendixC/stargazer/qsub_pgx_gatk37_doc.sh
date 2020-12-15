#!/bin/bash -l
#PBS -N pgx_gatk37
#PBS -l ncpus=4
#PBS -l mem=128gb
#PBS -l walltime=23:00:00
#PBS -M arvind.jayashankar@hdr.qut.edu.au
cd $PBS_O_WORKDIR

module purge
module load atg/gatk/3.7

gatk    -T DepthOfCoverage \
        -R /home/n10135651/Database2/GATK/TIWI_ref/hs37d5wphix.fa \
        -I /home/n10135651/SG_arvind_pgkb/shell_gatk/tiwi_bam.list \
        -L /home/n10135651/SG_arvind_pgkb/Stargazer_v1.0.6/Stargazer_v1.0.6/pgx_interval_stg.list \
        --minMappingQuality 20 \
        --omitIntervalStatistics \
        --omitPerSampleStats \
        --omitLocusTable \
        -U ALLOW_SEQ_DICT_INCOMPATIBILITY \
        -o /home/n10135651/SG_arvind_pgkb/all_pgx_gdf/tiwi_120_cohort_pgxsg.gdf

