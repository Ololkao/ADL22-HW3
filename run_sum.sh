export CUDA_VISIBLE_DEVICES=0

python summarization/run_summarization.py \
  --model_name_or_path google/mt5-small \
  --cache_dir .cache/google/mt5-small \
  --text_column "maintext" \
  --summary_column "title" \
  --train_file dataset/train.jsonl \
  --validation_file dataset/eval.jsonl \
  --max_source_length 1024 \
  --max_target_length 128 \
  --output_dir output/google/mt5-small \
  --overwrite_output_dir False \
  --do_train \
  --do_eval \
  --evaluation_strategy steps \
  --per_device_train_batch_size 8 \
  --per_device_eval_batch_size 8 \
  --gradient_accumulation_steps 1 \
  --eval_accumulation_steps 1 \
  --eval_delay 1000 \
  --learning_rate 3e-4 \
  --weight_decay 1e-5 \
  --num_train_epochs 20 \
  --lr_scheduler_type cosine \
  --warmup_ratio 0.05 \
  --save_strategy steps \
  --save_steps 1500 \
  --eval_steps 750 \
  --optim adamw_hf \
  --report_to all \
  --predict_with_generate \
