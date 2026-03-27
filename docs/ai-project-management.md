# AI Project Management Guide (Codex Workspace)

This guide defines how to manage requirements, tasks, reviews, and iteration flow in this repository.

## Objectives

- Keep scope explicit and traceable.
- Keep AI outputs reviewable and reproducible.
- Keep context token usage efficient.

## Workflow

1. Capture requirement in `memory/warm/requirements.md`.
2. Open issue from template (`Feature request` or `Implementation task`).
3. Move task to `Ready` in `memory/warm/iteration-board.md`.
4. Implement on `codex/<topic>` branch.
5. Open PR using `.github/pull_request_template.md`.
6. Verify checks and complete memory protocol before merge.

## Traceability Rules

- Requirement -> Issue -> Branch -> Commit -> PR must be linkable.
- PR must include requirement IDs for scope/behavior changes.
- Change log must map commit IDs to intent and verification.

## Review Rules

- Reject PRs missing requirement IDs when scope changes.
- Reject PRs missing verification evidence.
- Reject PRs missing memory protocol updates.
- Reject PRs that bypass CODEOWNERS expectations for governance-critical files.

## Validation Commands

- `scripts/governance-check.sh`
- `scripts/memory-integrity-check.sh`
- `scripts/traceability-check.sh`
- `scripts/project-health-check.sh` (aggregated)

## Balanced Operating Mode

- Mandatory updates per task use `2+1` memory model:
  - update `memory/hot.md`
  - update `memory/warm/change-log.md`
  - update `memory/warm/requirements.md` only if requirements changed
- Extended artifacts (decisions, risks, iteration board, cold log) update on demand.
- Context execution follows dual-mode policy:
  - `Base Mode`: governance/project-management context
  - `Code Mode`: implementation context on demand

## Platform Guards

- Branch protection on `main` must enforce admins.
- Code owner review must be required for governed files.
- PR body must include `REQ-xxx` or `N/A` (`.github/workflows/pr-traceability.yml`).
