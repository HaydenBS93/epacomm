#!/bin/bash

# === Variables ===
LOG_DIR="$HOME/epacomm/logs"
TODAY=$(date +"%Y-%m-%d")
LOG_FILE="$LOG_DIR/${TODAY}_command_log.txt"
HIST_FILE="$HOME/.bash_history"

# === Ensure log directory exists ===
mkdir -p "$LOG_DIR"
touch "$LOG_FILE"

# === Infinite loop to capture commands ===
while true; do
    sleep 1
    history -a
    LAST_CMD=$(tail -n 1 "$HIST_FILE")

    # Avoid logging duplicate consecutive commands
    if [ -z "$LAST_LOGGED" ] || [ "$LAST_CMD" != "$LAST_LOGGED" ]; then
        echo "$(date '+%Y-%m-%d %H:%M:%S') - $LAST_CMD" >> "$LOG_FILE"
        LAST_LOGGED="$LAST_CMD"
    fi
done
