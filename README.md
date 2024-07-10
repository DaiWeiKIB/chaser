**Chaser**
-------------------------------------------------------------------------------------------------------------
### Chaser is a Conda-based snakemake script available for rapid and low-pollution plant mitochondrial genome assembly.  
### Make sure that conda is deployed on your terminal before using it.  

## Download and deploy the conda environment synchronized with the development environment
The software will be installed include [minimap2](https://github.com/lh3/minimap2)  [samtools](http://www.htslib.org/)  [miniasm](https://github.com/lh3/miniasm/)  [GetOrganell](https://github.com/Kinggerm/GetOrganelle)  [flye](https://github.com/mikolmogorov/Flye)  [bwa-mem2](https://github.com/bwa-mem2/bwa-mem2)  [seqkit](https://github.com/shenwei356/seqkit)  [blast+](https://blast.ncbi.nlm.nih.gov/doc/blast-help/downloadblastdata.html)  [pilon](https://github.com/broadinstitute/pilon)  [racon](https://github.com/isovic/racon)

Use the following command use conda to resolve their dependency

    wget https://cdn.jsdelivr.net/gh/DaiWeiKIB/chaser@main/chaser_env.yml    
    conda env create -f chaser_env.yml  
    conda activate chaser  

### The default script configuration file can be obtained using the following command  

    wget https://cdn.jsdelivr.net/gh/DaiWeiKIB/chaser@main/config.yaml  
    
Fill in the genome information to be assembled according to the comments in **config.yaml**  

    Long_reads_dir:
        /home/daiwei/Oryza_sativa/CRR306311.fasta    #Directory path of single molecule sequencing data file path only with fasta format
    Short_reads_dir1:
        /home/daiwei/Oryza_sativa/CRR306398_f1.fq.gz    #Directory path of Illumina sequencing data
    Short_reads_dir2:
        /home/daiwei/Oryza_sativa/CRR306398_r2.fq.gz
    Number_of_threads: 
        10
    Maximum_memory:
        10G
    Seed_dir:
        /home/daiwei/Oryza_sativa/NC_011033.1.fasta    #Mitochondrial genome data of related species could be selected as seed
    Long_reads_platform:
        ont    #Available options: ont(Oxford Nanopore Sequencing technology) / pb(Pacbio biosciences)
    Long_reads_type:
        --nano-raw    #Available options: --pacbio-raw (PacBio regular CLR reads <20% error) / --pacbio-corr(PacBio reads <3% error) / --pacbio-hifi (PacBio HiFi reads <1% error) / --nanoraw (ONT regular reads <20% error) / --nano-corr (ONT reads <3% error)/ --nano-hq (ONT high-quality reads <5% error)
    Estimated_genome_size:
        0.5m    #Estimated genome size given by the user in this field(According to the reference genome)
## Download the relevant process file to customize the script based on the comments  

    wget https://cdn.jsdelivr.net/gh/DaiWeiKIB/chaser@main/chaser

## Start assembly  

    snakemake -s chaser -c {number of threads}

## Contact
Please communicate me with email address: daiwei20@mails.ucas.ac.cn
