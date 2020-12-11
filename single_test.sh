#!/bin/bash
rm -rf iexec_in
rm -rf iexec_out
mkdir -p iexec_in
mkdir -p iexec_out

cd iexec_in/
wget https://raw.githubusercontent.com/iExecBlockchainComputing/iexec-SupportVectorMachine-BagOfTasks/main/parameters.csv
cd ../

#BOT test
docker build -t test .

docker run -v `pwd`/iexec_in:/iexec_in \
           -v `pwd`/iexec_out:/iexec_out \
           -e IEXEC_INPUT_FILE_NAME_1=parameters.csv \
           test

ls -lh iexec_out/*
