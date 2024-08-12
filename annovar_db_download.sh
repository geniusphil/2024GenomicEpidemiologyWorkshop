# Date: 202408
# Annovar database download
# Reference genome version: GRCh37/hg19 | GRCh38/hg38
# URL: http://annovar.openbioinformatics.org/en/latest/user-guide/download/
# Hang-on database path: /home/workshop/ngs_tools/annovar/humandb/
#---------------------------

# Creat humandb folder
if [ -d ~/humandb ]; then
        echo 'humandb folder exist!!'
else mkdir -p ~/humandb;
        echo 'Create humandb folder done!'
fi

export DB_PATH=$HOME/humandb/

##### Function err_msg #####
function err_msg() {
  echo "[$(date +'%Y-%m-%dT%H:%M:%S%z')]: $*" >&2
}

##### Gene-based #######
function gene_based() {
    # NCBI RefSeq v.20211019
    annotate_variation.pl -buildver hg19 -downdb -webfrom annovar refGene $DB_PATH
    annotate_variation.pl -buildver hg38 -downdb -webfrom annovar refGene $DB_PATH
    annotate_variation.pl -buildver hg19 -downdb -webfrom annovar refGeneWithVer $DB_PATH
    annotate_variation.pl -buildver hg38 -downdb -webfrom annovar refGeneWithVer $DB_PATH

    # RefSeq Gene in CHM13-T2T reference genome
    annotate_variation.pl -buildver hs1 -downdb -webfrom annovar refGene $DB_PATH

    # UCSC KnownGene v.20211019
    annotate_variation.pl -buildver hg19 -downdb -webfrom annovar knownGene $DB_PATH
    annotate_variation.pl -buildver hg38 -downdb -webfrom annovar knownGene $DB_PATH

    # Ensembl Gene v.20230315
    annotate_variation.pl -buildver hg19 -downdb -webfrom annovar ensGene $DB_PATH
    annotate_variation.pl -buildver hg38 -downdb -webfrom annovar ensGene $DB_PATH

    # Ensembl Gene v.20221005
    annotate_variation.pl -buildver hg19 -downdb -webfrom annovar ensGene41 $DB_PATH
    annotate_variation.pl -buildver hg38 -downdb -webfrom annovar ensGene41 $DB_PATH
}

##### Region-based #####
function region_based() {
    # UCSC cytoBand
    annotate_variation.pl -buildver hg19 -downdb cytoBand $DB_PATH
    # UCSC cytoBand hg38
    cd $DB_PATH && wget -c http://hgdownload.cse.ucsc.edu/goldenpath/hg38/database/cytoBand.txt.gz && gunzip -d cytoBand.txt.gz && mv cytoBand.txt hg38_cytoBand.txt
    
    # UCSC genomicSuperDups
    annotate_variation.pl -buildver hg19 -downdb genomicSuperDups $DB_PATH
    # UCSC genomicSuperDups hg38
    cd $DB_PATH && wget -c http://hgdownload.cse.ucsc.edu/goldenpath/hg38/database/genomicSuperDups.txt.gz && gunzip -d genomicSuperDups.txt.gz && mv genomicSuperDups.txt hg38_genomicSuperDups.txt
    
    # UCSC phastConsElements100way
    annotate_variation.pl -buildver hg19 -downdb phastConsElements100way $DB_PATH
    cd $DB_PATH && wget -c http://hgdownload.cse.ucsc.edu/goldenpath/hg38/database/phastConsElements100way.txt.gz && gunzip -d phastConsElements100way.txt.gz && mv phastConsElements100way.txt hg38_phastConsElements100way.txt
}

##### Filter-based #####
function filter_based() {
    # 1000 Genome v.20150824
    annotate_variation.pl -buildver hg19 -downdb -webfrom annovar 1000g2015aug $DB_PATH
    annotate_variation.pl -buildver hg38 -downdb -webfrom annovar 1000g2015aug $DB_PATH
    
    # NCBI dbSNP151 v.20240525
    annotate_variation.pl -buildver hg19 -downdb -webfrom annovar avsnp151 $DB_PATH
    annotate_variation.pl -buildver hg38 -downdb -webfrom annovar avsnp151 $DB_PATH
    
    # NCI60 v.20150428
    annotate_variation.pl -buildver hg19 -downdb -webfrom annovar nci60 $DB_PATH
    annotate_variation.pl -buildver hg38 -downdb -webfrom annovar nci60 $DB_PATH
    
    # NCBI ClinVar v.20240616
    annotate_variation.pl -buildver hg19 -downdb -webfrom annovar clinvar_20240611 $DB_PATH
    annotate_variation.pl -buildver hg38 -downdb -webfrom annovar clinvar_20240611 $DB_PATH
    
    # gnomAD genome collection. gnomad41_genome 20240602 | gnomad211_genome 20190323
    annotate_variation.pl -buildver hg19 -downdb -webfrom annovar gnomad211_genome $DB_PATH
    annotate_variation.pl -buildver hg38 -downdb -webfrom annovar gnomad41_genome $DB_PATH
    
    annotate_variation.pl -buildver hs1 -downdb -webfrom annovar gnomad_genome $DB_PATH
    
    # gnomAD exome collection gnomad41_genome 20240602 | gnomad211_genome 20190323
    annotate_variation.pl -buildver hg19 -downdb -webfrom annovar gnomad211_exome $DB_PATH
    annotate_variation.pl -buildver hg38 -downdb -webfrom annovar gnomad41_exome $DB_PATH
    
    # ExAC 65000 exome allele frequency data for ALL, AFR (African), AMR (Admixed American), EAS (East Asian), FIN (Finnish), NFE (Non-finnish European), 
    # OTH (other), SAS (South Asian)). version 0.3. Left normalization done.
    annotate_variation.pl -buildver hg19 -downdb -webfrom annovar exac03 $DB_PATH
    annotate_variation.pl -buildver hg38 -downdb -webfrom annovar exac03 $DB_PATH
    
    # ESP6500 v.20141222
    annotate_variation.pl -buildver hg19 -downdb -webfrom annovar esp6500siv2_all $DB_PATH
    annotate_variation.pl -buildver hg38 -downdb -webfrom annovar esp6500siv2_all $DB_PATH
    
    # InterVar: clinical interpretation of missense variants (indels not supported) 20180325
    annotate_variation.pl -buildver hg19 -downdb -webfrom annovar intervar_20180118 $DB_PATH
    annotate_variation.pl -buildver hg38 -downdb -webfrom annovar intervar_20180118 $DB_PATH
    
    # whole-exome SIFT, PolyPhen2 HDIV, PolyPhen2 HVAR, LRT, MutationTaster, MutationAssessor, FATHMM, MetaSVM, MetaLR, VEST, CADD, GERP++, DANN, fitCons, 
    # PhyloP and SiPhy scores from dbNSFP (protein domain for variants)
    # 20240617
    annotate_variation.pl -buildver hg19 -downdb -webfrom annovar dbnsfp47a_interpro $DB_PATH
    annotate_variation.pl -buildver hg38 -downdb -webfrom annovar dbnsfp47a_interpro $DB_PATH
    
    # gwasCatalog
    annotate_variation.pl -buildver hg19 -downdb gwasCatalog $DB_PATH
    annotate_variation.pl -buildver hg38 -downdb gwasCatalog $DB_PATH
    
    # LoF tools
    wget -c http://www.openbioinformatics.org/annovar/download/LoFtool_scores.txt.gz -P $DB_PATH
    gzip -d $DB_PATH/LoFtool_scores.txt.gz
}

##### Main #####
gene_based
region_based
filter_based