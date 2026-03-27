# Iteration Board

Purpose: lightweight project-management board for Codex + human collaboration.

## Status Definitions

- `Backlog`: approved idea, not yet scheduled.
- `Ready`: clear scope, requirement IDs, and acceptance criteria.
- `In Progress`: active implementation.
- `Blocked`: waiting on dependency/decision/approval.
- `Review`: implementation done, verification or PR review pending.
- `Done`: merged and memory protocol completed.

## Current Sprint

### Ready

- TBD

### In Progress

- TBD

### Blocked

- TBD

### Review

- TBD

### Done

- Repository identity migrated from baseline mirror to CES (including fresh root history).
- Governance baseline established and hardened.
- Layered memory architecture implemented.
- Requirement register integrated.
- README upgraded to living contract (EN + ZH).
- Added issue/PR templates for requirement traceability.
- Added governance and memory integrity CI checks.
- Added AI project management operating guide.
- Added CODEOWNERS and branch-protection runbook/check script.
- Added traceability validator and one-command project health check.
- Added PR-level requirement traceability workflow and contributing guide.
- Introduced balanced-operation model (`2+1` mandatory memory writes + on-demand extended updates).
- Introduced code-development hard constraints and checks (low coupling + CLI-first).

## Working Rules

1. Every `In Progress` item must reference requirement IDs.
2. Every `Done` item must have commit references in `memory/warm/change-log.md`.
3. If an item is `Blocked`, record unblock condition and owner.
