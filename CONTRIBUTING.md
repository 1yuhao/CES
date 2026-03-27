# Contributing

This repository is designed for human + agent collaboration with strong governance and traceability.

## Before You Start

1. Read `README.md`.
2. Read `AGENTS.md`.
3. Read `MEMORY.md` and `memory/hot.md`.

## Branching

- Do not develop directly on `main`.
- Use `codex/<topic>` branches.

## Development Loop

1. Confirm requirement mapping in `memory/warm/requirements.md`.
2. Implement a focused, reversible change.
3. Run:
   - `scripts/project-health-check.sh`
4. Update memory protocol targets:
   - `memory/cold/YYYY-MM.md`
   - `memory/warm/change-log.md`
   - `memory/warm/requirements.md` (if requirements changed)
   - `memory/warm/iteration-board.md` (task state)
5. Open PR with requirement traceability.

## Pull Requests

- Use `.github/pull_request_template.md`.
- Include `REQ-xxx` IDs or explicit `N/A`.
- Provide verification evidence.

## Governance

- Branch protection and CODEOWNERS are enforced.
- CI checks are expected to pass before merge.
