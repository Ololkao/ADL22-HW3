test="public.jsonl"

bash report.sh $test output1.jsonl False False 1 1 0 0.
bash report.sh $test output2.jsonl False True 5 1 0 0.
bash report.sh $test output3.jsonl False True 9 1 0 0.
bash report.sh $test output4.jsonl True False 1 1 30 0.
bash report.sh $test output5.jsonl True False 1 1 50 0.
bash report.sh $test output6.jsonl True False 1 1 0 0.7
bash report.sh $test output7.jsonl True False 1 1 0 0.9
bash report.sh $test output8.jsonl True False 1 0.68 0 0.
bash report.sh $test output9.jsonl True False 1 0.95 0 0.