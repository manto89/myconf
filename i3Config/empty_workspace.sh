#!/bin/zsh
a=1;
array=($(i3-msg -t get_workspaces | tr , '\n'| grep '"num":' | cut -d : -f 2| sort -n));
i3-msg workspace $(for i in $array; do if [ $i != $a ]; then break;else ((a+=1)); fi ;done; echo $a;)
#i3-msg workspace $(($(i3-msg -t get_workspaces | tr , '\n' | grep '"num":' | cut -d : -f 2 | sort -rn | head -1) + 1))
