#!/bin/bash

DATA_TYPE="float"
DIST_FN="l2"
DATASET_PATH="../build/data/sift/"
DATA_PATH="${DATASET_PATH}sift_learn.fbin"
QUERY_PATH="${DATASET_PATH}sift_query.fbin"
GT_PATH="${DATASET_PATH}sift_query_learn_gt100"
INDEX_PREFIX="${DATASET_PATH}1_breakdown"
R=32
L_B=50
L_S=10
B=0.03
M=1
K=10
C=1000
T=1
../build/apps/build_disk_index\
	 --data_type $DATA_TYPE\
	 --dist_fn $DIST_FN\
	 --data_path $DATA_PATH\
	 --index_path_prefix $INDEX_PREFIX\
	 -R $R\
	 -L $L_B\
	 -B $B\
	 -M $M
 ../build/apps/search_disk_index\
	 --data_type $DATA_TYPE\
	 --dist_fn $DIST_FN\
	 --index_path_prefix $INDEX_PREFIX\
	 --query_file $QUERY_PATH\
	 --gt_file $GT_PATH\
	 -K $K\
	 -L $L_S\
	 --result_path $DATASET_PATH/res\
	 --num_nodes_to_cache $C\
