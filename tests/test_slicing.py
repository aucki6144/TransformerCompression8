# Copyright (c) Microsoft Corporation.
# Licensed under the MIT license.

from slicegpt import hf_utils, layernorm_fusion


def test_layernorm_fusion_replaces_modules():
    """ Checks that module parameters are changes after applying layernorm fusion """
    model_name = "facebook/opt-125m"
    model, tokenizer = hf_utils.get_model(model_name)

    orig_layers = get_layers(model)

    layernorm_fusion.replace_modules(model, model.config)
    layernorm_fusion.fuse_modules(model)
    
    assert orig_layers != get_layers(model)

def get_layers(model):
    return [name for name, _ in model.named_parameters()]