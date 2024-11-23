python run_slicegpt.py \
	--no-wandb \
	--model meta-llama/Llama-3.2-3B \
	--model-path ~/autodl-tmp/checkpoints_hf/Llama-3.2-3B-hf/ \
	--sparsity 0.1 \
	--save-dir ~/autodl-tmp/checkpoints_compressed/sliced-Llama-3B-90 \
	--device cuda:0 \
	--ppl-eval-batch-size 1
