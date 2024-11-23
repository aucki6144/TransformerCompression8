python run_lm_eval.py \
	--model meta-llama/Llama-3.2-3B \
	--sliced-model-path ~/autodl-tmp/checkpoints_compressed/sliced-Llama-3B-90  \
	--sparsity 0.10 \
    --batch-size 4 \
	--no-wandb
