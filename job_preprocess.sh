#!/usr/bin/env bash
#SBATCH --time=08:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=job_preprocess_dict
#SBATCH --partition=gpu
#SBATCH --mem=8GB
#SBATCH --gres=gpu:1

source new_env/bin/activate
#module load Python/3.8.16-GCCcore-11.2.0
#module load Python/3.10.4-GCCcore-11.3.0
#module load cuDNN/8.4.1.50-CUDA-11.7.0
module load PyTorch/1.12.1-foss-2022a-CUDA-11.7.0

pip3 install -r requirements.txt


python3 preprocess.py config/Dutch_data/preprocess.yaml

