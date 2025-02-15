function discover {
  local option ip mac mac_ip
  checkargn $# 2
  check_missing_packages "nmap"

  option=$1

  if [ $option = "scan" ] || [ $option = "ping" ] || [ $option = "ports" ]; then
    if [ -z $2 ]; then
      echo "You need to provide an IP address or URL for this command".
      exit 1
    fi
    ip=$2
  fi

  case $option in
    rpi)
      checkargn $# 1
      nmap --iflist | grep DC:A6:32
      nmap --iflist | grep B8:27:EB
      ;;
    wifi)
      checkargn $# 1
      checkroot
      iwlist wlan0 scanning | grep -E 'Cell |Encryption|Quality|Last beacon|ESSID'
      ;;
    scan)
      nmap -v -A -T4  $ip
      ;;
    interface)
      checkargn $# 1
      nmap --iflist
      ;;
    ping)
      nmap -sP $ip
      ;;
    ports)
      nmap --open $ip
      ;;
    mac)
      if ! [[ "$2" =~ ^([a-fA-F0-9]{2}:){5}[a-fA-F0-9]{2}$ ]]; then
        echo "Invalid mac address"
        exit 1
      fi
      mac=$2
      mac_ip=$(arp -n |grep -i "$mac" |awk '{print $1}')
      if [ -z "$mac_ip" ]
      then
        echo " We can't find  ip address with this mac address since it is not on arp table."
      else
        echo " $mac_ip"
      fi
      ;;
    *)
      echo "Unknown operation provided." 1>&2
      discover_help
      exit 1
      ;;
  esac
}


function discover_help {
  echo
  echo "Usage: $BASENAME discover <rpi|wifi|scan|hostinterface|ping|ports ip|ping|ports[ipaddress|url]>"
  echo
  echo "Scans the network provdied and shows the open ports. Can scan for all raspberry pis on the network as well."
  echo
  echo "Example:"
  echo " $BASENAME discover rpi"
  echo "    Detects raspberry pis on the network."
  echo " $BASENAME discover wifi"
  echo "    Detects devices hosting wifi."
  echo " $BASENAME discover scan 192.168.7.149"
  echo "    Performs a network scan of the provided ip address."
  echo " $BASENAME discover scan scanme.nmap.org"
  echo "    Performs a network scan of the provided url."
  echo " $BASENAME discover interface"
  echo "    Displays the host interfaces and routes on the network."
  echo " $BASENAME discover ping 192.168.7.149"
  echo "    Displays servers and devices running on network provided."
  echo " $BASENAME discover ports 192.168.7.149"
  echo "    Displays open ports."
  echo " $BASENAME discover mac b8:29:eb:9f:42:8b "
  echo "    find the ip address of mac address."
  echo
}
