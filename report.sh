export CUDA_VISIBLE_DEVICES=0

case $3 in
# Greedy approach
1) python summarization/run_summarization.py \
  --model_name_or_path ./output/google/mt5-small \
  --cache_dir ./.cache/google/mt5-small \
  --text_column "maintext" \
  --summary_column "title" \
  --test_file $1 \
  --output_file $2 \
  --output_dir ./output \
  --num_beams $4 \
  --temperature $5 \
  --top_k $6 \
  --top_p $7 \
  --do_predict \
  --per_device_eval_batch_size 8 \
  --predict_with_generate \
;;
# Beam Search approach
2) python summarization/run_summarization.py \
  --model_name_or_path ./output/google/mt5-small \
  --cache_dir ./.cache/google/mt5-small \
  --text_column "maintext" \
  --summary_column "title" \
  --test_file $1 \
  --output_file $2 \
  --output_dir ./output \
  --early_stopping \
  --num_beams $4 \
  --temperature $5 \
  --top_k $6 \
  --top_p $7 \
  --do_predict \
  --per_device_eval_batch_size 8 \
  --predict_with_generate \
;;
# Sampling approach
3) python summarization/run_summarization.py \
  --model_name_or_path ./output/google/mt5-small \
  --cache_dir ./.cache/google/mt5-small \
  --text_column "maintext" \
  --summary_column "title" \
  --test_file $1 \
  --output_file $2 \
  --output_dir ./output \
  --do_sample \
  --num_beams $4 \
  --temperature $5 \
  --top_k $6 \
  --top_p $7 \
  --do_predict \
  --per_device_eval_batch_size 8 \
  --predict_with_generate \
;;
esac