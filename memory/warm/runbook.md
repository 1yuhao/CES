# Runbook

## Preflight

1. Read `MEMORY.md`.
2. Read `memory/hot.md`.
3. Run `docs/preflight-checklist.md`.

## Governance Validation

- Run `scripts/governance-check.sh` after any policy update.

## Standard Task Loop

1. Capture work item via `.github/ISSUE_TEMPLATE/*` when applicable.
2. Create or switch to `codex/<topic>` branch.
3. Implement focused change.
4. Run relevant checks/tests.
5. Update memory files per protocol.
6. Open PR with `.github/pull_request_template.md`.
7. Commit and push.

## Recovery and Handoff

1. Read `MEMORY.md` then `memory/hot.md`.
2. Read `memory/warm/decisions.md`.
3. Read `memory/warm/risk-register.md`.
4. Inspect `git log -n 20 --oneline`.
