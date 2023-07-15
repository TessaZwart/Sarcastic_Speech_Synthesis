#!/usr/bin/env bash
#SBATCH --time=24:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=jobtry24
#SBATCH --partition=gpu
#SBATCH --mem=8GB
#SBATCH --gpus-per-node=a100.20gb:1


module load Python/3.10.4-GCCcore-11.3.0
module load cuDNN/8.4.1.50-CUDA-11.7.0
source env/bin/activate



###############################################################################
python3 train.py -p  config/Dutch_data/preprocess.yaml -m config/Dutch_data/model.yaml -t config/Dutch_data/train.yaml

