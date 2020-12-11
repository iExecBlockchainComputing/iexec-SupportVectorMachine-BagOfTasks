#!/bin/bash

cd /
echo $IEXEC_BOT_TASK_SIZE
echo $IEXEC_INPUT_FILE_NAME_1
echo $IEXEC_BOT_TASK_INDEX

cp /iexec_in/$IEXEC_INPUT_FILE_NAME_1 /parameters.csv

if [ -z $IEXEC_BOT_TASK_SIZE ]
then
  echo "Single mode"
  BOTSIZE=`wc -l < /iexec_in/parameters.csv`
  echo "BOTSIZE " $BOTSIZE
  for i in `seq 0 $((BOTSIZE-1))`;
     do
       python3  svm_classification_paramstudy.py /iexec_out/ $i
#       cp /iexec_out/determinism.txt /iexec_out/determinism_$i.txt
     done
else
   echo "Bot mode: "
   python3  svm_classification_paramstudy.py /iexec_out/ $IEXEC_BOT_TASK_INDEX
#   cp /iexec_out/determinism.txt /iexec_out/determinism_$IEXEC_BOT_TASK_INDEX.txt
fi

# in python file, report is saved in /iexec_out/computed.txt
echo "ok" > /iexec_out/determinism.txt
echo "{ \"deterministic-output-path\" : \"/iexec_out/determinism.txt\" }" > /iexec_out/computed.json
