#!/bin/bash
ls
cd ../tools

# python convert_prima_to_coco.py \
#     --prima_datapath ../data/prima \
#     --anno_savepath ../data/prima/annotations.json 

python3.8 train_net.py \
    --dataset_name          mmv-layout \
    --json_annotation_train ../data/mmv/annotations-train.json \
    --image_path_train      ../data/mmv/Images \
    --json_annotation_val   ../data/mmv/annotations-val.json \
    --image_path_val        ../data/mmv/Images \
    --config-file           ../configs/mmv/faster_rcnn_R_50_FPN_3x.yaml \
    MODEL.WEIGHTS ../configs/mmv/faster_rcnn_R_50_FPN_3x.pth \
    OUTPUT_DIR  ../outputs/mmv/faster_rcnn_R_50_FPN_3x/ \
    MODEL.ROI_HEADS.BATCH_SIZE_PER_IMAGE 256 \
    SOLVER.CHECKPOINT_PERIOD 20000 \
    SOLVER.MAX_ITER 80000 \
    SOLVER.IMS_PER_BATCH 2 