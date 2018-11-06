#!/bin/bash

set -u
set -e

readonly NOTES_FILE=~/cloud/txt/rofinotes.txt

if [[ ! -a "${NOTES_FILE}" ]]; then
    echo "empty" >> "${NOTES_FILE}"
fi

function get_notes()
{
    cat ${NOTES_FILE}
}

function main()
{
    local all_notes="$(get_notes)"

    local note=$( (echo "${all_notes}")  | rofi -dmenu -p "Note:")
    local matching=$( (echo "${all_notes}") | grep "^${note}$")

    if [[ -n "${matching}" ]]; then
        local new_notes=$( (echo "${all_notes}")  | grep -v "^${note}$" )
    else
        local new_notes=$( (echo -e "${all_notes}\n${note}") | grep -v "^$")
    fi

    echo "${new_notes}" > "${NOTES_FILE}"
}

main
