{pkgs, ...}:
pkgs.writeShellScriptBin "swww-random" ''

   if [[ $# -lt 1 ]] || [[ ! -d $1   ]]; then
  	echo "Usage:
  	$0 <dir containing images>"
  	exit 1
  fi

  # Edit below to control the images transition
  export SWWW_TRANSITION_FPS=60
  export SWWW_TRANSITION_STEP=2

  # This controls (in seconds) when to switch to the next image
  INTERVAL=900

  while true; do
  	find "$1" -type f \
  		| while read -r img; do
  			echo "$((RANDOM % 1000)):$img"
  		done \
  		| sort -n | cut -d':' -f2- \
  		| while read -r img; do
  			swww img --transition-type random --resize crop "$img"
  			sleep $INTERVAL
  		done
  done
''
