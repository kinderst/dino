#!/bin/bash
#SBATCH --time=23:59:59
#SBATCH --partition=aa100
#SBATCH --gres=gpu
#SBATCH --ntasks=16
#SBATCH --nodes=1
#SBATCH --output=jobout.%j.out
module purge
module load anaconda
conda activate pytorch_hf
echo "== Starting! =="
sleep 3
python /projects/skinder@xsede.org/dmist_fl/code/dino/main_dino.py --arch resnet50 --use_pretrained_dino False --epochs 40 --warmup_epochs 4 \
    --freeze_last_layer 0 --use_bn_in_head True --norm_last_layer True \
    --data_path /scratch/alpine/skinder@xsede.org/dmist_fl/data/datasets/original/central/train_and_val/ \
    --output_dir /scratch/alpine/skinder@xsede.org/dmist_fl/dino_outputs/resnet50_epoch40_freeze0_bn_norm
echo "== End =="