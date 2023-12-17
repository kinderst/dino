#!/bin/bash
#SBATCH --time=14:59:00
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
python /projects/skinder@xsede.org/dmist_fl/code/dino/main_dino.py --arch vit_base --use_pretrained_dino False --epochs 20 --warmup_epochs 2 \
    --freeze_last_layer 0 --use_bn_in_head True --norm_last_layer False \
    --data_path /projects/skinder@xsede.org/dmist_fl/data/dmist_preprocessed_npys/ \
    --output_dir /scratch/alpine/skinder@xsede.org/dmist_fl/dino_outputs/vit_base_epoch20_freeze0_bn
echo "== End =="