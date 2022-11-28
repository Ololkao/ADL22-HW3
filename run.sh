export CUDA_VISIBLE_DEVICES=0

python summarization/run_summarization.py \
  --model_name_or_path ./output/google/mt5-small \
  --cache_dir ./.cache/google/mt5-small \
  --text_column "maintext" \
  --summary_column "title" \
  --test_file $1 \
  --output_file $2 \
  --output_dir . \
  --num_beams 5 \
  --do_predict \
  --per_device_eval_batch_size 16 \
  --predict_with_generate \
