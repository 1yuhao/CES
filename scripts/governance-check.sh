#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
RULES_FILE="$ROOT_DIR/codex/rules/default.rules"

check() {
  local expected="$1"
  shift
  local output
  output="$(codex execpolicy check --rules "$RULES_FILE" -- "$@")"
  echo "$output"
  if [[ "$output" != *"\"decision\":\"$expected\""* ]]; then
    echo "Expected decision '$expected' but got different result for command: $*" >&2
    exit 1
  fi
}

echo "[governance-check] validating execpolicy rules..."
check allow git status
check prompt git push
check forbidden git push --force
check forbidden git clean -fd
check forbidden git reset --hard
echo "[governance-check] all checks passed."
