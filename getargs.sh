# Named args
declare -A args=()

#Positional args
args_r=()

parse_args() {
  local name
  local value
  local length

  while [ $# -gt 0 ]; do
    local arg="$1"
    shift

    if [[ "${arg}" != --* ]]; then
      args_r+=("${arg}")
      continue
    fi

    name="${arg%=*}"
    name="${name:2}"

    length=${#name}
    length=$((length+3))

    value="${arg:${length}}"
    if [ -z "${value}" ]; then
      value=true
    fi

    args["${name}"]="${value}"
  done

  readonly args
  readonly args_r
}

parse_args $@