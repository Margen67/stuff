#!/usr/bin/env bash

#set -e

if [ ${BASH_VERSION::1} -lt 4 ]; then
    echo 'Older bash version detected. Expect problems.'
fi

check_if_quitting()
{
    if [[ "$1" = quit || "$1" = q ]]; then
        exit
    fi
}

if [[ "$OSTYPE" = cygwin || "$OSTYPE" = msys ]]; then
    if ! hash 7z 2>/dev/null; then
        # Naming this 7z makes bash shit itself
        sevenz_default_path="/c/${PROGRAMFILES:3}/7-Zip"
        if [ -d "${sevenz_default_path}" ]; then
            #echo "Found 7-Zip!"
            PATH+=":$sevenz_default_path"
        else
            choose()
            {
                read -rp 'Where is 7-Zip? (Q to quit)' choice
                check_if_quitting "${choice,,}"
                if [ ! -d "$choice" ]; then
                    echo -e '\nInvalid choice!'
                    choose
                fi
            }
            choose
        fi
    fi
fi

if [[ "$1" = extract || "$1" = e || "$1" = rezip || "$1" = r ]]; then
    operation="${1,,}"
else
    if [ -n "$1" ]; then
        echo 'Invalid operation!'
    fi
    choose()
    {
        read -rn1 -p $'What would you like to do?\n[E]xtract [R]ezip [Q]uit' choice
        operation="${choice,,}"
        check_if_quitting "$operation"
        if [[ "$operation" != e && "$operation" != r ]]; then
            echo -e '\nInvalid choice!'
            choose
        fi
    }
    choose
fi

if [ -f "$2" ]; then
    file="$2"
fi
choose_file()
{
    echo -e "\nWhat file would you like to $1? (Q to quit)"
    read -r file
    operation="${file,,}"
    check_if_quitting "$operation"
    if [[ ! -r "$file" || ! -w "$file" ]]; then
        echo "Invalid file!"
        choose_file "$1"
    fi
}

if [[ "$operation" = extract || "$operation" = e ]]; then
    if [[ ! -f "$2" || ! "$2" = *\.gbd* ]]; then
        if [[ ! "$2" = *\.gbd* ]]; then
            echo 'ERROR: Attempted to extract non-archive!'
        fi
        choose_file extract
    fi
    7z e "$file" "-o$(dirname $file)"
fi

if [[ "$operation" = rezip || "$operation" = r ]]; then
    if [[ ! -f "$2" || "$2" = *\.gbd* ]]; then
        if [[ "$2" = *\.gbd* ]]; then
            echo 'ERROR: Attempted to double zip!'
        fi
        choose_file rezip
    fi
    file_archive="${file}.bz2"
    file_real="${file}.gbd"
    file_backup="${file_real}.bak"
    7z a "$file_archive" "$file"
    mv "$file_real" "$file_backup"
    mv "$file_archive" "$file_real"
    head -c 28 "$file_backup" | cat - "$file_real" > temp && mv temp "$file_real"
fi
