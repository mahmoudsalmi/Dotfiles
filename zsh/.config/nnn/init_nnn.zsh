export NNN_CFG_DIR=${XDG_CONFIG_HOME:-$HOME/.config}/nnn

export NNN_TMPFILE="$NNN_CFG_DIR/.lastd"
export NNN_SEL="$NNN_CFG_DIR/.sel"
export NNN_FIFO="$NNN_CFG_DIR/nnn.fifo"
# export NNN_OPTS="ecGiHU"
export NNN_OPTS="eciHU"

n() {
  if [ -n "${NNNLVL}" ] && [ "${NNNLVL:-0}" -ge 1 ]; then
    echo "nnn is already running"
  else
    nnn "$@"

    if [[ -f "$NNN_TMPFILE" ]]; then
      . "$NNN_TMPFILE"
      cat "$NNN_TMPFILE"
      rm -f "$NNN_TMPFILE" > /dev/null
    fi
  fi
}
