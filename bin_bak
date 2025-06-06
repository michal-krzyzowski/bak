#!/bin/bash

# process parameters with options
ARGS_LIST="$(seq 1 $#)"
for i in ${ARGS_LIST}; do
        opt="$(echo ${!i})"
        case $opt in
                "-c")
                        j=$((i+1))
                        BACKUP_COMMENT="$(echo ${!j})"
                        BACKUP_COMMENT="$(echo $BACKUP_COMMENT | grep -e "[A-Za-z90-9 ]" | sed "s/ /_/g;s/^/_/g")"
                        ARGS_LIST=$(echo "$ARGS_LIST" | sed "s/\b${i}\b//g;s/\b${j}\b//g")
                ;;
        esac
done

# process positional parameters (files)
FILE_SOURCE_LIST=""
for i in ${ARGS_LIST}; do
        opt="$(echo ${!i})"
        case $opt in
                *)
                        FILE_SOURCE_LIST=$(echo "$FILE_SOURCE_LIST ${!i}")
                ;;
        esac
done

# main
CURRENT_DIRECTORY="$(pwd)"
for FILE_SOURCE_INPUT in $FILE_SOURCE_LIST; do
        FILE_SOURCE_ALL=$(readlink -f ${FILE_SOURCE_INPUT})
        FILE_SOURCE_DIRNAME=$(dirname $FILE_SOURCE_ALL)
        for FILE_SOURCE_CURRENT in $(find ${FILE_SOURCE_DIRNAME} -mindepth 1 -maxdepth 1 -name "$(basename ${FILE_SOURCE_ALL})" | sed 's/^\/$//g;s/^\/\.$//g' | grep -vE ".*.bak_[1-9][0-9][0-9][0-9]-(0[1-9]|1[0-2])-(0[1-9]|[12][0-9]|3[01])_[0-9]+(.tar.gz)?$"); do
                BAK_CREATED=0
                FILE_PATH=$(dirname ${FILE_SOURCE_CURRENT})
                FILE_SOURCE_WITHOUT_PATH=$(basename ${FILE_SOURCE_CURRENT})
                FILE_SOURCE_INCLUDING_PATH="${FILE_PATH}/${FILE_SOURCE_WITHOUT_PATH}"
                FILE_TARGET_WITHOUT_PATH="${FILE_SOURCE_WITHOUT_PATH}.bak_$(date "+%F")_$(date "+%H_%M_%S")${BACKUP_COMMENT}"
                FILE_TARGET_INCLUDING_PATH="${FILE_PATH}/${FILE_TARGET_WITHOUT_PATH}"
                if [ "${FILE_PATH}" == "${CURRENT_DIRECTORY}" ] ; then
                        FILE_TARGET_OUTPUT_DISPLAY="${FILE_TARGET_WITHOUT_PATH}"
                else
                        FILE_TARGET_OUTPUT_DISPLAY="${FILE_TARGET_INCLUDING_PATH}"
                fi
                if [ ! -e ${FILE_TARGET_INCLUDING_PATH} ] && [ ${BAK_CREATED} -ne 1 ]; then
                        cp -ar ${FILE_SOURCE_INCLUDING_PATH} ${FILE_TARGET_INCLUDING_PATH} && echo "${FILE_TARGET_OUTPUT_DISPLAY}"
                        BAK_CREATED=1
                fi
        done
done

exit 0
