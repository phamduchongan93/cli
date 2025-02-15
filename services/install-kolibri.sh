#!/bin/bash

function install {
  # create service directory
  mkdir -p /srv/kolibri

  # create yml(s)
  {
    echo "services:"
    echo "  kolibri:"
    echo "    image: treehouses/kolibri"
    echo "    ports:"
    echo "      - \"8080:8080\""
    echo "    volumes:"
    echo "      - \"/srv/kolibri:/root/.kolibri\""
    echo "version: \"2\""
  } > /srv/kolibri/kolibri.yml

  # add autorun
  {
    echo "kolibri_autorun=true"
    echo
    echo "if [ \"\$kolibri_autorun\" = true ]; then"
    echo "  treehouses services kolibri up"
    echo "fi"
    echo
    echo
  } > /srv/kolibri/autorun
}

# environment var
function uses_env {
  echo false
}

# add supported arm(s)
function supported_arms {
  echo "v7l"
}

# add port(s)
function get_ports {
  echo "8080"
}

# add size (in MB)
function get_size {
  echo "650"
}

# add info
function get_info {
  echo "https://github.com/treehouses/kolibri"
  echo
  echo "\"Kolibri is the offline learning platform from Learning Equality.\""
}

# add svg icon
function get_icon {
  cat <<EOF
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 234.6 193.6">
  <path fill="#99B1A3" d="M113.7 35.5l7.7 6.7L127 34z"/>
  <path fill="#C7E1D1" d="M131.9 41.9L127 34l-5.6 8.2z"/>
  <path fill="#87AFA6" d="M113.7 35.5l-9.8 11.2 17.5-4.5z"/>
  <path fill="#B8C7C1" d="M101.6 59.6l19.8-17.4-17.5 4.5z"/>
  <path fill="#ABDCD2" d="M132.9 60.7l-1-18.8-10.5.3z"/>
  <path fill="#BDD6CE" d="M122.7 63.5l-1.3-21.3-19.8 17.4z"/>
  <path fill="#A0D0C6" d="M132.9 60.7l-10.2 2.8-1.3-21.3z"/>
  <path fill="#7C8886" d="M99.6 65.5l23.1-2-21.1-3.9z"/>
  <path fill="#91AAAE" d="M122.7 63.5L92.8 76.3l6.8-10.8z"/>
  <path fill="#7BAEA9" d="M118.5 81l-25.7-4.7 29.9-12.8z"/>
  <path fill="#C8E8E1" d="M132.9 60.7L118.5 81l4.2-17.5z"/>
  <path fill="#DBEFE5" d="M140.6 77.9L118.5 81l14.4-20.3z"/>
  <path fill="#9BC8D1" d="M117.8 117.3l.7-36.3-25.7-4.7z"/>
  <path fill="#A1AEBC" d="M93.8 112.6l24 4.7-25-41z"/>
  <path fill="#C5E0DF" d="M140.6 77.9l-22.8 39.4.7-36.3z"/>
  <path fill="#DAE7E7" d="M140.6 112.9l-22.8 4.4 22.8-39.4z"/>
  <path fill="#B8BAC8" d="M117.7 128.9l22.9-16-22.8 4.4z"/>
  <path fill="#8E9BAF" d="M93.8 112.6l23.9 16.3.1-11.6z"/>
  <path fill="#8B7F96" d="M108.2 135.3l9.5-6.4-23.9-16.3z"/>
  <path fill="#766C81" d="M126.9 135.3l-9.2-6.4-9.5 6.4z"/>
  <path fill="#97A2B1" d="M126.9 135.3l-9.2-6.4 22.9-16z"/>
  <path fill="#9F96AE" d="M118.6 141.9l8.3-6.6h-18.7z"/>
  <path fill="#9792B5" d="M93.5 172.8l25.1-30.9-10.4-6.6z"/>
  <path fill="#ABA0CB" d="M112.2 186.2l-18.7-13.3 25.1-31z"/>
  <path fill="#C3B1D6" d="M124.2 186.1l-12 .1 6.4-44.3z"/>
  <path fill="#DCC0DD" d="M142.6 173l-18.4 13.1-5.6-44.2z"/>
  <path fill="#B8CEE7" d="M126.9 135.3l15.7 37.7-24-31.1z"/>
  <path fill="#A4B398" d="M176.2 7.4l-34.8 16.8-.1 6.2z"/>
  <path fill="#7E836C" d="M141.4 24.2l-.1 6.2-9.4 11.5z"/>
  <path fill="#A2AA97" d="M127 34l14.4-9.8-9.5 17.7z"/>
  <g>
    <path fill="#7AA9AE" d="M149.8 68.7l9.2-8.8-2.9 12.4-6.3-3.6"/>
    <path fill="#768E98" d="M168.1 67.9l-9.1-8-2.9 12.4z"/>
    <path fill="#DAE6F3" d="M160.8 77.9l-4.7-5.6 12-4.4z"/>
    <path fill="#7FA6B0" d="M173.3 77.2l-5.2-9.3-7.3 10z"/>
    <path fill="#7B8B9B" d="M163 84.2l-2.2-6.3 12.5-.7z"/>
    <path fill="#D9DFF1" d="M175.2 87.8l-1.9-10.6-10.3 7z"/>
    <path fill="#83A3B1" d="M163.1 91l-.1-6.8 12.2 3.6z"/>
    <path fill="#818A9F" d="M173.3 98.1l1.9-10.3-12.1 3.2z"/>
    <path fill="#D8D8ED" d="M161.2 96.7l1.9-5.7 10.2 7.1z"/>
    <path fill="#889DB2" d="M168.4 107.2l4.9-9.1-12.1-1.4z"/>
    <path fill="#8289A0" d="M157.1 102.7l4.1-6 7.2 10.5z"/>
    <path fill="#D7D2E9" d="M159 115.3l9.4-8.1-11.3-4.5z"/>
    <path fill="#869FB3" d="M149.8 106.5l7.3-3.8 1.9 12.6z"/>
    <g>
      <path fill="#6B949B" d="M190.6 39.6l-6.2-3.8 9.3-8.9z"/>
      <path fill="#56777D" d="M202.6 33.8l-8.9-6.9-3.1 12.7z"/>
      <path fill="#94C7D0" d="M197.4 45.4l-6.8-5.8 12-5.8z"/>
      <path fill="#70939D" d="M209.8 41.4l-7.2-7.6-5.2 11.6z"/>
      <path fill="#5D7581" d="M203.3 52.4l-5.9-7 12.4-4z"/>
      <path fill="#98C1D0" d="M216.1 49.7l-6.3-8.3-6.5 11z"/>
      <path fill="#7490A1" d="M207.4 58.8l-4.1-6.4 12.8-2.7z"/>
      <path fill="#637487" d="M220.6 58.3l-4.5-8.6-8.7 9.1z"/>
      <path fill="#9BBACF" d="M211.1 67.1l-3.7-8.3 13.2-.5z"/>
      <path fill="#7C8CA6" d="M224.3 68.6l-3.7-10.3-9.5 8.8z"/>
      <path fill="#6D748F" d="M214 77.7l-2.9-10.6 13.2 1.5z"/>
      <path fill="#A0B1D0" d="M226.4 79.8l-2.1-11.2-10.3 9.1z"/>
      <path fill="#7A7296" d="M226.9 91.3l-.5-11.5-11.5 6z"/>
      <path fill="#8389AA" d="M214 77.7l.9 8.1 11.5-6z"/>
      <path fill="#A3ABCF" d="M214.4 95.8l.5-10 12 5.5z"/>
      <path fill="#8C85AE" d="M225.8 101.5l1.1-10.2-12.5 4.5z"/>
      <path fill="#7E729B" d="M212.6 104.6l1.8-8.8 11.4 5.7z"/>
      <path fill="#A6A2CD" d="M223.5 110.4l2.3-8.9-13.2 3.1z"/>
      <path fill="#8F84AE" d="M209.8 112.8l2.8-8.2 10.9 5.8z"/>
      <path fill="#8571A0" d="M219.4 120.5l4.1-10.1-13.7 2.4z"/>
      <path fill="#A79FCE" d="M206 119.9l3.8-7.1 9.6 7.7z"/>
      <path fill="#957FB3" d="M214 129.8l5.4-9.3-13.4-.6z"/>
      <path fill="#8670A1" d="M201.9 125.8l4.1-5.9 8 9.9z"/>
      <path fill="#AA99C9" d="M207.8 137.3l6.2-7.5-12.1-4z"/>
      <path fill="#9480B3" d="M196.4 131.5l5.5-5.7 5.9 11.5z"/>
      <path fill="#8E70A7" d="M202.1 143.1l5.7-5.8-11.4-5.8z"/>
      <path fill="#A99ACA" d="M191.3 135.9l5.1-4.4 5.7 11.6z"/>
      <path fill="#987FB4" d="M194.2 148.6l7.9-5.5-10.6-7.2z"/>
      <path fill="#866FA0" d="M185.3 140l6.2-4.1 2.7 12.7z"/>
    </g>
    <g>
      <path fill="#8AB7C4" d="M182.9 46.9l-5.8-4.1-3 11.5z"/>
      <path fill="#A5DDE9" d="M178.6 58.3l-4.5-4 8.8-7.4z"/>
      <path fill="#6A909A" d="M189.8 53.3l-6.9-6.4-4.3 11.4z"/>
      <path fill="#87BCC4" d="M183.1 63.2l-4.5-4.9 11.2-5z"/>
      <path fill="#A7CCE5" d="M195.7 61.7l-5.9-8.4-6.7 9.9z"/>
      <path fill="#708E9D" d="M187.4 70.4l-4.3-7.2 12.6-1.5z"/>
      <path fill="#A7D5E7" d="M200.1 71.6l-4.4-9.9-8.3 8.7z"/>
      <path fill="#8FB0C5" d="M190.1 78.4l-2.7-8 12.7 1.2z"/>
      <path fill="#778AA0" d="M202.1 82l-12-3.6 10-6.8z"/>
      <path fill="#A7CCE5" d="M191.1 88.1l-1-9.7 12 3.6z"/>
      <path fill="#94A7C6" d="M201.8 94.3l-10.7-6.2 11-6.1z"/>
      <path fill="#7E88A6" d="M189.7 97.2l1.4-9.1 10.7 6.2z"/>
      <path fill="#AAC1E3" d="M199.2 104.6l-9.5-7.4 12.1-2.9z"/>
      <path fill="#95A5C5" d="M186.8 104.3l2.9-7.1 9.5 7.4z"/>
      <path fill="#8485A8" d="M194.7 113.8l4.5-9.2-12.4-.3z"/>
      <path fill="#ABC0E3" d="M183.3 110.4l3.5-6.1 7.9 9.5z"/>
      <path fill="#9A9FC7" d="M188.9 121.3l5.8-7.5-11.4-3.4z"/>
      <path fill="#8585A9" d="M178.9 115.3l4.4-4.9 5.6 10.9z"/>
      <path fill="#9A9FC7" d="M182.8 126.9l6.1-5.6-10-6z"/>
      <path fill="#99A2C7" d="M173.3 119.8l5.6-4.5 3.9 11.6z"/>
      <path fill="#AEB8DE" d="M176.2 131.4l6.6-4.5-9.5-7.1z"/>
      <path fill="#ABBFE3" d="M167.2 123.2l6.1-3.4 2.9 11.6z"/>
      <g>
        <path fill="#6A909A" d="M174.1 54.3l-5.7-3.2 8.7-8.3z"/>
      </g>
    </g>
  </g>
  <g>
    <path fill="#7AA9AE" d="M83 68.7l-9.1-8.8 2.8 12.4 6.3-3.6"/>
    <path fill="#768E98" d="M64.8 67.9l9.1-8 2.8 12.4z"/>
    <path fill="#DAE6F3" d="M72 77.9l4.7-5.6-11.9-4.4z"/>
    <path fill="#7FA6B0" d="M59.6 77.2l5.2-9.3 7.2 10z"/>
    <path fill="#7B8B9B" d="M69.8 84.2l2.2-6.3-12.4-.7z"/>
    <path fill="#D9DFF1" d="M57.7 87.8l1.9-10.6 10.2 7z"/>
    <path fill="#83A3B1" d="M69.8 91v-6.8l-12.1 3.6z"/>
    <path fill="#818A9F" d="M59.5 98.1l-1.8-10.3L69.8 91z"/>
    <path fill="#D8D8ED" d="M71.6 96.7L69.8 91l-10.3 7.1z"/>
    <path fill="#889DB2" d="M64.4 107.2l-4.9-9.1 12.1-1.4z"/>
    <path fill="#8289A0" d="M75.8 102.7l-4.2-6-7.2 10.5z"/>
    <path fill="#D7D2E9" d="M73.8 115.3l-9.4-8.1 11.4-4.5z"/>
    <path fill="#869FB3" d="M83.1 106.5l-7.3-3.8-2 12.6z"/>
    <g>
      <path fill="#6B949B" d="M42.3 39.6l6.1-3.8-9.2-8.9z"/>
      <path fill="#56777D" d="M30.3 33.8l8.9-6.9 3.1 12.7z"/>
      <path fill="#94C7D0" d="M35.5 45.4l6.8-5.8-12-5.8z"/>
      <path fill="#70939D" d="M23 41.4l7.3-7.6 5.2 11.6z"/>
      <path fill="#5D7581" d="M29.6 52.4l5.9-7-12.5-4z"/>
      <path fill="#98C1D0" d="M16.8 49.7l6.2-8.3 6.6 11z"/>
      <path fill="#7490A1" d="M25.5 58.8l4.1-6.4-12.8-2.7z"/>
      <path fill="#637487" d="M12.2 58.3l4.6-8.6 8.7 9.1z"/>
      <path fill="#9BBACF" d="M21.8 67.1l3.7-8.3-13.3-.5z"/>
      <path fill="#7C8CA6" d="M8.5 68.6l3.7-10.3 9.6 8.8z"/>
      <path fill="#6D748F" d="M18.9 77.7l2.9-10.6-13.3 1.5z"/>
      <path fill="#A0B1D0" d="M6.4 79.8l2.1-11.2 10.4 9.1z"/>
      <path fill="#7A7296" d="M6 91.3l.4-11.5 11.5 6z"/>
      <path fill="#8389AA" d="M18.9 77.7l-1 8.1-11.5-6z"/>
      <path fill="#A3ABCF" d="M18.4 95.8l-.5-10L6 91.3z"/>
      <path fill="#8C85AE" d="M7.1 101.5L6 91.3l12.4 4.5z"/>
      <path fill="#7E729B" d="M20.2 104.6l-1.8-8.8-11.3 5.7z"/>
      <path fill="#A6A2CD" d="M9.3 110.4l-2.2-8.9 13.1 3.1z"/>
      <path fill="#8F84AE" d="M23 112.8l-2.8-8.2-10.9 5.8z"/>
      <path fill="#8571A0" d="M13.5 120.5l-4.2-10.1 13.7 2.4z"/>
      <path fill="#A79FCE" d="M26.9 119.9l-3.9-7.1-9.5 7.7z"/>
      <path fill="#957FB3" d="M18.9 129.8l-5.4-9.3 13.4-.6z"/>
      <path fill="#8670A1" d="M31 125.8l-4.1-5.9-8 9.9z"/>
      <path fill="#AA99C9" d="M25.1 137.3l-6.2-7.5 12.1-4z"/>
      <path fill="#9480B3" d="M36.4 131.5l-5.4-5.7-5.9 11.5z"/>
      <path fill="#8E70A7" d="M30.8 143.1l-5.7-5.8 11.3-5.8z"/>
      <path fill="#A99ACA" d="M41.5 135.9l-5.1-4.4-5.6 11.6z"/>
      <path fill="#987FB4" d="M38.6 148.6l-7.8-5.5 10.6-7.2z"/>
      <path fill="#866FA0" d="M47.6 140l-6.2-4.1-2.8 12.7z"/>
    </g>
    <g>
      <path fill="#8AB7C4" d="M50 46.9l5.7-4.1 3.1 11.5z"/>
      <path fill="#A5DDE9" d="M54.2 58.3l4.6-4-8.8-7.4z"/>
      <path fill="#6A909A" d="M43.1 53.3l6.9-6.4 4.2 11.4z"/>
      <path fill="#87BCC4" d="M49.8 63.2l4.4-4.9-11.1-5z"/>
      <path fill="#A7CCE5" d="M37.1 61.7l6-8.4 6.7 9.9z"/>
      <path fill="#708E9D" d="M45.5 70.4l4.3-7.2-12.7-1.5z"/>
      <path fill="#A7D5E7" d="M32.7 71.6l4.4-9.9 8.4 8.7z"/>
      <path fill="#8FB0C5" d="M42.8 78.4l2.7-8-12.8 1.2z"/>
      <path fill="#778AA0" d="M30.8 82l12-3.6-10.1-6.8z"/>
      <path fill="#A7CCE5" d="M41.8 88.1l1-9.7-12 3.6z"/>
      <path fill="#94A7C6" d="M31.1 94.3l10.7-6.2-11-6.1z"/>
      <path fill="#7E88A6" d="M43.2 97.2l-1.4-9.1-10.7 6.2z"/>
      <path fill="#AAC1E3" d="M33.6 104.6l9.6-7.4-12.1-2.9z"/>
      <path fill="#95A5C5" d="M46.1 104.3l-2.9-7.1-9.6 7.4z"/>
      <path fill="#8485A8" d="M38.2 113.8l-4.6-9.2 12.5-.3z"/>
      <path fill="#ABC0E3" d="M49.6 110.4l-3.5-6.1-7.9 9.5z"/>
      <path fill="#9A9FC7" d="M43.9 121.3l-5.7-7.5 11.4-3.4z"/>
      <path fill="#8585A9" d="M53.9 115.3l-4.3-4.9-5.7 10.9z"/>
      <path fill="#9A9FC7" d="M50.1 126.9l-6.2-5.6 10-6z"/>
      <path fill="#99A2C7" d="M59.5 119.8l-5.6-4.5-3.8 11.6z"/>
      <path fill="#AEB8DE" d="M56.7 131.4l-6.6-4.5 9.4-7.1z"/>
      <path fill="#ABBFE3" d="M65.7 123.2l-6.2-3.4-2.8 11.6z"/>
      <g>
        <path fill="#6A909A" d="M58.8 54.3l5.7-3.2-8.8-8.3z"/>
      </g>
    </g>
  </g>
</svg>
EOF
}
