# Add the following to .bashrc

function bak() {
    for file_source in $(ls -d $@ 2>/dev/null | grep -vE ".*.bak_202[0-9]-(0[1-9]|1[0-2])-(0[1-9]|[12][0-9]|3[01])_[0-9]+(.tar.gz)?$")
    do
        BAK_CREATED=0
        for i in $(seq 99)
        do
            FILE_BAK="${file_source}.bak_$(date "+%F")_${i}"
            if [ ! -f ${FILE_BAK} ] && [ ${BAK_CREATED} -ne 1 ]
            then
                cp -ar ${file_source} ${FILE_BAK} && echo ${FILE_BAK}
                BAK_CREATED=1
            fi
        done
    done
}
