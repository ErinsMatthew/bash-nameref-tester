#!/usr/bin/env bash

set -o nounset

initGlobals() {
    declare -agr FIELD_LIST=(
        'A'
        'B'
        'C'
    )
}

debug() {
    echo "$@"
}

getValue() {
    printf 'VALUE-%s' "$1"
}

processFields() {
    declare -Ag "$1"
    local -n FIELD_VALUES_REF
    local FIELD

    FIELD_VALUES_REF=$1

    for FIELD in "${FIELD_LIST[@]}"; do
        FIELD_VALUES_REF[${FIELD}]=$(getValue "${FIELD}")
    done
}

processItem() {
    local FIELD

    declare -Ag FIELD_VALUES=()

    processFields FIELD_VALUES

    for FIELD in "${!FIELD_VALUES[@]}"; do
        debug "${FIELD} = ${FIELD_VALUES[${FIELD}]}"
    done
}

initGlobals

processItem