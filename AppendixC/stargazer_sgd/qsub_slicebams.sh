#!/bin/bash -l
#PBS -N slicebasgd
#PBS -l select=1:ncpus=16:mem=175gb:ht=true
#PBS -l walltime=4:00:00
cd $PBS_O_WORKDIR
##
##N=32
##(
##for file in $(cat /scratch/NagarajLab_BG/SGDP_rest_bams/sgd_pgx.list); do 
##   ((i=i%N)); ((i++==0)) && wait
##  samtools view -b -h  $file -L ~/SG_arvind_pgkb/Stargazer_v1.0.6/Stargazer_v1.0.6/pgx_interval_stg.bed > /scratch/NagarajLab_BG/SGDP_rest_bams/${file:44:-12}"_pgx.bam" & 
##done
##)
samtools view -b -h /home/n10135651/Project/4_simons_Genome/BAM/LP6005592-DNA_G03.srt.aln.bam -L ~/SG_arvind_pgkb/Stargazer_v1.0.6/Stargazer_v1.0.6/pgx_interval_stg.bed > /scratch/NagarajLab_BG/SGDP_rest_bams/LP6005592-DNA_G03_pgx.bam &
samtools view -b -h /home/n10135651/Project/4_simons_Genome/BAM/LP6005592-DNA_H01.srt.aln.bam -L ~/SG_arvind_pgkb/Stargazer_v1.0.6/Stargazer_v1.0.6/pgx_interval_stg.bed > /scratch/NagarajLab_BG/SGDP_rest_bams/LP6005592-DNA_H01_pgx.bam &
samtools view -b -h /home/n10135651/Project/4_simons_Genome/BAM/LP6005592-DNA_H03.srt.aln.bam -L ~/SG_arvind_pgkb/Stargazer_v1.0.6/Stargazer_v1.0.6/pgx_interval_stg.bed > /scratch/NagarajLab_BG/SGDP_rest_bams/LP6005592-DNA_H03_pgx.bam &
samtools view -b -h /home/n10135651/Project/4_simons_Genome/BAM/LP6005619-DNA_B01.srt.aln.bam -L ~/SG_arvind_pgkb/Stargazer_v1.0.6/Stargazer_v1.0.6/pgx_interval_stg.bed > /scratch/NagarajLab_BG/SGDP_rest_bams/LP6005619-DNA_B01_pgx.bam &
samtools view -b -h /home/n10135651/Project/4_simons_Genome/BAM/LP6005619-DNA_C01.srt.aln.bam -L ~/SG_arvind_pgkb/Stargazer_v1.0.6/Stargazer_v1.0.6/pgx_interval_stg.bed > /scratch/NagarajLab_BG/SGDP_rest_bams/LP6005619-DNA_C01_pgx.bam &
samtools view -b -h /home/n10135651/Project/4_simons_Genome/BAM/LP6005677-DNA_A02.srt.aln.bam -L ~/SG_arvind_pgkb/Stargazer_v1.0.6/Stargazer_v1.0.6/pgx_interval_stg.bed > /scratch/NagarajLab_BG/SGDP_rest_bams/LP6005677-DNA_A02_pgx.bam &
samtools view -b -h /home/n10135651/Project/4_simons_Genome/BAM/LP6005677-DNA_A03.srt.aln.bam -L ~/SG_arvind_pgkb/Stargazer_v1.0.6/Stargazer_v1.0.6/pgx_interval_stg.bed > /scratch/NagarajLab_BG/SGDP_rest_bams/LP6005677-DNA_A03_pgx.bam &
samtools view -b -h /home/n10135651/Project/4_simons_Genome/BAM/LP6005677-DNA_B01.srt.aln.bam -L ~/SG_arvind_pgkb/Stargazer_v1.0.6/Stargazer_v1.0.6/pgx_interval_stg.bed > /scratch/NagarajLab_BG/SGDP_rest_bams/LP6005677-DNA_B01_pgx.bam &
samtools view -b -h /home/n10135651/Project/4_simons_Genome/BAM/LP6005677-DNA_B02.srt.aln.bam -L ~/SG_arvind_pgkb/Stargazer_v1.0.6/Stargazer_v1.0.6/pgx_interval_stg.bed > /scratch/NagarajLab_BG/SGDP_rest_bams/LP6005677-DNA_B02_pgx.bam &
samtools view -b -h /home/n10135651/Project/4_simons_Genome/BAM/LP6005677-DNA_C03.srt.aln.bam -L ~/SG_arvind_pgkb/Stargazer_v1.0.6/Stargazer_v1.0.6/pgx_interval_stg.bed > /scratch/NagarajLab_BG/SGDP_rest_bams/LP6005677-DNA_C03_pgx.bam &
samtools view -b -h /home/n10135651/Project/4_simons_Genome/BAM/LP6005677-DNA_D01.srt.aln.bam -L ~/SG_arvind_pgkb/Stargazer_v1.0.6/Stargazer_v1.0.6/pgx_interval_stg.bed > /scratch/NagarajLab_BG/SGDP_rest_bams/LP6005677-DNA_D01_pgx.bam &
samtools view -b -h /home/n10135651/Project/4_simons_Genome/BAM/LP6005677-DNA_D03.srt.aln.bam -L ~/SG_arvind_pgkb/Stargazer_v1.0.6/Stargazer_v1.0.6/pgx_interval_stg.bed > /scratch/NagarajLab_BG/SGDP_rest_bams/LP6005677-DNA_D03_pgx.bam &
samtools view -b -h /home/n10135651/Project/4_simons_Genome/BAM/LP6005677-DNA_E01.srt.aln.bam -L ~/SG_arvind_pgkb/Stargazer_v1.0.6/Stargazer_v1.0.6/pgx_interval_stg.bed > /scratch/NagarajLab_BG/SGDP_rest_bams/LP6005677-DNA_E01_pgx.bam &
samtools view -b -h /home/n10135651/Project/4_simons_Genome/BAM/LP6005677-DNA_F01.srt.aln.bam -L ~/SG_arvind_pgkb/Stargazer_v1.0.6/Stargazer_v1.0.6/pgx_interval_stg.bed > /scratch/NagarajLab_BG/SGDP_rest_bams/LP6005677-DNA_F01_pgx.bam &
samtools view -b -h /home/n10135651/Project/4_simons_Genome/BAM/LP6005677-DNA_G01.srt.aln.bam -L ~/SG_arvind_pgkb/Stargazer_v1.0.6/Stargazer_v1.0.6/pgx_interval_stg.bed > /scratch/NagarajLab_BG/SGDP_rest_bams/LP6005677-DNA_G01_pgx.bam &
samtools view -b -h /home/n10135651/Project/4_simons_Genome/BAM/LP6007068-DNA_A01.srt.aln.bam -L ~/SG_arvind_pgkb/Stargazer_v1.0.6/Stargazer_v1.0.6/pgx_interval_stg.bed > /scratch/NagarajLab_BG/SGDP_rest_bams/LP6007068-DNA_A01_pgx.bam &
samtools view -b -h /home/n10135651/Project/4_simons_Genome/BAM/LP6007069-DNA_A01.srt.aln.bam -L ~/SG_arvind_pgkb/Stargazer_v1.0.6/Stargazer_v1.0.6/pgx_interval_stg.bed > /scratch/NagarajLab_BG/SGDP_rest_bams/LP6007069-DNA_A01_pgx.bam &
samtools view -b -h /home/n10135651/Project/4_simons_Genome/BAM/SS6004467.srt.aln.bam -L ~/SG_arvind_pgkb/Stargazer_v1.0.6/Stargazer_v1.0.6/pgx_interval_stg.bed > /scratch/NagarajLab_BG/SGDP_rest_bams/SS6004467_pgx.bam &
samtools view -b -h /home/n10135651/Project/4_simons_Genome/BAM/SS6004468.srt.aln.bam -L ~/SG_arvind_pgkb/Stargazer_v1.0.6/Stargazer_v1.0.6/pgx_interval_stg.bed > /scratch/NagarajLab_BG/SGDP_rest_bams/SS6004468_pgx.bam &
samtools view -b -h /home/n10135651/Project/4_simons_Genome/BAM/SS6004469.srt.aln.bam -L ~/SG_arvind_pgkb/Stargazer_v1.0.6/Stargazer_v1.0.6/pgx_interval_stg.bed > /scratch/NagarajLab_BG/SGDP_rest_bams/SS6004469_pgx.bam &
samtools view -b -h /home/n10135651/Project/4_simons_Genome/BAM/SS6004470.srt.aln.bam -L ~/SG_arvind_pgkb/Stargazer_v1.0.6/Stargazer_v1.0.6/pgx_interval_stg.bed > /scratch/NagarajLab_BG/SGDP_rest_bams/SS6004470_pgx.bam &
samtools view -b -h /home/n10135651/Project/4_simons_Genome/BAM/SS6004471.srt.aln.bam -L ~/SG_arvind_pgkb/Stargazer_v1.0.6/Stargazer_v1.0.6/pgx_interval_stg.bed > /scratch/NagarajLab_BG/SGDP_rest_bams/SS6004471_pgx.bam &
samtools view -b -h /home/n10135651/Project/4_simons_Genome/BAM/SS6004472.srt.aln.bam -L ~/SG_arvind_pgkb/Stargazer_v1.0.6/Stargazer_v1.0.6/pgx_interval_stg.bed > /scratch/NagarajLab_BG/SGDP_rest_bams/SS6004472_pgx.bam &
samtools view -b -h /home/n10135651/Project/4_simons_Genome/BAM/SS6004473.srt.aln.bam -L ~/SG_arvind_pgkb/Stargazer_v1.0.6/Stargazer_v1.0.6/pgx_interval_stg.bed > /scratch/NagarajLab_BG/SGDP_rest_bams/SS6004473_pgx.bam &
samtools view -b -h /home/n10135651/Project/4_simons_Genome/BAM/SS6004474.srt.aln.bam -L ~/SG_arvind_pgkb/Stargazer_v1.0.6/Stargazer_v1.0.6/pgx_interval_stg.bed > /scratch/NagarajLab_BG/SGDP_rest_bams/SS6004474_pgx.bam &
samtools view -b -h /home/n10135651/Project/4_simons_Genome/BAM/SS6004475.srt.aln.bam -L ~/SG_arvind_pgkb/Stargazer_v1.0.6/Stargazer_v1.0.6/pgx_interval_stg.bed > /scratch/NagarajLab_BG/SGDP_rest_bams/SS6004475_pgx.bam &
samtools view -b -h /home/n10135651/Project/4_simons_Genome/BAM/SS6004476.srt.aln.bam -L ~/SG_arvind_pgkb/Stargazer_v1.0.6/Stargazer_v1.0.6/pgx_interval_stg.bed > /scratch/NagarajLab_BG/SGDP_rest_bams/SS6004476_pgx.bam &
samtools view -b -h /home/n10135651/Project/4_simons_Genome/BAM/SS6004477.srt.aln.bam -L ~/SG_arvind_pgkb/Stargazer_v1.0.6/Stargazer_v1.0.6/pgx_interval_stg.bed > /scratch/NagarajLab_BG/SGDP_rest_bams/SS6004477_pgx.bam &
samtools view -b -h /home/n10135651/Project/4_simons_Genome/BAM/SS6004478.srt.aln.bam -L ~/SG_arvind_pgkb/Stargazer_v1.0.6/Stargazer_v1.0.6/pgx_interval_stg.bed > /scratch/NagarajLab_BG/SGDP_rest_bams/SS6004478_pgx.bam &
samtools view -b -h /home/n10135651/Project/4_simons_Genome/BAM/SS6004479.srt.aln.bam -L ~/SG_arvind_pgkb/Stargazer_v1.0.6/Stargazer_v1.0.6/pgx_interval_stg.bed > /scratch/NagarajLab_BG/SGDP_rest_bams/SS6004479_pgx.bam &
samtools view -b -h /home/n10135651/Project/4_simons_Genome/BAM/SS6004480.srt.aln.bam -L ~/SG_arvind_pgkb/Stargazer_v1.0.6/Stargazer_v1.0.6/pgx_interval_stg.bed > /scratch/NagarajLab_BG/SGDP_rest_bams/SS6004480_pgx.bam
