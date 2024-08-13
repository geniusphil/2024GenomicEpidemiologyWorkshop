# 2024 Genomic Epidemiology Workshop

### NGS Variant Annotation: Hands-on session
---
* Date: 2024.8.13 (Tue.)
* Place: Genomics Research Center, Academia Sinica
* Register website: [2024 Genomic Epidemiology Workshop](https://gesw.genomics.sinica.edu.tw/%E9%A6%96%E9%A0%81)
* Software download
    * URL: [ANNOVAR](http://annovar.openbioinformatics.org/en/latest/)
    * URL: [FAVOR](https://favor.genohub.org/)

* Raw data
    * gatk.vcf (reference hg38)
    * demo_sample.vcf.gz (Ogden Syndrome, reference hg19)
    

* Result
    * HG00403.chr20.gatk.hg38_multianno.txt
    * HG00403.chr20.gatk.hg38_multianno.xlsx

---

### .bashrc setting

```bash

# ANNOVAR
export PATH=$PATH:/$HOME/2024GenomicEpidemiologyWorkshop/annovar/

```

### Download Annovar human db

```bash
$ ./annovar_db_download.sh
```

### VCF to Annovar input format

```bash
$ convert2annovar.pl -format vcf4 gatk.vcf > HG00403.chr20.gatk.avinput
```

```bash
NOTICE: Finished reading 3481 lines from VCF file
NOTICE: A total of 3443 locus in VCF file passed QC threshold, representing 3105 SNPs (2069 transitions and 1036 transversions) and 338 indels/substitutions
NOTICE: Finished writing 3105 SNP genotypes (2069 transitions and 1036 transversions) and 338 indels/substitutions for 1 sample
```

### Run Annovar table function

* script

```bash
$ perl annovar.pl -t 10 -i HG00403.chr20.gatk.avinput -r hg38 -o HG00403.chr20.gatk
```

* tab output

```bash
$ table_annovar.pl HG00403.chr20.gatk.avinput $HOME/humandb/ -buildver hg38 -out HG00403.chr20.gatk -remove -protocol refGene,ensGene,cytoBand,genomicSuperDups,gwasCatalog,avsnp150,esp6500siv2_all,1000g2015aug_all,1000g2015aug_afr,1000g2015aug_amr,1000g2015aug_eur,1000g2015aug_eas,1000g2015aug_sas,nci60,cosmic100,clinvar_20240611,gnomad41_genome,gnomad41_exome,exac03,intervar_20180118,dbnsfp31a_interpro -operation g,g,r,r,r,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f -otherinfo -nastring NA
```

* csv output

```bash
$ table_annovar.pl HG00403.chr20.gatk.avinput $HOME/humandb/ -buildver hg38 -out HG00403.chr20.gatk -remove -protocol refGene,ensGene,cytoBand,genomicSuperDups,gwasCatalog,avsnp150,esp6500siv2_all,1000g2015aug_all,1000g2015aug_afr,1000g2015aug_amr,1000g2015aug_eur,1000g2015aug_eas,1000g2015aug_sas,nci60,cosmic100,clinvar_20240611,gnomad41_genome,gnomad41_exome,exac03,intervar_20180118,dbnsfp31a_interpro, -operation g,g,r,r,r,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f -otherinfo -nastring . -csvout
```

### Easy Run Annovar talbe function

```bash
$ perl annovar.pl -t 10 -i demo_sample.avinput -r hg19 -o demo_sample
```

* **Gene-based (g)**
    * refGene
    * ensGene

* **Region-based (r)**
    * cytoBand
    * genomicSuperDups
    * gwasCatalog

* **Filter-based (f)**
    * avsnp151
    * esp6500siv2_all
    * 1000g2015aug_all
    * 1000g2015aug_afr
    * 1000g2015aug_amr
    * 1000g2015aug_eur
    * 1000g2015aug_eas
    * 1000g2015aug_sas
    * gnomad41_genome
    * gnomad41_exome
    * nci60
    * cosmic100
    * clinvar_20240611
    * exac03
    * intervar_20180118
    * dbnsfp47a_interpro

---

* Reference and data by:
    * [ANNOVAR](http://annovar.openbioinformatics.org/en/latest/)
    * [Using VAAST to Identify an X-Linked Disorder Resulting in Lethality in Male Infants Due to N-Terminal Acetyltransferase Deficiency](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC3135802/)
    * [ANNOVAR: functional annotation of genetic variants from high-throughput sequencing data](http://www.ncbi.nlm.nih.gov/pubmed/20601685)
    * [Genomic variant annotation and prioritization with ANNOVAR and wANNOVAR](http://www.nature.com/nprot/journal/v10/n10/full/nprot.2015.105.html)
    * [NAA10 / rs387906701](http://www.ncbi.nlm.nih.gov/projects/SNP/snp_ref.cgi?rs=rs387906701)
    * [SNPedia](http://snpedia.com/index.php/Rs387906701)
    * [NAA10 mutation causing a novel intellectual disability syndrome with Long QT due to N-terminal acetyltransferase impairment](http://www.nature.com/articles/srep16022)
    * [OMIM - Ogden Syndrome](http://www.omim.org/entry/300855)


* All Information 2024 Genomic Epidemiology Workshop Use
* Edit by [Philippe](http://github.com/geniusphil)
