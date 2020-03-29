#!/bin/bash
#add fix to exercise6-fix here

# Verify there are at least 2 input arguments
if [ $# -lt 2 ]; then
        echo The script should get minimum of 2 arguments. Exiting...
        exit 1
fi

files=($@)
dest=${files[-1]}
# Remove last argument from files list
unset files[${#files[@]}-1]

# Support running on both server
src_server=`hostname -I | cut -d' ' -f2`
if [ ${src_server} == 192.168.100.11 ]; then
        dest_server=192.168.100.10
else
        dest_server=192.168.100.11
fi

total_bytes_copied=`rsync -v ${files[@]} ${dest_server}:${dest} | grep total | cut -d' ' -f4`
echo ${total_bytes_copied}

