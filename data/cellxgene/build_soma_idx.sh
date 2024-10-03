#!/bin/sh
# output directory for the index 
OUTPUT_DIR="/storage1/fs1/aditigupta/Active/Summer2022_Levi/Fuhai_rotation/scGPT/data/cellxgene/cell_index"
QUERY_LIST="/storage1/fs1/aditigupta/Active/Summer2022_Levi/Fuhai_rotation/scGPT/data/cellxgene/query_list.txt"

while read QUERY; do
    echo "building index for ${QUERY}"
    python3 ./build_soma_idx.py --query-name ${QUERY} --output-dir ${OUTPUT_DIR} 
done < ${QUERY_LIST}

