# Homework 3 ADL NTU

## Dataset
[download link](https://drive.google.com/file/d/186ejZVADY16RBfVjzcMcz9bal9L3inXC/view?usp=sharing)

## Environment
```shell
make
conda activate adl-hw3
pip install -r requirements.txt
pip install -r summarization/requirements.txt
pip install -e tw_rouge
```

## Optional setup
```shell
# use tensorboard for model tracking (plotting the result)
pip install tensorboard
```

## Training
```shell
python summarization/run_summarization.py \
  --model_name_or_path MODEL_NAME_OR_PATH \
  --cache_dir .cache/MODEL_NAME_OR_PATH \
  --text_column "maintext" \
  --summary_column "title" \
  --train_file TRAIN_FILE \
  --validation_file VALIDATION_FILE \
  --max_source_length 1024 \
  --max_target_length 128 \
  --output_dir output/MODEL_NAME_OR_PATH \
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
```

+ model_name_or_path: pretrained model on huggingface (`google/mt5-small` in this homework)
+ train_file: path to the training file
+ validation_file: path to the valid file
+ output_dir: path to the model config, saved in the `output` directory

## Validation
```shell
python summarization/run_summarization.py \
  --model_name_or_path ./output/MODEL_NAME_OR_PATH \
  --cache_dir ./.cache/MODEL_NAME_OR_PATH \
  --text_column "maintext" \
  --summary_column "title" \
  --test_file $1 \
  --output_file $2 \
  --output_dir ./output \
  --num_beams 9 \
  --do_predict \
  --per_device_eval_batch_size 8 \
  --predict_with_generate \
```

+ model_name_or_path: pretrained model on huggingface (`google/mt5-small` in this homework)
+ test_file: path to the input file
+ output_file: path to the output file

To reproduce my best generation result, first run "bash ./download.sh", and run the code above.

For other generation strategy (e.g. greedy, top-p, top-k), see the tutorial as in reference.

## Evaluation
```
usage: eval.py [-h] [-r REFERENCE] [-s SUBMISSION]

optional arguments:
  -h, --help            show this help message and exit
  -r REFERENCE, --reference REFERENCE
  -s SUBMISSION, --submission SUBMISSION
```

Example:
```
python eval.py -r public.jsonl -s submission.jsonl
{
  "rouge-1": {
    "f": 0.21999419163162043,
    "p": 0.2446195813913345,
    "r": 0.2137398792982201
  },
  "rouge-2": {
    "f": 0.0847583291303246,
    "p": 0.09419044877345074,
    "r": 0.08287844474014894
  },
  "rouge-l": {
    "f": 0.21017939117006337,
    "p": 0.25157090570020846,
    "r": 0.19404349000921203
  }
}
```

## Reference
[cccntu/tw_rouge](https://github.com/cccntu/tw_rouge)

[how-to-generate](https://huggingface.co/blog/how-to-generate)