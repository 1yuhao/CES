#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
STRICT_PLATFORM=false

for arg in "$@"; do
  case "$arg" in
    --strict-platform)
      STRICT_PLATFORM=true
      ;;
    *)
      echo "Unknown argument: $arg" >&2
      echo "Usage: scripts/regression-test.sh [--strict-platform]" >&2
      exit 1
      ;;
  esac
done

run_step() {
  local name="$1"
  shift
  echo "[regression][run] $name"
  "$@"
  echo "[regression][pass] $name"
}

run_advisory_step() {
  local name="$1"
  shift
  echo "[regression][advisory] $name"
  if "$@"; then
    echo "[regression][pass] $name"
  else
    echo "[regression][warn] $name failed (advisory mode)" >&2
  fi
}

echo "[regression] mode: $([[ "$STRICT_PLATFORM" == "true" ]] && echo "strict-platform" || echo "balanced")"

# Smoke checks (always blocking)
run_step "governance-check" "$ROOT_DIR/scripts/governance-check.sh"
run_step "memory-integrity-check" "$ROOT_DIR/scripts/memory-integrity-check.sh"
run_step "traceability-check" "$ROOT_DIR/scripts/traceability-check.sh"
run_step "context-budget-check" "$ROOT_DIR/scripts/context-budget-check.sh"
run_step "code-constraints-check" "$ROOT_DIR/scripts/code-constraints-check.sh"

# Platform branch protection check (strict/advisory)
if [[ "$STRICT_PLATFORM" == "true" ]]; then
  run_step "branch-protection-check" "$ROOT_DIR/scripts/check-branch-protection.sh"
else
  run_advisory_step "branch-protection-check" "$ROOT_DIR/scripts/check-branch-protection.sh"
fi

# Aggregated health check (always blocking)
run_step "project-health-check" "$ROOT_DIR/scripts/project-health-check.sh"

echo "[regression] all done."
