#!/bin/bash  

mkdir ./recreads
seqkit subseq --bed ./NC_011033.1_repeat.bed ./NC_011033.1.fasta -u 200 -o ./recreads/u200.fasta
seqkit subseq --bed ./NC_011033.1_repeat.bed ./NC_011033.1.fasta -d 200 -f -o ./recreads/df200.fasta
seqkit replace -p "(.+\s)" ./recreads/u200.fasta > ./recreads/u200R.fasta
seqkit replace -p "(.+\s)" ./recreads/df200.fasta > ./recreads/df200R.fasta
seqkit rename -n ./recreads/u200R.fasta > ./recreads/u200RR.fasta
seqkit rename -n ./recreads/df200R.fasta > ./recreads/df200RR.fasta
seqkit split -i ./recreads/u200RR.fasta -o ./recreads 
seqkit split -i ./recreads/df200RR.fasta -o ./recreads 
mkdir ./recreads/u200RR.fasta.split/_2
mkdir ./recreads/df200RR.fasta.split/_2

for i in {8..79}  

do  
      seqkit replace -p "(_2)" ./recreads/u200RR.fasta.split/u200RR.id_Repeat"$i"_2.fasta > ./recreads/u200RR.fasta.split/_2/u200RR.id_Repeat"$i"_2.fasta
done  


for i in {8..79}  

do  
      seqkit replace -p "(_2)" ./recreads/df200RR.fasta.split/df200RR.id_Repeat"$i"_2.fasta > ./recreads/df200RR.fasta.split/_2/df200RR.id_Repeat"$i"_2.fasta
done  

mkdir ./recreads/concat

for i in {8..79}  

do  
      seqkit concat ./recreads/u200RR.fasta.split/u200RR.id_Repeat"$i".fasta ./recreads/df200RR.fasta.split/_2/df200RR.id_Repeat"$i"_2.fasta > ./recreads/concat/Repeat"$i".fasta
done  



for i in {8..79}  

do  
      seqkit concat ./recreads/u200RR.fasta.split/_2/u200RR.id_Repeat"$i"_2.fasta ./recreads/df200RR.fasta.split/df200RR.id_Repeat"$i".fasta > ./recreads/concat/Repeat"$i"_2.fasta
done  

mkdir ./recreads/seq

for i in {8..79}  

do  
      blastn -query ./recreads/concat/Repeat$i.fasta -db "/mnt/c/Users/daiwei/Desktop/finaltest/mit/02/02mitassmble.fasta" -evalue 1e-5 -out ./recreads/seq/$i.seq -outfmt '6 sseqid' -qcov_hsp_perc 95 -perc_identity 80
done  



for i in {8..79}  

do  
      blastn -query ./recreads/concat/Repeat"$i"_2.fasta -db "/mnt/c/Users/daiwei/Desktop/finaltest/mit/02/02mitassmble.fasta" -evalue 1e-5 -out ./recreads/seq/"$i"_2.seq -outfmt '6 sseqid' -qcov_hsp_perc 95 -perc_identity 80
done  


mkdir ./recreads/sumseq

for i in {8..79}  

do  
      cat ./recreads/seq/$i.seq ./recreads/seq/"$i"_2.seq > ./recreads/sumseq/$i.sumseq 
done 

mkdir ./recreads/sumseqsort

for i in {8..79}  

do  
      sort -n ./recreads/sumseq/$i.sumseq | uniq > ./recreads/sumseqsort/$i.seqid
done 


for i in {8..79}  

do  
      wc -l ./recreads/sumseqsort/$i.seqid >> ./recreads/reC.cvs
done 

