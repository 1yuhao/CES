#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
REQ_FILE="$ROOT_DIR/memory/warm/requirements.md"
CHANGE_LOG="$ROOT_DIR/memory/warm/change-log.md"
README_FILE="$ROOT_DIR/README.md"

if [[ ! -f "$REQ_FILE" ]]; then
  echo "Missing requirements register: $REQ_FILE" >&2
  exit 1
fi

if [[ ! -f "$CHANGE_LOG" ]]; then
  echo "Missing change log: $CHANGE_LOG" >&2
  exit 1
fi

if [[ ! -f "$README_FILE" ]]; then
  echo "Missing README: $README_FILE" >&2
  exit 1
fi

# Ensure REQ IDs exist and are unique in stable requirements section.
req_ids="$(grep -Eo '`REQ-[0-9]{3}`' "$REQ_FILE" | tr -d '`' || true)"
if [[ -z "$req_ids" ]]; then
  echo "No REQ IDs found in requirements register." >&2
  exit 1
fi

duplicates="$(echo "$req_ids" | sort | uniq -d || true)"
if [[ -n "$duplicates" ]]; then
  echo "Duplicate REQ IDs found:" >&2
  echo "$duplicates" >&2
  exit 1
fi

# Ensure change log does not keep unresolved placeholders.
if grep -q "PENDING" "$CHANGE_LOG"; then
  echo "Change log contains unresolved PENDING entries." >&2
  exit 1
fi

# Ensure README includes mandatory update policy section.
if ! grep -q "README Update Policy (Mandatory)" "$README_FILE"; then
  echo "README is missing mandatory update policy section." >&2
  exit 1
fi

echo "[traceability-check] all checks passed."
