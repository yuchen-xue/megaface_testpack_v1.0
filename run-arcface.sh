#!/usr/bin/env bash

DEVKIT="devkit/experiments"
ALGO="r100ii" #ms1mv2
ROOT='feature-out/r100ii'
echo $ROOT
# python -u gen_megaface-mod.py --gpu 0 --algo "$ALGO" --model '../IJB_release/pretrained_models/MS1MV2-ResNet100-Arcface/model,0'
# python -u remove_noises.py --algo "$ALGO"

# cd "$DEVKIT"
LD_LIBRARY_PATH="/usr/local/lib64:$LD_LIBRARY_PATH" python -u $DEVKIT/run_experiment.py "$ROOT/feature_out_clean/megaface" "$ROOT/feature_out_clean/facescrub" _"$ALGO".bin ../../mx_results/ -s 1000000 -p "devkit/templatelists/facescrub_features_list.json"
# cd - 
