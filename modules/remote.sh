function remote {
  local option results
  checkroot
  checkrpi
  option="$1"

  if [ "$option" = "check" ]; then
    checkargn $# 1
    echo "$(bluetooth mac) $(image) $(version) $(detectrpi)"
  elif [ "$option" = "status" ]; then
    checkargn $# 1
    echo "$(internet) $(bluetooth mac) $(image) $(version) $(detectrpi)"
  elif [ "$option" = "upgrade" ]; then
    checkargn $# 1
    upgrade --check
  elif [ "$option" = "services" ]; then
    checkargn $# 2
    if [ "$2" = "available" ]; then
      results="Available: $(services available)"
      echo $results
    elif [ "$2" = "installed" ]; then
      results="Installed: $(services installed)"
      echo $results
    elif [ "$2" = "running" ]; then
      results="Running: $(services running)"
      echo $results
    else
      echo "Error: incorrect command"
      echo "Usage: $BASENAME remote services <available | installed | running>"
      exit 1
    fi
  elif [ "$option" = "version" ]; then
    checkargn $# 2
    if [ -z "$2" ]; then
      echo "Error: version number required"
      echo "Usage: $BASENAME remote version <version_number>"
      exit 1
    fi
    if ! [[ "$2" =~ ^[0-9]+$ ]]; then
      echo "Error: not a number"
      exit 1
    fi
    if [ "$2" -ge "$(node -p "require('$SCRIPTFOLDER/package.json').remote")" ]; then
      echo "version: true"
    else
      echo "version: false"
    fi
  elif [ "$option" = "commands" ]; then
    checkargn $# 2
    source $SCRIPTFOLDER/_treehouses && _treehouses_complete 2>/dev/null
    if [ -z "$2" ]; then
      echo "$every_command"
    elif [ "$2" = "json" ]; then
      while IFS= read -r line;
      do
        cmd_str+="\"$line\","
      done <<< "$every_command"
      printf "{\"commands\":["%s"]}\n" "${cmd_str::-1}"
    else
      echo "Error: incorrect command"
      echo "Usage: $BASENAME remote commands [json]"
      exit 1
    fi
  elif [ "$option" = "allservices" ]; then
    checkargn $# 1
    json_fmt="{\"available\":["%s"],\"installed\":["%s"],\"running\":["%s"],\"icon\":{"%s"},\"info\":{"%s"},\"autorun\":{"%s"}}\n"

    available_str=$(services available | sed 's/^\|$/"/g' | paste -d, -s)
    installed_str=$(services installed | sed 's/^\|$/"/g' | paste -d, -s)
    running_str=\"$(services running | tr ' ' ',')\"
    running_str=${running_str//,/\",\"}

    available=($(services available))
    for i in "${available[@]}"
    do
      icon_str+="\"$i\":\"$(source $SERVICES/install-$i.sh && get_icon | sed 's/^[ \t]*//;s/[ \t]*$//' | tr '\n' ' ' | sed 's/"/\\"/g')\","
      info_str+="\"$i\":\"$(source $SERVICES/install-$i.sh && get_info | tr '\n' ' ' | sed 's/"/\\"/g')\","
      autorun_str+="\"$i\":\"$(autorun_helper $i)\","
    done

    printf "$json_fmt" "$available_str" "$installed_str" "$running_str" "${icon_str::-1}" "${info_str::-1}" "${autorun_str::-1}"
  elif [ "$option" = "help" ]; then
    json_var=$(jq -n --arg desc "$(source $SCRIPTFOLDER/modules/help.sh && help)" '{"help":$desc}')
    for file in $SCRIPTFOLDER/modules/*.sh
    do
      command=${file##*/}
      command=${command%.*}
      if [ "$command" != "help" ]; then
        if [ "$command" != "detectrpi" ] && [ "$command" != "globals" ]; then
          json_var=$(echo $json_var | jq --arg key "$command" --arg desc "$(source $file && ${command}_help)" '. += {($key):($desc)}')
        fi
      fi
    done
    echo ${json_var}
  else
    echo "Unknown command option"
    echo "Usage: $BASENAME remote [check | status | upgrade | services | version | commands | allservices]"
  fi
}

function autorun_helper {
  if [ ! -f /boot/autorun ]; then
    echo "false"
  else
    found=false
    while read -r line; do
      if [[ $line == "${1}_autorun=true" ]]; then
        found=true
        break
      fi
    done < /boot/autorun
    if [ "$found" = true ]; then
      echo "true"
    else
      echo "false"
    fi
  fi
}

function remote_help {
  echo
  echo "Usage: $BASENAME remote [check | status | upgrade | services | version | commands | allservices]"
  echo
  echo "Returns a string representation of the current status of the Raspberry Pi"
  echo "Used for Treehouses Remote"
  echo
  echo "$BASENAME remote check"
  echo "<bluetooth mac> <image> <version> <detectrpi>"
  echo "     │            │           │        │"
  echo "     │            │           │        └── model number of rpi"
  echo "     │            │           └─────────── current cli version"
  echo "     │            └─────────────────────── current treehouses image version"
  echo "     └──────────────────────────────────── bluetooth mac address"
  echo
  echo "$BASENAME remote status"
  echo "<internet> <bluetooth mac> <image> <version> <detectrpi>"
  echo "     │            │           │        │          │"
  echo "     │            │           │        │          └── model number of rpi"
  echo "     │            │           │        └───────────── current cli version"
  echo "     │            │           └────────────────────── current treehouses image version"
  echo "     │            └────────────────────────────────── bluetooth mac address"
  echo "     └─────────────────────────────────────────────── internet connection status"
  echo
  echo "$BASENAME remote upgrade"
  echo "true if an upgrade is available"
  echo "false otherwise"
  echo
  echo "$BASENAME remote services [available | installed | running]"
  echo "Available: | Installed: | Running: <list of services>"
  echo
  echo "$BASENAME remote version <version_number>"
  echo "true if <version_number> >= \"remote_min_version\" in package.json"
  echo "false otherwise"
  echo
  echo "$BASENAME remote commands [json]"
  echo "returns a list of all commands for tab completion"
  echo
  echo "$BASENAME remote allservices"
  echo "returns json string of services"
  echo
}
