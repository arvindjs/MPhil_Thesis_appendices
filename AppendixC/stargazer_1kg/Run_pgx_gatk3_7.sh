while read line
do
echo $line

gatk	-T DepthOfCoverage \
	-R ~/Database2/GATK/GATK_UCSC_HG19_withoutchr.fasta \
	-I 1kg_cram.list \
	-L ~/SG_arvind_pgkb/Stargazer_v1.0.6/Stargazer_v1.0.6/pgx_interval_stg.list \
	--minMappingQuality 20 \
	--omitIntervalStatistics \
	--omitPerSampleStats \
	--omitLocusTable \
	-U ALLOW_SEQ_DICT_INCOMPATIBILITY \
	-o ~/SG_arvind_pgkb/pgx_gdf/${line:29:-27}gdf

gatk	-T HaplotypeCaller \
	-R ~/Database2/GATK/GATK_UCSC_HG19_withoutchr.fasta \
	-I 1kg_cram.list \
	--dbsnp ~/Database2/GATK/dbsnp_138.hg19wochr.vcf \
	-L ~/SG_arvind_pgkb/Stargazer_v1.0.6/Stargazer_v1.0.6/pgx_interval_stg.list \
	--emitRefConfidence BP_RESOLUTION \
	-U ALLOW_SEQ_DICT_INCOMPATIBILITY \
	-o ~/SG_arvind_pgkb/${line:29:-27}vcf
gatk 	-T GenotypeGVCFs \
	-L ~/SG_arvind_pgkb/Stargazer_v1.0.6/Stargazer_v1.0.6/pgx_interval_stg.list \
	-R ~/Database2/GATK/GATK_UCSC_HG19_withoutchr.fasta \
	--dbsnp ~/Database2/GATK/dbsnp_138.hg19wochr.vcf \
	--variant ~/SG_arvind_pgkb/${line:29:-27}vcf \
	-o ~/SG_arvind_pgkb/${line:29:-27}g.vcf

gatk	-T VariantFiltration \
	-R ~/Database2/GATK/GATK_UCSC_HG19_withoutchr.fasta \
	--filterExpression 'QUAL<=50.0' \
	--filterName QUALFilter \
	--variant ~/SG_arvind_pgkb/${line:29:-27}g.vcf \
	-o ~/SG_arvind_pgkb/pgx_vcf/${line:29:-27}g.filtered.vcf

rm ~/SG_arvind_pgkb/*.vcf*

done < <(ls -1 /scratch/NagarajLab_BG/Cases/*.bam)

while read line
do
echo $line

gatk	-T DepthOfCoverage \
	-R ~/Database2/GATK/GATK_UCSC_HG19_withoutchr.fasta \
	-I $line \
	-L ~/SG_arvind_pgkb/Stargazer_v1.0.6/Stargazer_v1.0.6/pgx_interval_stg.list \
	--minMappingQuality 20 \
	--omitIntervalStatistics \
	--omitPerSampleStats \
	--omitLocusTable \
	-U ALLOW_SEQ_DICT_INCOMPATIBILITY \
	-o ~/SG_arvind_pgkb/pgx_gdf/${line:31:-27}gdf

gatk	-T HaplotypeCaller \
	-R ~/Database2/GATK/GATK_UCSC_HG19_withoutchr.fasta \
	-I $line \
	--dbsnp ~/Database2/GATK/dbsnp_138.hg19wochr.vcf \
	-L ~/SG_arvind_pgkb/Stargazer_v1.0.6/Stargazer_v1.0.6/pgx_interval_stg.list \
	--emitRefConfidence BP_RESOLUTION \
	-U ALLOW_SEQ_DICT_INCOMPATIBILITY \
	-o ~/SG_arvind_pgkb/${line:31:-27}vcf
gatk 	-T GenotypeGVCFs \
	-L ~/SG_arvind_pgkb/Stargazer_v1.0.6/Stargazer_v1.0.6/pgx_interval_stg.list \
	-R ~/Database2/GATK/GATK_UCSC_HG19_withoutchr.fasta \
	--dbsnp ~/Database2/GATK/dbsnp_138.hg19wochr.vcf \
	--variant ~/SG_arvind_pgkb/${line:31:-27}vcf \
	-o ~/SG_arvind_pgkb/${line:31:-27}g.vcf

gatk	-T VariantFiltration \
	-R ~/Database2/GATK/GATK_UCSC_HG19_withoutchr.fasta \
	--filterExpression 'QUAL<=50.0' \
	--filterName QUALFilter \
	--variant ~/SG_arvind_pgkb/${line:31:-27}g.vcf \
	-o ~/SG_arvind_pgkb/pgx_vcf/${line:31:-27}g.filtered.vcf

rm ~/SG_arvind_pgkb/*.vcf*

done < <(ls -1 /scratch/NagarajLab_BG/Control/*.bam)
