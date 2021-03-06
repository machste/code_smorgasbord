#!/bin/bash

################################################################################
# variable
################################################################################

LOG_FILE_NAME=byteflipper.log

################################################################################


################################################################################
# functions
################################################################################

function show_usage {
    echo "[show_usage] run like this:"
    echo " ./run_test_n_times <nr_of_runs>"
}

################################################################################


################################################################################
# main
################################################################################

if [ $# -ne 1 ]; then
    show_usage
    exit
fi
echo "[main] arguments ok..."

echo "[main] remove existing log file..."
rm -f $LOG_FILE_NAME

echo "[main] run application $1 times"
export LD_LIBRARY_PATH=.

for LOOP_COUNTER in $(seq 1 $1)
do
    taskset -c 0 java -Xbatch ByteFlipperTest >> $LOG_FILE_NAME
done

echo "[main] done! check log file in $LOG_FILE_NAME"

################################################################################
