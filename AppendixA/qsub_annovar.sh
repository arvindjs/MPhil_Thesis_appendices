#!/bin/bash -l
#PBS -N annovar
#PBS -l select=1:ncpus=2:mem=72gb
#PBS -l walltime=12:00:00
cd $PBS_O_WORKDIR

module purge
module load perl/5.26.0-foss-2017a
###perl /home/n10135651/Tools/annovar/table_annovar.pl /scratch/NagarajLab_BG/indigen_proj/8_jointgenotypge/sentieon_combined_vcf/Tiwi_187_hardeep38_SN32/Tiwi_cohort_187.vcf /home/n10135651/Tools/annovar/humandb/ --vcfinput -buildver hg19 --out /scratch/NagarajLab_BG/indigen_proj/8_jointgenotypge/sentieon_combined_vcf/Tiwi_187_hardeep38_SN32/Tiwi_cohort_187_annovar.vcf -remove -protocol refGene,cytoBand,avsnp147,clinvar_20131105,gnomad_genome,gnomad_exome,dbnsfp30a -operation g,r,f,f,f,f,f -nastring . -polish

###perl /home/n10135651/Tools/annovar/table_annovar.pl /scratch/NagarajLab_BG/indigen_proj/8_jointgenotypge/sentieon_combined_vcf/tiwi_120_cohort_vqsr_filtered.vcf /home/n10135651/Tools/annovar/humandb/ --vcfinput -buildver hg19 --out /scratch/NagarajLab_BG/indigen_proj/8_jointgenotypge/sentieon_combined_vcf/tiwi_120_cohort_vqsr_filtered_annovar.vcf -remove -protocol refGene,cytoBand,exac03,avsnp147,dbnsfp30a -operation gx,r,f,f,f -nastring . -polish

perl ~/Tools/annovar/table_annovar.pl /scratch/NagarajLab_BG/indigen_proj/8_jointgenotypge/sentieon_combined_vcf/Tiwi_187_hardeep38_SN32/Tiwi_cohort_187.vcf /home/n10135651/Tools/annovar/humandb/ --vcfinput -buildver hg19 --out /scratch/NagarajLab_BG/indigen_proj/8_jointgenotypge/sentieon_combined_vcf/Tiwi_187_hardeep38_SN32/Tiwi_cohort_187_annovar_1kg -remove -protocol refGene,cytoBand,avsnp147,exac03,1000g2015aug_all,1000g2015aug_afr,1000g2015aug_amr,1000g2015aug_eas,1000g2015aug_eur,1000g2015aug_sas,dbnsfp30a,gnomad_genome,gnomad_exome -operation gx,r,f,f,f,f,f,f,f,f,f,f,f -nastring . -polish

