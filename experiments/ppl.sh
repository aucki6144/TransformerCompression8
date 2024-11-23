python run_slicegpt.py \
	--no-wandb \
	--model meta-llama/Llama-3.2-3B \
	--sliced-model-path ~/autodl-tmp/checkpoints_compressed/sliced-Llama-3B-90 \
	--sparsity 0.1 \
	--device cuda:0 \
	--ppl-eval-batch-size 1 \
    --ppl-only
