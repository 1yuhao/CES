# Preflight Checklist (Before Feature Work)

Run this checklist before implementing a new feature/fix.

## Branch and scope

- Confirm not developing directly on `main`.
- Confirm task scope is single-purpose and reversible.

## Governance context

- Read latest `AGENTS.md`.
- Read latest `MEMORY.md` and `memory/hot.md`.
- Confirm risk level (L0-L4).

## Security and permissions

- Confirm no destructive command is required.
- If external/network action is needed, ensure explicit approval path.
- Ensure no secrets are introduced into files or logs.

## Verification and auditability

- Define expected verification command(s) before coding.
- Plan memory entry format (task, files, verification, next).
- Plan commit message type (`feat/fix/chore/docs/refactor/test`).

## Policy validation (when rules changed)

- Run:
  - `scripts/governance-check.sh`
