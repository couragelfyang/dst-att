#!/bin/bash
#$ -cwd                      ## Execute a job in current directory
#$ -l q_node=1               ## Use number of node
#$ -l h_rt=24:00:00          ## Running job time

export PATH="/gs/hs0/tga-tslab/longfei/anaconda3/bin:$PATH"

. /etc/profile.d/modules.sh
module load\
  ntel/19.0.0.117 \
  cuda/10.0.130 \
  tinker/8.1.2 \
  cudnn/7.4 \
  nccl/2.4.2

source activate star
cd /gs/hs0/tga-tslab/longfei/dis-separate

python3 train_STAR.py --attn_head $attn_head --attn_rules $attn_rules --attn_qk_dim $attn_qk_dim --save_dir out-bert/exp.${attn_head}-${attn_rules}-${attn_qk_dim}
