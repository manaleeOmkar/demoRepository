#!/bin/bash

# step 1: Dir names
BACKUP_DIR="./backups"
LOG_DIR="./logs"
SOURCE_DIR="."

# Befor moving first delete all the previous backups and logs
if [ -d "$BACKUP_DIR" ]; then
	rm -rf "$BACKUP_DIR"
fi

if [ -d "$LOG_DIR" ]; then 
	rm -rf "$LOG_DIR"
fi

# step 2: Create directories
mkdir -p "$BACKUP_DIR"
mkdir -p "$LOG_DIR"

# step 3: Create timestamp (Just for unique names)
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")

# step 4: Create log files
LOG_FILE="$LOG_DIR/backup_log_$TIMESTAMP.txt"

echo "Backup started" | tee -a "$LOG_FILE"

# step 6 : Find all sh file into current dir
sh_files=$(ls *.sh 2>/dev/null)

if [ -z "$sh_files" ]; then
	echo "No sh files found" | tee -a "$LOG_FILE"
	exit 1
fi

# step 7 : Run loops for sh files
for file in $sh_files; do
	BACKUP_NAME="${file%.sh}_backup_$TIMESTAMP.sh"
	cp "$file" "$BACKUP_DIR/$BACKUP_NAME" 2>>"$LOG_FILE"

	#If yopu want to convert into zip
	gzip -f "$BACKUP_DIR/$BACKUP_NAME" 2>>"$LOG_FILE"

	if [ $? -eq 0 ]; then
		echo "Backup created for the file $file -> $BACKUP_NAME" | tee -a "$LOG_FILE"
	else
		echo "Failed to take the backup $file" | tee -a "$LOG_FILE"
	fi
done

echo "All backup completed" | tee -a "$LOG_FILE"
echo "All logs saved into $LOG_FILE"
