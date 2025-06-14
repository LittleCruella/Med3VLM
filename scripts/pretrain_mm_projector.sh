#!/bin/bash

python src/train/train_vlm.py \
    --wb_name "Med3DVLM-Qwen-2.5-7B-pretrain" \
    --vision_tower "dcformer" \
    --model_name_or_path "Qwen/Qwen2.5-7B-Instruct" \
    --model_type "vlm_qwen" \
    --pretrain_vision_model "./output/DCFormer_SigLIP/pretrained_ViT.bin" \
    --mm_projector_type "mixer" \
    --vision_select_layer -2 \
    --tune_mm_mlp_adapter True \
    --data_root "./data" \
    --bf16 True \
    --output_dir "./output/Med3DVLM-Qwen-2.5-7B-pretrain" \
    --num_train_epochs 3 \
    --per_device_train_batch_size 16 \
    --per_device_eval_batch_size 4 \
    --gradient_accumulation_steps 1 \
    --eval_strategy "no" \
    --eval_accumulation_steps 1 \
    --eval_steps 0.04 \
    --save_strategy "steps" \
    --save_steps 2000 \
    --save_total_limit 1 \
    --learning_rate 1e-4 \
    --weight_decay 0.0 \
    --warmup_ratio 0.03 \
    --lr_scheduler_type "cosine" \
    --logging_steps 10 \
    --gradient_checkpointing False \
    --dataloader_pin_memory True \
    --dataloader_num_workers 4

