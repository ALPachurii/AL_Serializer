#!/usr/bin/env bash
tee() { mkdir -p "${1%/*}" && command tee "$@"; }
regionList=('CN' 'EN' 'JP' 'KR')

for region in "${regionList[@]}"; do
    find AzurLane_ClientSource/Src/"$region"/sharecfg -type f | while read file ; do
        path="$(echo $file | sed 's/.lua//g')"
        name=$(basename $file '.lua')
        env lua5.3 serializer.lua "$path" "$name" | jq . | tee "Data_Dump/$path"
    done

    find AzurLane_ClientSource/Src/"$region"/gamecfg -type f \( ! -iname "academygraph.lua" ! -iname "assistantinfo.lua" ! -iname "chargeshiptalkinfo.lua" ! -iname "include.lua" ! -iname "names.lua" \) | while read file ; do
        path=$(echo "$file" | sed 's/.lua//g')
        env lua5.3 serializer2.lua "$path" | jq . | tee "Data_Dump/$path"
    done
done
