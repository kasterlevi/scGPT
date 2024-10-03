#!/bin/bash
#BSUB -W 8:00
#BSUB -n 4
#BSUB -J "myarray[1-9]"
#BSUB -R "rusage[mem=48G]"
#BSUB -q general
#BSUB -m compute-ohids

INDEX_PATH="/storage1/fs1/aditigupta/Active/Summer2022_Levi/Fuhai_rotation/scGPT/data/cellxgene/cell_index"
QUERY_PATH="/storage1/fs1/aditigupta/Active/Summer2022_Levi/Fuhai_rotation/scGPT/data/cellxgene/query_list.txt"
DATA_PATH="/storage1/fs1/aditigupta/Active/Summer2022_Levi/Fuhai_rotation/scGPT/data/cellxgene/saved_data"

# get number of queries
line_count=$(wc -l < $QUERY_PATH)

cd $DATA_PATH

# loop through each query and run
for (( i=1; i<=line_count; i++ ))
do
    cd $DATA_PATH
    query_name=$(sed -n "${i}p" $QUERY_PATH)
    echo "downloading ${query_name}"

    /storage1/fs1/aditigupta/Active/Summer2022_Levi/Fuhai_rotation/scGPT/data/cellxgene/download_partition.sh ${query_name} ${INDEX_PATH} ${DATA_PATH}
done