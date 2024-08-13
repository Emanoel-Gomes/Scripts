#!/bin/bash

# baixar html
if [ "$1" == "" ] || [ "$2" == "" ]; then
    echo "PARSING HTML"
    echo "Modo de uso: $0 [site.com] [output_file]"
else
    wget -O site.html "$1"

    # filtrar links
    grep href site.html | cut -d "/" -f 3 | grep "\." | cut -d '"' -f 1 | grep -v "<l" > saida

    # descobrir hosts
    for url in $(cat saida); do 
        host $url | grep "has address"
    done > "$2"
    # limpar arquivo
    rm saida site.html
fi
