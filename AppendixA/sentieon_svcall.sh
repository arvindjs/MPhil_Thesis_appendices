#!/bin/bash -l
#PBS -N svarcall
#PBS -l select=1:ncpus=16:mem=64gb:ht=true
#PBS -l walltime=96:00:00
cd $PBS_O_WORKDIR
module purge
module load python/2.7.15-foss-2018a
export SENTIEON_LICENSE=/home/n10357050/Tools/Queensland_University_Of_Technology_eval.lic
export SENTIEON_INSTALL_DIR=/home/n10357050/Tools/sentieon-genomics-201808.08

while read line
do
/home/n10357050/Tools/sentieon-genomics-201808.08/bin/sentieon driver -t 32 -r /scratch/NagarajLab_BG/indigen_proj/TIWI_ref/hs37d5wphix.fa --interval /home/n10357050/intervals_b37_wgs_consolidated_calling_intervals.list -i $line --algo DNAscope --var_type bnd /scratch/NagarajLab_BG/SV_calls_tiwi120/${line:53:-33}"_tmp.vcf"

/home/n10357050/Tools/sentieon-genomics-201808.08/bin/sentieon driver -t 32 -r /scratch/NagarajLab_BG/indigen_proj/TIWI_ref/hs37d5wphix.fa --interval /home/n10357050/intervals_b37_wgs_consolidated_calling_intervals.list --algo SVSolver -v /scratch/NagarajLab_BG/SV_calls_tiwi120/${line:53:-33}"_tmp.vcf" /scratch/NagarajLab_BG/SV_calls_tiwi120/${line:53:-33}"_SV.vcf"
done < <(ls -1 /scratch/NagarajLab_BG/indigen_proj/8_jointgenotypge/*.bam)
