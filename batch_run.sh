#!/bin/bash

for i in 2 4 8; do
    for j in 8 16 32; do
        for k in 16 32 64 128; do
            qsub -p -4 -g tga-tslab -o run.log.${i}-${j}-${k} -e err.log.${i}-${j}-${k} -v attn_head=$i,attn_rules=$j,attn_qk_dim=$k tsubame_run.sh
        done
    done
done

