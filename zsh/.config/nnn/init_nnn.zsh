export NNN_SRC=$MS_SL_REPO/nnn
export NNN_CFG_DIR=${XDG_CONFIG_HOME:-$HOME/.config}/nnn

export NNN_TMPFILE="$NNN_CFG_DIR/.lastd"
export NNN_SEL="$NNN_CFG_DIR/.sel"
export NNN_FIFO="$NNN_CFG_DIR/nnn.fifo"
export NNN_OPTS="ecGiHU"

n() {
  if [ -n "${NNNLVL}" ] && [ "${NNNLVL:-0}" -ge 1 ]; then
    echo "nnn is already running"
  elif [[ -x "$NNN_SRC/nnn" ]]; then
    "$NNN_SRC/nnn" "$@"

    if [[ -f "$NNN_TMPFILE" ]]; then
      . "$NNN_TMPFILE"
      cat "$NNN_TMPFILE"
      rm -f "$NNN_TMPFILE" > /dev/null
    fi
  fi
}
