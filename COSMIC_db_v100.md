# COSMIC v100
For Annovar db use

## GRCh38/COSMIC/v100/

```bash
tar xvf Cosmic_GenomeScreensMutant_Vcf_v100_GRCh38.tar
tar xvf Cosmic_GenomeScreensMutant_Tsv_v100_GRCh38.tar
gunzip Cosmic_GenomeScreensMutant_v100_GRCh38.vcf.gz
gunzip Cosmic_GenomeScreensMutant_v100_GRCh38.tsv.gz

tar xvf Cosmic_NonCodingVariants_Tsv_v100_GRCh38.tar
tar xvf Cosmic_NonCodingVariants_Vcf_v100_GRCh38.tar
gunzip Cosmic_NonCodingVariants_v100_GRCh38.vcf.gz
gunzip Cosmic_NonCodingVariants_v100_GRCh38.tsv.gz


echo -e '#Chr\tStart\tEnd\tRef\tAlt\tCOSMIC100' > hg38_cosmic100_raw.txt

prepare_annovar_user.pl -dbtype cosmic Cosmic_GenomeScreensMutant_v100_GRCh38.tsv -vcf Cosmic_GenomeScreensMutant_v100_GRCh38.vcf >> hg38_cosmic100_raw.txt 
prepare_annovar_user.pl -dbtype cosmic Cosmic_NonCodingVariants_v100_GRCh38.tsv -vcf Cosmic_NonCodingVariants_v100_GRCh38.vcf >> hg38_cosmic100_raw.txt 

index_annovar.pl hg38_cosmic100_raw.txt -outfile hg38_cosmic100.txt 

wc -l hg38_cosmic100.txt

29837298 hg38_cosmic100.txt
```
