for i in {1..9}
do
  python eval.py -r dataset/public.jsonl -s "output$i.jsonl"
done