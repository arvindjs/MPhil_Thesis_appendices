#coding=utf-8


base=`basename $1 .bam`


#java -Xmx20g -jar /home/n10135651/Tools/gatk-4.0.2.0/gatk-package-4.0.2.0-local.jar BaseRecalibrator -I $1 -R ~/Database2/GATK/TIWI_ref/hs37d5wphix.fa -O $base"recal.table" --known-sites /home/n10135651/Database2/UCSC_hg19/Annotation/Variation/All_20180423.vcf.gz ####–knownSites gold.standard.indels.vcf	

### add Indel

#java -Xmx24g -jar ~/Programs/GenomeAnalysisTK-3.3-0/GenomeAnalysisTK.jar -R /home/exome_analysis/Reference_hg19/ucsc.hg19.fasta -I sample_Alignment_realigned_fixed.bam -o sample_Alignment_recal.bam -T PrintReads -BQSR temp.table


echo "\n##########baserecalibration2 started:##############################\n"

#java -Xmx20g -jar /home/n10135651/Tools/gatk-4.0.2.0/gatk-package-4.0.2.0-local.jar ApplyBQSR -I $1 -R ~/Database2/GATK/TIWI_ref/hs37d5wphix.fa -O $base"recal.bam" -bqsr $base"recal.table"
#gatk-launch ApplyBQSR -R ref.fasta -I sample.bam -bqsr recal.table -O sample_bqsr.bam

########################################Indelrealignment????????????????????????????????????????????????????????????????###########################3

echo "\nVariant Calling:Haplotypecaller\n"

java -Xmx60g -jar /home/n10135651/Tools/gatk-4.0.2.0/gatk-package-4.0.2.0-local.jar HaplotypeCaller -I $base"recal.bam" -R ~/Database2/GATK/TIWI_ref/hs37d5wphix.fa -O $base"_g.vcf" -ERC GVCF -L interval_list_stdchr.list 
#-ERC GVCF
########variation filteration and annotation

####varaintrecalibrator
echo "\n#################################################Variant filteration:variantrecalibrator#######################\n"

#java -Xmx15g -jar /home/n10135651/Tools/gatk-4.0.2.0/gatk-package-4.0.2.0-local.jar VariantRecalibrator -R /home/n10135651/Database2/GATK/GATK_UCSC_HG19.fasta -V $base"mutect2.vcf" --resource hapmap,known=false,training=true,truth=true,prior=15.0:/home/n10135651/Database2/GATK/hapmap_3.3.hg19.sites.vcf --resource dbsnp,known=true,training=false,truth=false,prior=2.0:/home/n10135651/Database2/GATK/dbsnp_138.hg19.vcf --resource omni,known=false,training=true,truth=false,prior=12.0:/home/n10135651/Database2/GATK/1000G_omni2.5.hg19.sites.vcf --resource 1000G,known=false,training=true,truth=false,prior=10.0:/home/n10135651/Database2/GATK/1000G_phase1.snps.high_confidence.hg19.sites.vcf -an DP -an QD -an MQ -an MQRankSum -an ReadPosRankSum -an FS -an SOR -mode BOTH --tranches-file recalibrate_SNPindels.tranches --rscript-file recalibrate_SNPindels_plots.R -O $base"_snpindels.vcf" -max-gaussians 4



######applyVQSR

echo "\n#################################################ApplyVQSR#######################\n"

#java -Xmx15g -jar /home/n10135651/Tools/gatk-4.0.2.0/gatk-package-4.0.2.0-local.jar ApplyVQSR -R /home/n10135651/Database2/GATK/GATK_UCSC_HG19.fasta --variant $base"mutect2.vcf" --mode BOTH --recal-file $base"_snpindels.vcf" -tranches-file recalibrate_SNPindels.tranches -O $base"_applyVQSR_snpindels.vcf" -ts-filter-level 99.0 ###checkinput


####calculate genotypeposteriors

echo "\n#################################################calculategenotypeposteriors#######################\n"

#java -Xmx15g -jar /home/n10135651/Tools/gatk-4.0.2.0/gatk-package-4.0.2.0-local.jar CalculateGenotypePosteriors -R /home/n10135651/Database2/GATK/GATK_UCSC_HG19.fasta -V $base"_applyVQSR_snpindels.vcf" -O $base"_genotypePosteriors.vcf" -ignore-input-samples true


####variantfilteration

echo "\n#################################################Variant filteration:GQ20#######################\n"

#java -Xmx5g -jar /home/n10135651/Tools/gatk-4.0.2.0/gatk-package-4.0.2.0-local.jar VariantFiltration -R /home/n10135651/Database2/GATK/GATK_UCSC_HG19.fasta -V $base".vcf" -filter "QUAL < 20.0" -O $base"GQ20.vcf"


echo "\n#################################################Variant filteration:DP20#######################\n"

#java -Xmx15g -jar /home/n10135651/Tools/gatk-4.0.2.0/gatk-package-4.0.2.0-local.jar SelectVariants -R /home/n10135651/Database2/GATK/GATK_UCSC_HG19.fasta -V $base"GQ20.vcf" -O $base"_DP20.vcf" -select DP>19


################annovar
###variantannotator??
#print("\n#################################################annovar#######################\n")

#perl ~/Tools/annovar/table_annovar.pl  $base"_DP20.vcf" ~/Tools/annovar/humandb/ --vcfinput -buildver hg19 --out $base"_annovar.vcf" -remove -protocol refGene,cytoBand,exac03,avsnp147,dbnsfp30a -operation gx,r,f,f,f -nastring . -polish

#line1=subprocess.Popen(["head -n 1", R1], stdout=subprocess.PIPE) 

#subprocess.Popen(["awk -F$"\t" 'BEGIN { OFS = "\t" } {if($22=="D" || $26=="D" || $28=="D" || $34=="D"|| $36=="D"|| $42=="D"){print}}'", outputname+"_annovar.vcf",">",outputname+"annovar_atleastone.txt"])

####################hwe













