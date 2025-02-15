#!/bin/bash

function install {
  # create service directory
  mkdir -p /srv/pihole
  service dnsmasq stop
  touch /var/log/pihole.log

  # create yml(s)
  {
    echo "version: \"3\""
    echo
    echo "# https://github.com/pi-hole/docker-pi-hole/blob/master/README.md"
    echo
    echo "services:"
    echo "  pihole:"
    echo "    container_name: pihole"
    echo "    image: pihole/pihole:4.3.2-1_armhf"
    echo "    # For DHCP it is recommended to remove these ports and instead add: network_mode: \"host\""
    echo "    ports:"
    echo "      - \"53:53/tcp\""
    echo "      - \"53:53/udp\""
    echo "      - \"67:67/udp\""
    echo "      - \"8053:80/tcp\""
    echo "      - \"443:443/tcp\""
    echo "    environment:"
    echo "      TZ: \${TZ_VAR}"
    echo "      WEBPASSWORD: \${WEBPASSWORD_VAR}"
    echo "    # Volumes store your data between container upgrades"
    echo "    volumes:"
    echo "      - './etc-pihole/:/etc/pihole/'"
    echo "      - './etc-dnsmasq.d/:/etc/dnsmasq.d/'"
    echo "    # - './var-log/pihole.log:/var/log/pihole.log'"
    echo "    dns:"
    echo "      - 127.0.0.1"
    echo "      - 1.1.1.1"
    echo "    # Recommended but not required (DHCP needs NET_ADMIN)"
    echo "    #   https://github.com/pi-hole/docker-pi-hole#note-on-capabilities"
    echo "    cap_add:"
    echo "      - NET_ADMIN"
    echo "    # restart: unless-stopped"
  } > /srv/pihole/pihole.yml

  # create .env with default values
  {
    echo "TZ_VAR=America/New_York"
    echo "WEBPASSWORD_VAR=piholepass"
  } > /srv/pihole/.env

  # add autorun
  {
    echo "pihole_autorun=true"
    echo
    echo "if [ \"\$pihole_autorun\" = true ]; then"
    echo "  service dnsmasq stop"
    echo "  treehouses services pihole up"
    echo "fi"
    echo
    echo
  } > /srv/pihole/autorun
}

# environment var
function uses_env {
  echo true
}

# add supported arm(s)
function supported_arms {
  echo "v7l"
  echo "v6l"
}

# add port(s)
function get_ports {
  echo "8053"
}

# add size (in MB)
function get_size {
  echo "350"
}

# add info
function get_info {
  echo "https://github.com/pi-hole/docker-pi-hole"
  echo
  echo "\"The Pi-hole® is a DNS sinkhole that protects your devices from"
  echo "unwanted content, without installing any client-side software.\""
}

# add svg icon
function get_icon {
  cat <<EOF
<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<svg height="380" viewBox="0 0 258.30542 380.00004" width="258.30542"
  xmlns="http://www.w3.org/2000/svg"
  xmlns:xlink="http://www.w3.org/1999/xlink">
  <linearGradient id="a" gradientUnits="userSpaceOnUse" x1="7.925993107" x2="204.05312733504" y1="58.61002299265" y2="58.61002299265">
    <stop offset="0" stop-color="#12b212" />
    <stop offset="1" stop-color="#0f0" />
  </linearGradient>
  <g stroke-width="2.924652">
    <path d="m106.92545 116.78134c-47.437847-5.05965-95.226656-40.915875-98.9994567-116.78134 73.6134837 0 112.9792967 43.57731 116.7813467 112.62834 13.92134-82.826139 79.17032-73.116296 79.17032-73.116296 3.10013 46.94066-35.44678 75.397526-79.17032 77.766486-12.28354-25.883164-85.867778-89.377353-85.867778-89.377353a.20472562.20472562 0 0 0 -.321712.233972s71.01054 61.856384 68.4076 88.646191" fill="url(#a)" />
    <path d="m129.15281 380c-4.59171-.26322-47.437854-1.90103-50.040794-50.0408-2.10575-29.24651 20.998994-50.8012 20.998994-79.19956-5.235122-70.80582-100.11082279-62.03187-100.11082279 0a58.317555 58.317555 0 0 0 17.05071979 41.35457l70.688831 70.71808a58.317555 58.317555 0 0 0 41.354572 17.05072" fill="#980200" />
    <path d="m258.30543 250.78888c-.26322 4.59171-1.90103 47.43785-50.0408 50.04079-29.24651 2.10575-50.83044-20.999-79.19956-20.999-70.805821 5.23513-62.031866 100.08159 0 100.08159a58.317555 58.317555 0 0 0 41.35457-17.05072l70.74733-70.68884a58.317555 58.317555 0 0 0 17.05072-41.35457" fill="#f00" />
    <path d="m129.15281 121.63626c4.5917.26322 47.43785 1.90103 50.04079 50.04079 2.10575 29.24652-20.999 50.8012-20.999 79.19957 5.23512 70.80582 100.08158 62.03187 100.08158 0a58.317555 58.317555 0 0 0 -17.05072-41.35457l-70.71808-70.74733a58.317555 58.317555 0 0 0 -41.35457-17.05072" fill="#980200" />
    <path d="m.23415935 250.78888c.26321865-4.5917 1.90102365-47.43785 50.04079065-50.04079 29.246517-2.10575 50.83045 20.999 79.19957 20.999 70.80582-5.32286 62.03186-100.08158 0-100.08158a58.317555 58.317555 0 0 0 -41.354577 17.05072l-70.747325 70.71808a58.317555 58.317555 0 0 0 -17.0507191 41.35457" fill="#f00" />
  </g>
</svg>
EOF
}
