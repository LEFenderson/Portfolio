#!/bin/bash
#SBATCH --nodes 1
#SBATCH --ntasks 1
#SBATCH --cpus-per-task 24
#SBATCH --job-name Structure
#SBATCH --output=%x.%j.out
#SBATCH --mail-type=ALL
#SBATCH --mail-user=Lindsey.Fenderson@unh.edu

module load linuxbrew/colsa

let MAXK=6
let NoReps=10


  for i in `seq 1 $NoReps`
  do
    echo -e "Replicate = $i"
    for K in $(seq 1 $MAXK);
    do
      echo -e "K = $K"
      echo -e "Output file = 50-100000LocPriorSME_K$K-Rep$i"
      structure -K $K -o /mnt/lustre/mel/leq29/SALSStructure/North/SME/50-100000LocPriorSME_K$K-Rep$i
    done
  done
