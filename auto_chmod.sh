#!/bin/bash

# Directory to watch; change as needed
WATCH_DIR="${1:-.}"

# Use inotifywait to watch for new *.sh files
inotifywait -m -e create --format '%f' "${WATCH_DIR}" | while read NEWFILE
do
    # Check if the file ends in .sh
    if [[ "$NEWFILE" == *.sh ]]; then
        # Wait for the file to stabilize before chmod
        sleep 0.1
        chmod +x "${WATCH_DIR}/${NEWFILE}"
        echo "Set executable: ${WATCH_DIR}/${NEWFILE}"
    fi
done

