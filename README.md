# Transformer Compression with SliceGPT ∞

This repository is forked from [microsoft/TransformerCompression](https://github.com/microsoft/TransformerCompression), aiming to offer supports for modern LLMs and MOE models.

Please refer to the origin repository for the introduction of SliceGPT :)

## Quick Start

To install slicegpt dependencies, run

```commandline
pip install -e .[experiment,finetune]
```

### Compression

To run SliceGPT on `meta-llama/Llama-3.2-3B`, from the `experiments` folder, run 
```commandline
python run_slicegpt.py \
    --model meta-llama/Llama-3.2-3B \
    --save-dir DIR_TO_SAVE \
    --sparsity 0.25 \
    --device cuda:0 \
    --eval-baseline \
    --no-wandb
```

_Note:_ For models that require Hugging Face authentication, set the `--hf-token` argument 
manually or using a key vault. Alternatively, set the environment variable `HF_TOKEN`.

### Recovery fine-tuning

The following replicates the experiments in the paper (LoRA hyperparams valid for all Llama-2 and Phi-2 models): 
```commandline
python run_finetuning.py \
    --model meta-llama/Llama-3.2-3B \
    --sliced-model-path DIR_TO_SLICED_MODEL \
    --save-dir DIR_TO_SAVE \
    --sparsity 0.25 \
    --device cuda:0 \
    --ppl-eval-dataset alpaca \
    --finetune-dataset alpaca \
    --finetune-train-nsamples 8000 \
    --finetune-train-seqlen 1024 \
    --finetune-train-batch-size 3 \
    --lora-alpha 10 \
    --lora-r 32 \
    --lora-dropout 0.05 \
    --lora-target-option attn_head_and_mlp \
    --eval-steps 16 \
    --save-steps 16 \
    --no-wandb
```

### Evaluation with [LM Eval Harness](https://github.com/EleutherAI/lm-evaluation-harness) 
```commandline
python run_lm_eval.py \
    --model meta-llama/Llama-3.2-3B \
    --sliced-model-path DIR_TO_SLICED_MODEL \
    --sparsity 0.25 \
    --no-wandb
```

Notes: 
- To run lm-eval on the original model, specify `--model-path` instead of `--sliced-model-path`. 
- `sparsity` must be specified when specifying `sliced-model-path` to avoid default sparsity being used

## Supported models

The following models from Hugging Face hub are currently supported
- [microsoft/phi-2](https://huggingface.co/microsoft/phi-2)
- [microsoft/Phi-3-mini-4k-instruct](https://huggingface.co/microsoft/Phi-3-mini-4k-instruct)
- [meta-llama/Llama-2-7b-hf](https://huggingface.co/meta-llama/Llama-2-7b)
- [meta-llama/Llama-2-13b-hf](https://huggingface.co/meta-llama/Llama-2-13b)
- [meta-llama/Llama-2-70b-hf](https://huggingface.co/meta-llama/Llama-2-70b)
- [meta-llama/Meta-Llama-3-8B](https://huggingface.co/meta-llama/Meta-Llama-3-8B)
- [meta-llama/Meta-Llama-3-8B-Instruct](https://huggingface.co/meta-llama/Meta-Llama-3-8B-Instruct)
- [meta-llama/Meta-Llama-3-70B](https://huggingface.co/meta-llama/Meta-Llama-3-70B)
- [meta-llama/Meta-Llama-3-70B-Instruct](https://huggingface.co/meta-llama/Meta-Llama-3-70B-Instruct)
- [meta-llama/Llama-3.2-1B](https://huggingface.co/meta-llama/Llama-3.2-1B)
- [meta-llama/Llama-3.2-3B](https://huggingface.co/meta-llama/Llama-3.2-3B)
- [facebook/opt-125m](https://huggingface.co/facebook/opt-125m)
- [facebook/opt-1.3b](https://huggingface.co/facebook/opt-1.3b)
- [facebook/opt-2.7b](https://huggingface.co/facebook/opt-2.7b)
- [facebook/opt-6.7b](https://huggingface.co/facebook/opt-6.7b)
- [facebook/opt-13b](https://huggingface.co/facebook/opt-13b)
- [facebook/opt-30b](https://huggingface.co/facebook/opt-30b)
- [facebook/opt-66b](https://huggingface.co/facebook/opt-66b)


