#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

required_files=(
  "$ROOT_DIR/MEMORY.md"
  "$ROOT_DIR/memory/hot.md"
  "$ROOT_DIR/memory/warm/requirements.md"
  "$ROOT_DIR/memory/warm/decisions.md"
  "$ROOT_DIR/memory/warm/risk-register.md"
  "$ROOT_DIR/memory/warm/change-log.md"
)

for file in "${required_files[@]}"; do
  if [[ ! -f "$file" ]]; then
    echo "Missing required memory file: $file" >&2
    exit 1
  fi
done

if ! grep -q "Default Read Set" "$ROOT_DIR/MEMORY.md"; then
  echo "MEMORY.md must contain 'Default Read Set' section." >&2
  exit 1
fi

if ! grep -q "Requirement IDs" "$ROOT_DIR/.github/pull_request_template.md"; then
  echo "PR template must include requirement traceability section." >&2
  exit 1
fi

echo "[memory-integrity-check] all checks passed."
