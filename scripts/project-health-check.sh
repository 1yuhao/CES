#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

run_core() {
  local name="$1"
  shift
  echo "[project-health][core] $name..."
  "$@"
}

run_advisory() {
  local name="$1"
  shift
  echo "[project-health][advisory] $name..."
  if "$@"; then
    :
  else
    echo "[project-health][advisory] $name skipped/failed (non-blocking)." >&2
  fi
}

run_core "governance check" "$ROOT_DIR/scripts/governance-check.sh"
run_core "memory integrity check" "$ROOT_DIR/scripts/memory-integrity-check.sh"
run_core "traceability check" "$ROOT_DIR/scripts/traceability-check.sh"
run_core "context budget check" "$ROOT_DIR/scripts/context-budget-check.sh"
run_core "code constraints check" "$ROOT_DIR/scripts/code-constraints-check.sh"
run_advisory "branch protection check" "$ROOT_DIR/scripts/check-branch-protection.sh"

echo "[project-health] completed."
