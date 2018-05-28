#!/bin/bash

# back up a users home directory to /tmp

user=$(whoami)
input=/home/${user}
output=/tmp/${user}_home_$(date +%Y-%m-%d_%H%M%S).tar.gz

# this function reports the total number of files in the directory
function total_files {
	find $1 -type f | wc -l
}

# this function reports the total number of directories
function total_directories {
	find $1 -type d | wc -l
}



#echo $input
#echo $output
echo "Starting backup..."

tar -czf $output $input 2> /dev/null

echo -n "Files to be included:"
total_files $input 2> /dev/null
echo -n "Directories to be included:"
total_directories $input 2> /dev/null

echo "Backup of $input completed. Details about the output backup file:"
ls -l $output

