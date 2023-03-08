#!/bin/bash  

mkdir ./refreads
seqkit subseq --bed ./NC_011033.1_repeat.bed ./NC_011033.1.fasta -u 200 -d 200 -o ./refreads/200.fasta
seqkit replace -p "(.+\s)" ./refreads/200.fasta > ./refreads/200R.fasta
seqkit rename -n ./refreads/200R.fasta > ./refreads/200RR.fasta
seqkit split -i ./refreads/200RR.fasta -o ./refreads 

mkdir ./refreads/seq

for i in {1..7}  

do  
      blastn -query ./refreads/200RR.fasta.split/200RR.id_Repeat"$i"_2.fasta -db "/mnt/c/Users/daiwei/Desktop/finaltest/mit/02/02mitassmble.fasta" -evalue 1e-5 -out ./refreads/seq/"$i"_2.seq -outfmt '6 sseqid' -qcov_hsp_perc 95 -perc_identity 80
done  


for i in {1..7}  

do  
      blastn -query ./refreads/200RR.fasta.split/200RR.id_Repeat"$i".fasta -db "/mnt/c/Users/daiwei/Desktop/finaltest/mit/02/02mitassmble.fasta" -evalue 1e-5 -out ./refreads/seq/$i.seq -outfmt '6 sseqid' -qcov_hsp_perc 95 -perc_identity 80
done  


mkdir ./refreads/sumseq

for i in {1..7}  

do  
      cat ./refreads/seq/$i.seq ./refreads/seq/"$i"_2.seq > ./refreads/sumseq/$i.sumseq 
done 

mkdir ./refreads/sumseqsort

for i in {1..7}  

do  
      sort -n ./refreads/sumseq/$i.sumseq | uniq > ./refreads/sumseqsort/$i.seqid
done 


for i in {1..7}  

do  
      wc -l ./refreads/sumseqsort/$i.seqid >> ./refreads/ref.cvs
done 

