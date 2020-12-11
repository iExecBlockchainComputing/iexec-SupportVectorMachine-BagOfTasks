#!/bin/bash
rm -rf iexec_in
rm -rf iexec_out
mkdir -p iexec_in
mkdir -p iexec_out

cd iexec_in/
wget https://raw.githubusercontent.com/iExecBlockchainComputing/iexec-SupportVectorMachine-BagOfTasks/main/parameters.csv
cd ../


BOTSIZE=`wc -l < iexec_in/parameters.csv`

echo "BOTSIZE $BOTSIZE"

#BOT test
docker build -t test .

for i in `seq 0 $((BOTSIZE-1))`;
do
  docker run -v `pwd`/iexec_in:/iexec_in \
           -v `pwd`/iexec_out:/iexec_out \
           -e IEXEC_BOT_TASK_SIZE=$BOTSIZE \
           -e IEXEC_INPUT_FILE_NAME_1=parameters.csv \
           -e IEXEC_BOT_TASK_INDEX=$i \
           test
done

ls -lh iexec_out/*
