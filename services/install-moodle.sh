#!/bin/bash

function install {
  # create service directory
  mkdir -p /srv/moodle

  # create yml(s)
  {
    echo "version: '2'"
    echo "services:"
    echo "  postgres:"
    echo "    image: arm32v7/postgres:11"
    echo "    environment:"
    echo "    # MAKE SURE THIS ONE SAME WITH THE MOODLE"
    echo "    - POSTGRES_DATABASE=moodle"
    echo "    - POSTGRES_USER=moodle"
    echo "    - POSTGRES_PASSWORD=moodle"
    echo "  moodle:"
    echo "    image: treehouses/moodle:rpi-alpine-latest"
    echo "    ports:"
    echo "      - \"8082:8082\""
    echo "    environment:"
    echo "    - NGINX_PORT=\${NGINX_PORT_VAR}"
    echo "    - MOODOLE_DB_URL=\${MOODOLE_DB_URL_VAR}"
    echo "    - MOODOLE_DB_NAME=\${MOODOLE_DB_NAME_VAR}"
    echo "    - MOODOLE_DB_USER=\${MOODOLE_DB_USER_VAR}"
    echo "    - MOODOLE_DB_PASS=\${MOODOLE_DB_PASS_VAR}"
    echo "    - MOODOLE_DB_PORT=\${MOODOLE_DB_PORT_VAR}"
    echo "    - MOODOLE_MAX_BODY_SIZE=\${MOODOLE_MAX_BODY_SIZE_VAR}"
    echo "    - MOODOLE_BODY_TIMEOUT=\${MOODOLE_BODY_TIMEOUT_VAR}"
  } > /srv/moodle/moodle.yml

  # create .env with default values
  {
    echo "NGINX_PORT_VAR=8082"
    echo "MOODOLE_DB_URL_VAR=postgres"
    echo "MOODOLE_DB_NAME_VAR=moodle"
    echo "MOODOLE_DB_USER_VAR=moodle"
    echo "MOODOLE_DB_PASS_VAR=moodle"
    echo "MOODOLE_DB_PORT_VAR=5432"
    echo "MOODOLE_MAX_BODY_SIZE_VAR=200M"
    echo "MOODOLE_BODY_TIMEOUT_VAR=300s"
  } > /srv/moodle/.env

  # add autorun
  {
    echo "moodle_autorun=true"
    echo
    echo "if [ \"\$moodle_autorun\" = true ]; then"
    echo "  treehouses services moodle up"
    echo "fi"
    echo
    echo
  } > /srv/moodle/autorun
}

# environment var
function uses_env {
  echo true
}

# add supported arm(s)
function supported_arms {
  echo "v7l"
}

# add port(s)
function get_ports {
  echo "8082"
}

# add size (in MB)
function get_size {
  echo "350"
}

# add info
function get_info {
  echo "https://github.com/treehouses/moodole"
  echo
  echo "\"Moodle <https://moodle.org> is a learning platform designed to"
  echo "provide educators, administrators and learners with a single robust,"
  echo "secure and integrated system to create personalised learning"
  echo "environments.\""
}

# add svg icon
function get_icon {
  cat <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" id="Layer_1" x="0px" y="0px" viewBox="0 0 1231.2 315.2" style="enable-background:new 0 0 1231.2 315.2;" xml:space="preserve">
  <g>
    <path style="fill:#F98012;" d="M289.6,309.8V201.5c0-22.6-9.4-34-28-34c-18.7,0-28.1,11.3-28.1,34v108.3h-55.1V201.5 c0-22.6-9.2-34-27.6-34c-18.7,0-28,11.3-28,34v108.3H67.7V195.1c0-23.6,8.2-41.5,24.6-53.6c14.4-10.8,34-16.3,58.6-16.3 c24.9,0,43.3,6.4,55.1,19.2c10.2-12.8,28.7-19.2,55.6-19.2c24.6,0,44.1,5.4,58.5,16.3c16.4,12.1,24.6,30,24.6,53.6v114.7H289.6z"></path>
    <path style="fill:#F98012;" d="M965.1,309.3V0h55.2v309.3H965.1z"></path>
    <path style="fill:#F98012;" d="M894.8,309.3v-18.2c-4.9,6.6-13.3,11.8-25.1,15.8c-10.5,3.6-20.5,5.4-30,5.4 c-26.3,0-47.4-9-63.3-27.1c-15.9-18-23.9-40.4-23.9-67c0-26.3,7.8-48.3,23.4-66c13.8-15.7,36.4-26.6,62.3-26.6 c29.2,0,46.3,11,56.6,23.6V0h53.7v309.3H894.8z M894.8,206.3c0-9.8-4.7-19.3-14-28.3c-9.3-9-19-13.5-28.8-13.5 c-14.1,0-25.3,5.8-33.5,17.2c-7.2,10.2-10.8,22.7-10.8,37.4c0,14.5,3.6,26.8,10.8,36.9c8.2,11.8,19.4,17.7,33.5,17.7 c8.5,0,17.8-4,27.8-12.1c10-8,15-16.3,15-24.9V206.3z"></path>
    <path style="fill:#F98012;" d="M648.6,314.2c-27.9,0-51-8.9-69.2-26.6c-18.2-17.7-27.3-40.5-27.3-68.5c0-27.9,9.1-50.7,27.3-68.4 c18.2-17.7,41.3-26.6,69.2-26.6c27.9,0,51.1,8.9,69.4,26.6c18.4,17.7,27.6,40.6,27.6,68.4c0,27.9-9.2,50.7-27.6,68.5 C699.6,305.3,676.5,314.2,648.6,314.2z M648.6,168.4c-13.3,0-23.5,5-30.7,15.1c-7.1,10.1-10.7,22-10.7,35.9 c0,13.9,3.3,25.6,10,35.1c7.6,10.9,18.1,16.3,31.4,16.3c13.3,0,23.7-5.4,31.4-16.3c7-9.6,10.5-21.3,10.5-35.1 c0-13.9-3.3-25.6-10-35.1C672.8,173.7,662.2,168.4,648.6,168.4z"></path>
    <path style="fill:#F98012;" d="M449.1,314.2c-27.9,0-51-8.9-69.2-26.6c-18.2-17.7-27.3-40.5-27.3-68.5c0-27.9,9.1-50.7,27.3-68.4 c18.2-17.7,41.3-26.6,69.2-26.6c27.9,0,51,8.9,69.4,26.6c18.4,17.7,27.6,40.6,27.6,68.4c0,27.9-9.2,50.7-27.6,68.5 C500.2,305.3,477,314.2,449.1,314.2z M449.1,168.4c-13.3,0-23.5,5-30.7,15.1c-7.1,10.1-10.7,22-10.7,35.9c0,13.9,3.3,25.6,10,35.1 c7.6,10.9,18.1,16.3,31.4,16.3c13.3,0,23.7-5.4,31.4-16.3c7-9.6,10.5-21.3,10.5-35.1c0-13.9-3.3-25.6-10-35.1 C473.4,173.7,462.8,168.4,449.1,168.4z"></path>
    <path style="fill:#F98012;" d="M1085.6,235.9c1.2,13.1,18.2,41.4,46.3,41.4c27.3,0,40.2-15.8,40.9-22.2l58.1-0.5 c-6.3,19.4-32.1,60.6-100,60.6c-28.2,0-54.1-8.8-72.6-26.3c-18.5-17.6-27.8-40.5-27.8-68.7c0-29.2,9.3-52.4,27.8-69.7 c18.6-17.2,42.6-25.9,72.2-25.9c32.2,0,57.3,10.7,75.3,32c16.7,19.7,25.1,46.1,25.1,79.3H1085.6z M1175.7,201.9 c-2.3-11.8-7.2-21.5-14.8-29.1c-8.6-8.2-18.4-12.3-29.6-12.3c-11.5,0-21.1,3.9-28.8,11.8c-7.7,7.9-12.9,17.7-15.5,29.6H1175.7z"></path>
    <path style="fill:#333333;" d="M174.7,116.9l54.7-40l-0.7-2.4C130,86.6,85.1,95.2,0,144.5l0.8,2.2l6.8,0.1 c-0.6,6.8-1.7,23.6-0.3,49c-9.4,27.3-0.2,45.9,8.4,66.1c1.4-21,1.2-44-5.2-66.9c-1.3-25.1-0.2-41.7,0.4-48.1l56.4,0.5 c0,0-0.4,17,1.7,33.1c50.4,17.7,101.1-0.1,128-43.7C189.4,128.3,174.7,116.9,174.7,116.9z"></path>
  </g>
</svg>
EOF
}
