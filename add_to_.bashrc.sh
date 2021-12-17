# Add the following to ~/.bashrc
# Usage:
# bak filename; bak dirname

function bak() {
for FILE_SOURCE_INPUT in $@; do
        FILE_SOURCE_ALL=$(readlink -f ${FILE_SOURCE_INPUT})
        FILE_SOURCE_DIRNAME=$(dirname $FILE_SOURCE_ALL)
        for FILE_SOURCE_1_FIND in $(find ${FILE_SOURCE_DIRNAME} -mindepth 1 -maxdepth 1 -name "$(basename ${FILE_SOURCE_ALL})" | sed 's/^\/$//g;s/^\/\.$//g' | grep -vE ".*.bak_202[0-9]-(0[1-9]|1[0-2])-(0[1-9]|[12][0-9]|3[01])_[0-9]+(.tar.gz)?$"); do
                BAK_CREATED=0
                for i in $(seq -w 1 99); do
                        FILE_PATH=$(dirname ${FILE_SOURCE_1_FIND})
                        FILE_SOURCE_NO_PATH=$(basename ${FILE_SOURCE_1_FIND})
                        FILE_BAK_NO_PATH="${FILE_SOURCE_NO_PATH}.bak_$(date "+%F_%H-%M-%S")"
                        FILE_SOURCE_WITH_PATH="${FILE_PATH}/${FILE_SOURCE_NO_PATH}"
                        FILE_BAK_WITH_PATH="${FILE_PATH}/${FILE_BAK_NO_PATH}"
                        if [ ! -e ${FILE_BAK_WITH_PATH} ] && [ ${BAK_CREATED} -ne 1 ]; then
                                cp -ar ${FILE_SOURCE_WITH_PATH} ${FILE_BAK_WITH_PATH} && echo "${FILE_BAK_NO_PATH}"
                                BAK_CREATED=1
                        fi
                done
        done
done
}
export bak

