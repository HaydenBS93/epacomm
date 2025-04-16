#!/bin/bash

cd "$HOME/epacomm"

TODAY=$(date +"%Y-%m-%d")
LOG_FILE="logs/${TODAY}_command_log.txt"

# Check if log exists before committing
if [ -f "$LOG_FILE" ]; then
    git add "$LOG_FILE"
    git commit -m "Add command log for $TODAY"
    git push
fi
