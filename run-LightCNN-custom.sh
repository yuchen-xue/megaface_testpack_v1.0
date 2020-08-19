#!/usr/bin/bash

DEVKIT="devkit/experiments"
FEAT_LST="devkit/templatelists/facescrub_features_list.json"

Y1="LightCNN-custom"
# Y1_MODEL="models/model-sphereface-test2/model,0"
Y1_OUT="feature-out/LightCNN-custom/feature_out"
Y1_OUT_CLEAN="feature-out/LightCNN-custom/feature_out_clean"
Y1_RESULT="mx_results/LightCNN-custom"
# python gen_megaface.py --gpu 0 1 --algo "$Y1" --model $Y1_MODEL --output $Y1_OUT
python remove_noises-mod.py --algo "$Y1" --feature-dir-input $Y1_OUT --feature-dir-out $Y1_OUT_CLEAN 

python $DEVKIT/run_experiment.py $Y1_OUT_CLEAN/megaface $Y1_OUT_CLEAN/facescrub _"$Y1".bin $Y1_RESULT -s 1000000 -p $FEAT_LST 
