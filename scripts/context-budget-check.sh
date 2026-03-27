#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

DEFAULT_MAX_TOKENS=3000
WARM_MAX_TOKENS=2500
COMBINED_MAX_TOKENS=5000

default_files=(
  "$ROOT_DIR/MEMORY.md"
  "$ROOT_DIR/memory/hot.md"
)

warm_files=(
  "$ROOT_DIR/memory/warm/requirements.md"
  "$ROOT_DIR/memory/warm/change-log.md"
)

ceil_div4() {
  local bytes="$1"
  echo $(( (bytes + 3) / 4 ))
}

file_stats() {
  local file="$1"
  local lines bytes est
  lines="$(wc -l < "$file" | tr -d ' ')"
  bytes="$(wc -c < "$file" | tr -d ' ')"
  est="$(ceil_div4 "$bytes")"
  echo "$lines $bytes $est"
}

sum_est_tokens() {
  local total=0
  for file in "$@"; do
    local stats est
    stats="$(file_stats "$file")"
    est="$(echo "$stats" | awk '{print $3}')"
    total=$((total + est))
  done
  echo "$total"
}

print_group() {
  local title="$1"
  shift
  echo "[context-budget] $title"
  for file in "$@"; do
    if [[ ! -f "$file" ]]; then
      echo "Missing file: $file" >&2
      exit 1
    fi
    local stats lines bytes est
    stats="$(file_stats "$file")"
    lines="$(echo "$stats" | awk '{print $1}')"
    bytes="$(echo "$stats" | awk '{print $2}')"
    est="$(echo "$stats" | awk '{print $3}')"
    echo "  - $(basename "$file"): lines=$lines bytes=$bytes est_tokens=$est"
  done
}

print_group "default load set" "${default_files[@]}"
default_total="$(sum_est_tokens "${default_files[@]}")"
echo "[context-budget] default_total_est_tokens=$default_total limit=$DEFAULT_MAX_TOKENS"
if (( default_total > DEFAULT_MAX_TOKENS )); then
  echo "Default context budget exceeded." >&2
  exit 1
fi

print_group "warm files (individual target <= $WARM_MAX_TOKENS)" "${warm_files[@]}"
for file in "${warm_files[@]}"; do
  est="$(file_stats "$file" | awk '{print $3}')"
  if (( est > WARM_MAX_TOKENS )); then
    echo "Warm file budget exceeded: $(basename "$file") est_tokens=$est" >&2
    exit 1
  fi
done

combined_requirements_total=$((default_total + $(file_stats "$ROOT_DIR/memory/warm/requirements.md" | awk '{print $3}')))
combined_changelog_total=$((default_total + $(file_stats "$ROOT_DIR/memory/warm/change-log.md" | awk '{print $3}')))
echo "[context-budget] default+requirements_est_tokens=$combined_requirements_total limit=$COMBINED_MAX_TOKENS"
echo "[context-budget] default+change-log_est_tokens=$combined_changelog_total limit=$COMBINED_MAX_TOKENS"

if (( combined_requirements_total > COMBINED_MAX_TOKENS )); then
  echo "Combined context budget exceeded for requirements path." >&2
  exit 1
fi
if (( combined_changelog_total > COMBINED_MAX_TOKENS )); then
  echo "Combined context budget exceeded for change-log path." >&2
  exit 1
fi

echo "[context-budget-check] all checks passed."
