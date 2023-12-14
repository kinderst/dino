...

# ViT
```bash
python main_dino.py --cuda_num 0 --arch vit_small --clip_grad=1.0 --saveckp_freq=1 --epochs 10 --warmup_epochs 2 --data_path /sddata/data/dmist/dmist_preprocessed_npys --output_dir /sddata/projects/dmist_scott/dinov1/vit_bravo_output
```

## as similar to orig
```bash
python main_dino.py --cuda_num 0 --arch vit_small --num_workers 16 --data_path /sddata/data/dmist/dmist_preprocessed_npys --output_dir /sddata/projects/dmist_scott/dinov1/vit_charlie_output
```


# ResNet50
```bash
python main_dino.py --cuda_num 1 --arch resnet50 --optimizer sgd --lr 0.03 --clip_grad=0.3 --saveckp_freq=1 --epochs 10 --warmup_epochs 2 --weight_decay 1e-4 --weight_decay_end 1e-4 --global_crops_scale 0.14 1 --local_crops_scale 0.05 0.14 --num_workers 32 --data_path /sddata/data/dmist/dmist_preprocessed_npys --output_dir /sddata/projects/dmist_scott/dinov1/resent_charlie_output
```

## as similar to orig
```bash
python main_dino.py --cuda_num 1 --arch resnet50 --optimizer sgd --lr 0.03 --weight_decay 1e-4 --weight_decay_end 1e-4 --global_crops_scale 0.14 1 --local_crops_scale 0.05 0.14 --num_workers 32 --data_path /sddata/data/dmist/dmist_preprocessed_npys --output_dir /sddata/projects/dmist_scott/dinov1/resent_charlie_output
```
q