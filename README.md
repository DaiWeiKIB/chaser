#Chaser is a Conda-based snakemake script available for rapid and low-pollution plant mitochondrial genome assembly.  
#Make sure that conda is deployed on your terminal before using it.  

## Download and deploy the conda environment synchronized with the author and start  
    
    wget https://cdn.jsdelivr.net/gh/DaiWeiKIB/chaser@main/chaser_env.yml    #For mainland Chinese users utilize jsdelivr as a static resource server, as a stable and fast mirror source to access download  
    conda env create -f chaser_env.yml  
    conda activate chaser  

## The default script configuration file can be obtained using the following command  

    wget https://cdn.jsdelivr.net/gh/DaiWeiKIB/chaser@main/config.yaml  
    
#Fill in the genome information to be assembled according to the comments in config.yaml  

## Download the relevant process file to customize the script based on the comments  

    wget https://cdn.jsdelivr.net/gh/DaiWeiKIB/chaser@main/chaser

## Start assembly  

    snakemake -s chaser -c {number of threads}


