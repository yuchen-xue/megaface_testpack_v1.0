#!/usr/bin/bash

DEVKIT="devkit/experiments"
FEAT_LST="devkit/templatelists/facescrub_features_list.json"

R50="r50"
R50_MODEL="models/model-r50-am-lfw/model,0"
R50_OUT="feature-out/r50/feature_out"
R50_OUT_CLEAN="feature-out/r50/feature_out_clean"
R50_RESULT="mx_results/r50"
# python gen_megaface.py --gpu 0 1 --algo "$R50" --model $R50_MODEL --output $R50_OUT
# python remove_noises.py --algo "$R50" --feature-dir-input $R50_OUT --feature-dir-out $R50_OUT_CLEAN
# python $DEVKIT/run_experiment.py $R50_OUT_CLEAN/megaface $R50_OUT_CLEAN/facescrub _"$R50".bin $R50_RESULT -s 1000000 -p $FEAT_LST

R34="r34"
R34_MODEL="models/model-r34-amf/model,0"
R34_OUT="feature-out/r34/feature_out"
R34_OUT_CLEAN="feature-out/r34/feature_out_clean"
R34_RESULT="mx_results/r34"
# python gen_megaface.py --gpu 0 1 --algo "$R34" --model $R34_MODEL --output $R34_OUT
# python remove_noises.py --algo "$R34" --feature-dir-input $R34_OUT --feature-dir-out $R34_OUT_CLEAN
# python $DEVKIT/run_experiment.py $R34_OUT_CLEAN/megaface $R34_OUT_CLEAN/facescrub _"$R34".bin $R34_RESULT -s 1000000 -p $FEAT_LST

Y1="y1"
Y1_MODEL="models/model-y1-test2/model,0"
Y1_OUT="feature-out/y1/feature_out"
Y1_OUT_CLEAN="feature-out/y1/feature_out_clean"
Y1_RESULT="mx_results/y1"
python gen_megaface.py --gpu 0 1 --algo "$Y1" --model $Y1_MODEL --output $Y1_OUT
python remove_noises.py --algo "$Y1" --feature-dir-input $Y1_OUT --feature-dir-out $Y1_OUT_CLEAN
python $DEVKIT/run_experiment.py $Y1_OUT_CLEAN/megaface $Y1_OUT_CLEAN/facescrub _"$Y1".bin $Y1_RESULT -s 1000000 -p $FEAT_LST
