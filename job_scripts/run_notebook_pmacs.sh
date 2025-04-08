#!/bin/bash
#BSUB -J jupyter
#BSUB -M 128G
#BSUB -W 168:00  # 7 days
#BSUB -n 8  # 8 cores
#BSUB -o out/jupyter.%J.out
#BSUB -e err/jupyter.%J.out
#BSUB -q bsc_long

source ~/.bash_profile

conda activate procthor_env

cd $HOME/Documents/procthor/procthor

port=2020

jupyter notebook \
    --ip=0.0.0.0 \
    --port=${port} \
    --no-browser \
    --NotebookApp.allow_origin='*' \
    --NotebookApp.port_retries=0
