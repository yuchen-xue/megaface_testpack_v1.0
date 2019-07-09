#!/usr/bin/env bash

DEVKIT="devkit/experiments"
FEAT_LST="devkit/templatelists/facescrub_features_list.json"

R50="r50-simple"
R50_MODEL="models/model-r50-am-lfw/model,0"
R50_OUT="feature-out/r50-simple/feature_out"
R50_OUT_CLEAN="feature-out/r50-simple/feature_out_clean"
R50_RESULT="mx_results/r50-simple"
python gen_megaface-mod.py --gpu 0 1 --algo "$R50" --model $R50_MODEL --output $R50_OUT
python remove_noises.py --algo "$R50" --feature-dir-input $R50_OUT --feature-dir-out $R50_OUT_CLEAN
python $DEVKIT/run_experiment.py $R50_OUT_CLEAN/megaface $R50_OUT_CLEAN/facescrub _"$R50".bin $R50_RESULT -s 1000000 -p $FEAT_LST
