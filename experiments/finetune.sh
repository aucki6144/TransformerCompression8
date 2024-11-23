python run_finetuning.py \
        --model meta-llama/Llama-3.2-3B \
        --sliced-model-path ~/autodl-tmp/checkpoints_compressed/sliced-Llama-3B-75  \
        --save-dir ~/autodl-tmp/checkpoints_compressed_tuned/sliced-Llama-3B-75-tuned \
        --sparsity 0.10 \
        --device cuda:0 \
        --ppl-eval-dataset alpaca \
        --ppl-eval-batch-size 1 \
        --finetune-dataset alpaca \
        --finetune-train-nsamples 2048 \
        --finetune-train-seqlen 1024 \
        --finetune-train-batch-size 1 \
        --finetune-test-batch-size 1 \
        --lora-alpha 10 \
        --lora-r 32 \
        --lora-dropout 0.1 \
        --lora-target-option attn_head_and_mlp \
        --eval-steps 256 \
        --save-steps 512 \
        --no-wandb