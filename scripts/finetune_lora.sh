#!/bin/bash

python src/train/train_vlm.py \
    --wb_name Med3DVLM-Qwen-2.5-7B-finetune \
    --vision_tower "dcformer" \
    --model_name_or_path Qwen/Qwen2.5-7B-Instruct \
    --model_type vlm_qwen \
    --mm_projector_type "mixer" \
    --lora_enable True \
    --vision_select_layer -2 \
    --pretrain_vision_model ./output/DCFormer_SigLIP/pretrained_ViT.bin \
    --pretrain_mm_mlp_adapter ./output/Med3DVLM-Qwen-2.5-7B-pretrain/mm_projector.bin \
    --data_root ./data \
    --bf16 True \
    --output_dir ./output/Med3DVLM-Qwen-2.5-7B-finetune \
    --num_train_epochs 5 \
    --per_device_train_batch_size 8 \
    --per_device_eval_batch_size 4 \
    --gradient_accumulation_steps 1 \
    --eval_strategy "no" \
    --eval_accumulation_steps 1 \
    --eval_steps 0.04 \
    --save_strategy "steps" \
    --save_steps 1000 \
    --save_total_limit 1 \
    --learning_rate 5e-5 \
    --weight_decay 0. \
    --warmup_ratio 0.03 \
    --lr_scheduler_type "cosine" \
    --logging_steps 0.001 \
    --gradient_checkpointing False \
    --dataloader_pin_memory True \
    --dataloader_num_workers 4