# Add the following to .bashrc

function bak() {
for file_source_input in $@; do
        file_source_all=$(readlink -f ${file_source_input})
        file_source_dirname=$(dirname $file_source_all)
        for file_source_1_find in $(find ${file_source_dirname} -mindepth 1 -maxdepth 1 -name "$(basename ${file_source_all})" | sed 's/^\/$//g;s/^\/\.$//g' | grep -vE ".*.bak_202[0-9]-(0[1-9]|1[0-2])-(0[1-9]|[12][0-9]|3[01])_[0-9]+(.tar.gz)?$"); do
                BAK_CREATED=0
                for i in $(seq -w 1 99); do
                        FILE_PATH=$(dirname ${file_source_1_find})
                        FILE_SOURCE_NO_PATH=$(basename ${file_source_1_find})
                        FILE_BAK_NO_PATH="${FILE_SOURCE_NO_PATH}.bak_$(date "+%F")_${i}"
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

