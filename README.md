Chaser
-------------------------------------------------------------------------------------------------------------
#### Chaser is a Conda-based snakemake script available for rapid and low-pollution plant mitochondrial genome assembly.  
#### Make sure that conda is deployed on your terminal before using it.  

## Download and deploy the conda environment synchronized with the author and start  
    
    wget https://cdn.jsdelivr.net/gh/DaiWeiKIB/chaser@main/chaser_env.yml    
    conda env create -f chaser_env.yml  
    conda activate chaser  

## The default script configuration file can be obtained using the following command  

    wget https://cdn.jsdelivr.net/gh/DaiWeiKIB/chaser@main/config.yaml  
    
Fill in the genome information to be assembled according to the comments in **config.yaml**  

    Long_Reads_dir:
        /home/daiwei/Oryza_sativa/CRR306311.fasta
    Short_reads_dir1:
        /home/daiwei/Oryza_sativa/CRR306398_f1.fq.gz
    Short_reads_dir2:
        /home/daiwei/Oryza_sativa/CRR306398_r2.fq.gz
    Number_of_threads: 
        10
    Maximum_memory:
        10G
    Seed_dir:
        /home/daiwei/Oryza_sativa/NC_011033.1.fasta
    Long_reads_platform:
        ont
    Long_reads_type:
        --nano-raw
    Estimated_genome_size:
        0.5m 
## Download the relevant process file to customize the script based on the comments  

    wget https://cdn.jsdelivr.net/gh/DaiWeiKIB/chaser@main/chaser

## Start assembly  

    snakemake -s chaser -c {number of threads}


