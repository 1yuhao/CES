#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SRC_DIR="$ROOT_DIR/src"
TEST_DIR="$ROOT_DIR/tests"
DOC_FILE="$ROOT_DIR/docs/code-development-constraints.md"
AGENTS_FILE="$ROOT_DIR/AGENTS.md"

if [[ ! -d "$SRC_DIR" ]]; then
  echo "Missing source directory: $SRC_DIR" >&2
  exit 1
fi

if [[ ! -d "$TEST_DIR" ]]; then
  echo "Missing tests directory: $TEST_DIR" >&2
  exit 1
fi

if [[ ! -f "$DOC_FILE" ]]; then
  echo "Missing code constraints document: $DOC_FILE" >&2
  exit 1
fi

if ! grep -q "Dual-Mode Context Policy" "$AGENTS_FILE"; then
  echo "AGENTS.md must include dual-mode context policy." >&2
  exit 1
fi

if ! grep -q "CLI-First Product Contract" "$DOC_FILE"; then
  echo "Code constraints doc must include CLI-first contract." >&2
  exit 1
fi

# If implementation files exist, require at least one test file.
src_file_count="$(find "$SRC_DIR" -type f | wc -l | tr -d ' ')"
test_file_count="$(find "$TEST_DIR" -type f | wc -l | tr -d ' ')"

if (( src_file_count > 0 )) && (( test_file_count == 0 )); then
  echo "Code exists in src/ but no tests found in tests/." >&2
  exit 1
fi

# Light guard against hidden circular import hacks.
if rg -n "import .* from '\\.\\./\\.\\./'|from \"\\.\\./\\.\\./\"" "$SRC_DIR" >/dev/null 2>&1; then
  echo "Potential deep relative import detected; review coupling boundaries." >&2
  exit 1
fi

echo "[code-constraints-check] all checks passed."
