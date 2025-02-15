#!/bin/bash

function install {
  # create service directory
  mkdir -p /srv/turtleblocksjs

  # create yml(s)
  {
    echo "version: '3'"
    echo "services:"
    echo "  turtleblocksjs:"
    echo "    image: treehouses/turtleblocksjs"
    echo "    ports:"
    echo "      - 8087:80"
  } > /srv/turtleblocksjs/turtleblocksjs.yml

  # add autorun
  {
    echo "turtleblocksjs_autorun=true"
    echo
    echo "if [ \"\$turtleblocksjs_autorun\" = true ]; then"
    echo "  treehouses services turtleblocksjs up"
    echo "fi"
    echo
    echo
  } > /srv/turtleblocksjs/autorun
}

# environment var
function uses_env {
  echo false
}

# add supported arm(s)
function supported_arms {
  echo "v7l"
  echo "v6l"
}

# add port(s)
function get_ports {
  echo "8087"
}

# add size (in MB)
function get_size {
  echo "214"
}

# add info
function get_info {
  echo "https://github.com/treehouses/turtleblocksjs"
  echo
  echo "Turtle Blocks is an activity with a Logo-inspired graphical \"turtle\""
  echo "that draws colorful art based on snap-together visual programming elements."
}

# add svg icon
function get_icon {
  cat <<EOF
<svg xmlns="http://www.w3.org/2000/svg" version="1.1" width="100" height="100" viewBox="0 0 55 55" style="fill:#ffffff;stroke:#000000;stroke-width:1.5;stroke-linecap:round;stroke-linejoin:round">
  <path d="m 53.481267,28.305392 c -0.209367,-1.54431 -0.683684,-3.963142 -2.434581,-4.798755 -1.109828,-0.528975 -7.180267,0.535648 -11.31572,0.588453 0.144519,2.488312 -0.778093,5.155238 -3.939898,9.809475 -1.886409,3.241636 -10.411329,3.515578 -10.800417,3.494271 L 1.4324287,37.296302 c 1.1691172,1.648067 3.6860922,3.761922 6.4671469,4.112101 -0.7457525,0.657744 -3.0978837,3.276679 -3.2729735,6.681202 -0.00463,0.07596 0.00185,0.409469 0,0.409469 l 7.4343649,0 c 0.254761,-1.852802 0.9755,-5.273073 2.895929,-6.51445 1.432215,-0.0083 2.73844,-0.166752 3.757481,-0.1158 2.352131,0.116727 7.112904,-0.04725 10.314545,-0.276067 0.02409,0.01297 0.03891,0.273288 0.06392,0.28811 2.092739,1.107049 2.853314,4.766332 3.119191,6.619133 l 7.434366,0 c -9.27e-4,0 0.0056,-0.333504 9.26e-4,-0.409469 -0.173237,-3.361908 -3.144204,-6.569107 -4.146569,-7.513109 2.836638,-1.260832 7.123094,-5.459279 8.243113,-6.678423 0.294595,-0.318681 1.391453,-1.678638 2.22614,-2.303032 0.782809,-0.584558 3.337822,-0.893976 4.296647,-0.935664 0.960677,-0.04169 3.004317,0.407616 3.004317,0.407616 0,0 0.306638,-2.060315 0.210294,-2.762527 z" style="stroke-width:1.92499995;stroke-miterlimit:4;stroke-dasharray:none" />
  <circle cx="59.484001" cy="37.223999" r="1.109" transform="matrix(0.92640065,0,0,0.92640065,-6.9147758,-8.3090122)" style="stroke-width:1.18739116;stroke-miterlimit:4;stroke-dasharray:none" />
  <g transform="matrix(1.0320878,0,0,0.99904752,-0.184081,0.02418615)">
    <path d="m 10.571891,36.919704 5.798216,-14.14899 -5.012466,-5.534784 c -1.4233734,1.718282 -2.480637,3.711241 -2.8150389,5.046387 -0.451356,1.79814 0,7.96332 0.5856365,10.1437 l -2.8182215,4.571955 4.0512949,-0.148486 z" style="fill:#186dee;fill-opacity:1;stroke-width:1.92499995;stroke-miterlimit:4;stroke-dasharray:none" />
    <path d="m 15.827351,23.138991 12.64663,-0.323916 3.118775,-3.975828 c -0.869792,-1.299255 -2.013342,-2.558133 -3.475701,-3.315433 -4.355888,-2.256648 -8.269084,-3.109957 -13.966045,-0.280847 -1.311618,0.652319 -1.961058,1.152293 -2.772806,1.934717 z" style="fill:#ffb504;fill-opacity:1;stroke-width:1.92499995;stroke-miterlimit:4;stroke-dasharray:none" />
    <path d="M 28.827609,22.944786 16.350738,23.050047 10.704106,37.127591 29.0947,37.332873 c 3.504125,-0.134986 4.499519,-1.032283 5.462399,-1.962597 z" style="fill:#009a57;fill-opacity:1;stroke-width:1.92499995;stroke-miterlimit:4;stroke-dasharray:none" />
    <path d="m 34.981054,23.766238 c 0,0 -2.011809,-2.505097 -3.098182,-4.441418 l -2.902193,3.701262 5.37511,12.556508 c 0.907909,-0.615531 2.256487,-2.511987 2.898435,-3.491812 2.418679,-3.238079 2.693228,-7.998903 2.693228,-7.998903 z" style="fill:#d8432e;fill-opacity:1;stroke-width:1.92499995;stroke-miterlimit:4;stroke-dasharray:none" />
  </g>
</svg>
EOF
}
