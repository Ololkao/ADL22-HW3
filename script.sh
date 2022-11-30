test="dataset/public.jsonl"

bash report.sh $test output1.jsonl 1 1 1.0 0 1.0
bash report.sh $test output2.jsonl 2 5 1.0 0 1.0
bash report.sh $test output3.jsonl 2 9 1.0 0 1.0
bash report.sh $test output4.jsonl 3 1 1.0 50 1.0
bash report.sh $test output5.jsonl 3 1 1.0 100 1.0
bash report.sh $test output6.jsonl 3 1 1.0 0 0.7
bash report.sh $test output7.jsonl 3 1 1.0 0 0.9
bash report.sh $test output8.jsonl 3 1 0.68 0 1.0
bash report.sh $test output9.jsonl 3 1 0.95 0 1.0