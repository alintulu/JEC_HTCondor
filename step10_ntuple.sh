#!/bin/bash

[[ -z "$8" ]] && { echo "Provide eight parameters (7th: PU/noPU)" ; exit 1; }

proxy=$1
cluster_id=$2
job_id=$3
filename=$4
batch=$5
number_events=$6
PU=$7
WD=$8
start=$((job_id*batch))

source $WD/setupCMSSW.sh $proxy

cmsRun JetMETAnalysis/JetAnalyzers/test/run_JRA_cfg.py +i $filename +b $batch +id $job_id +sf $start +ne $number_events +pu $PU
