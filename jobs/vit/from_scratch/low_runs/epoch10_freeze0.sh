#!/bin/bash
#SBATCH --time=7:59:00
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
python /projects/skinder@xsede.org/dmist_fl/code/dino/main_dino.py --arch vit_base --use_pretrained_dino False --epochs 10 --warmup_epochs 1 \
    --freeze_last_layer 0 --use_bn_in_head False --norm_last_layer False \
    --data_path /scratch/alpine/skinder@xsede.org/dmist_fl/data/datasets/original/central/train_and_val/ \
    --output_dir /scratch/alpine/skinder@xsede.org/dmist_fl/dino_outputs/vit_base_epoch10_freeze0
echo "== End =="