#!/bin/bash
#SBATCH --time=00:45:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=job_sarcastic
#SBATCH --partition=gpu
#SBATCH --mem=8GB
#SBATCH --gpus-per-node=a100.20gb:1

module load Python/3.10.4-GCCcore-11.3.0
module load cuDNN/8.4.1.50-CUDA-11.7.0
source env/bin/activate

# Declarative
python3 synthesize.py --text "Ze is een gezonde vrouw" --restore_step 200000 --mode single -p config/Dutch_data/preprocess.yaml -m config/Dutch_data/model.yaml -t config/Dutch_data/train.yaml --duration_control 1.15 --energy_control 0.87

# Tag-question
python3 synthesize.py --text "Ze bijten goed dit seizoen, he" --restore_step 200000 --mode single -p config/Dutch_data/preprocess.yaml -m config/Dutch_data/model.yaml -t config/Dutch_data/train.yaml --duration_control 1.06 --energy_control 0.91

# Wh-exclamative
python3 synthesize.py --text "Wat een fantastisch resultaat!" --restore_step 200000 --mode single -p config/Dutch_data/preprocess.yaml -m config/Dutch_data/model.yaml -t config/Dutch_data/train.yaml --duration_control 1.16 --energy_control 0.76
