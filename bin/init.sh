#!/bin/bash

echo export EASY_PATH=$(pwd) >> ~/.profile && echo 'export PATH="$PATH:$EASY_PATH/bin"' >> ~/.profile && source ~/.profile

easy
