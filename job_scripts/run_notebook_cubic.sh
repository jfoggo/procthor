#!/bin/bash
# vim: ft=slurm

#SBATCH --job-name=jupyter
#SBATCH --nodes=1
#SBATCH --gpus-per-node=p100:1
#SBATCH --cpus-per-gpu=10
#SBATCH --mem=128G
#SBATCH --time=48:00:00
#SBATCH --output=out/%j.out # Output file name
#SBATCH --error=err/%j.err # Error file name

source ~/.bashrc

conda activate procthor_env

cd /cbica/home/kongna/projects/procthor/procthor

port=2020

jupyter notebook \
    --ip=0.0.0.0 \
    --port=${port} \
    --no-browser \
    --NotebookApp.allow_origin='*' \
    --NotebookApp.port_retries=0
