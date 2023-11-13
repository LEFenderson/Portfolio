#!/bin/bash

#***************************************************************************************************************************
#* Script for downsampling multiple bamfiles with seqtk                                     *
#*                                                                                                                         *
#* Lindsey Fenderson                                                                                                       *
#* November 22, 2018                                                                                                       *
#***************************************************************************************************************************
module load seqtk
ls A*.fastq > Filenames
while read Filenames;  do
  for i in 10 50 100 500 1000 5000 10000 25000 50000 75000 100000 250000 500000 750000 1000000 
  do
	echo Downsampling $Filenames to $i reads
    seqtk sample -s1000 $Filenames $i > A17345_$i_R1.fastq
    seqtk sample -s1000 $Filenames $i > A17345_$i_R2.fastq
    seqtk sample -s10000 $Filenames $i > A17345_$iA_R1.fastq
    seqtk sample -s10000 $Filenames $i > A17345_$iA_R2.fastq
    seqtk sample -s5000 $Filenames $i > A17345_$iB_R1.fastq
    seqtk sample -s5000 $Filenames $i > A17345_$iB_R2.fastq
    seqtk sample -s100 $Filenames $i > A17345_$iC_R1.fastq
    seqtk sample -s100 $Filenames $i > A17345_$iC_R2.fastq
    seqtk sample -s200 $Filenames $i > A17345_$iD_R1.fastq
    seqtk sample -s200 $Filenames $i > A17345_$iD_R2.fastq
    seqtk sample -s300 $Filenames $i > A17345_$iE_R1.fastq
    seqtk sample -s300 $Filenames $i > A17345_$iE_R2.fastq
    seqtk sample -s400 $Filenames $i > A17345_$iF_R1.fastq
    seqtk sample -s400 $Filenames $i > A17345_$iF_R2.fastq
    seqtk sample -s500 $Filenames $i > A17345_$iG_R1.fastq
    seqtk sample -s500 $Filenames $i > A17345_$iG_R2.fastq
    seqtk sample -s600 $Filenames $i > A17345_$iH_R1.fastq
    seqtk sample -s600 $Filenames $i > A17345_$iH_R2.fastq
    seqtk sample -s700 $Filenames $i > A17345_$iI_R1.fastq
    seqtk sample -s700 $Filenames $i > A17345_$iI_R2.fastq
    seqtk sample -s800 $Filenames $i > A17345_$iJ_R1.fastq
    seqtk sample -s800 $Filenames $i > A17345_$iJ_R2.fastq
    seqtk sample -s900 $Filenames $i > A17345_$iK_R1.fastq
    seqtk sample -s900 $Filenames $i > A17345_$iK_R2.fastq
    seqtk sample -s50 $Filenames $i > A17345_$iL_R1.fastq
    seqtk sample -s50 $Filenames $i > A17345_$iL_R2.fastq
    seqtk sample -s20000 $Filenames $i > A17345_$iM_R1.fastq
    seqtk sample -s20000 $Filenames $i > A17345_$iM_R2.fastq
    seqtk sample -s2000 $Filenames $i > A17345_$iN_R1.fastq
    seqtk sample -s2000 $Filenames $i > A17345_$iN_R2.fastq
    seqtk sample -s3000 $Filenames $i > A17345_$iO_R1.fastq
    seqtk sample -s3000 $Filenames $i > A17345_$iO_R2.fastq
    seqtk sample -s4000 $Filenames $i > A17345_$iP_R1.fastq
    seqtk sample -s4000 $Filenames $i > A17345_$iP_R2.fastq
    seqtk sample -s30000 $Filenames $i > A17345_$iQ_R1.fastq
    seqtk sample -s30000 $Filenames $i > A17345_$iQ_R2.fastq
    seqtk sample -s6000 $Filenames $i > A17345_$iR_R1.fastq
    seqtk sample -s6000 $Filenames $i > A17345_$iR_R2.fastq
    seqtk sample -s7000 $Filenames $i > A17345_$iS_R1.fastq
    seqtk sample -s7000 $Filenames $i > A17345_$iS_R2.fastq
    seqtk sample -s8000 $Filenames $i > A17345_$iT_R1.fastq
    seqtk sample -s8000 $Filenames $i > A17345_$iT_R2.fastq
    seqtk sample -s9000 $Filenames $i > A17345_$iU_R1.fastq
    seqtk sample -s9000 $Filenames $i > A17345_$iU_R2.fastq
    seqtk sample -s40000 $Filenames $i > A17345_$iV_R1.fastq
    seqtk sample -s40000 $Filenames $i > A17345_$iV_R2.fastq
    seqtk sample -s50000 $Filenames $i > A17345_$iW_R1.fastq
    seqtk sample -s50000 $Filenames $i > A17345_$iW_R2.fastq
    seqtk sample -s60000 $Filenames $i > A17345_$iX_R1.fastq
    seqtk sample -s60000 $Filenames $i > A17345_$iX_R2.fastq
    seqtk sample -s70000 $Filenames $i > A17345_$iY_R1.fastq
    seqtk sample -s70000 $Filenames $i > A17345_$iY_R2.fastq
    seqtk sample -s80000 $Filenames $i > A17345_$iZ_R1.fastq
    seqtk sample -s80000 $Filenames $i > A17345_$iZ_R2.fastq
    seqtk sample -s90000 $Filenames $i > A17345_$iAA_R1.fastq
    seqtk sample -s90000 $Filenames $i > A17345_$iAA_R2.fastq
    seqtk sample -s10 $Filenames $i > A17345_$iBB_R1.fastq
    seqtk sample -s10 $Filenames $i > A17345_$iBB_R2.fastq
    seqtk sample -s20 $Filenames $i > A17345_$iCC_R1.fastq
    seqtk sample -s20 $Filenames $i > A17345_$iCC_R2.fastq
  done
done <Filenames

gzip A*.fastq
./000_Run_bam_pipeline_bison.sh

#Copy of all data saved at acad2:/data/acad/BisonProjects/SubsampledData