# Hot Memory

Purpose: minimum context required for the current development loop.

## Current State

- Phase: CES mirror import complete, repository identity normalization in progress.
- Active branch policy: feature/fix work should start on `codex/<topic>`, not `main`.
- Default runtime posture: `workspace-write` + `on-request` approvals.
- Repository identity: remote `origin` now targets `git@github.com:1yuhao/CES.git`.
- History model: local history was re-initialized and published as a fresh CES root history.
- Rule validation status: `scripts/governance-check.sh` passes.
- Regression status: `scripts/regression-test.sh` passes in balanced mode.
- Context budget status:
  - default set est tokens: `813`
  - default + requirements est tokens: `1531`
  - default + change-log est tokens: `1902`
- Context mode status:
  - `Base Mode` default active
  - `Code Mode` on-demand only
- Code constraints status: `scripts/code-constraints-check.sh` passes.

## Active Priorities

1. Finish repository-wide CES identity alignment from mirrored baseline content.
2. Keep memory updates in sync with each implementation task.
3. Enforce preflight and verification gates before "done".
4. Keep requirement baseline updated in `memory/warm/requirements.md`.

## Open Risks

- R-001: accidental privilege escalation during execution.
- R-002: context drift if hot memory is not refreshed after each task.

## Last Reviewed

- 2026-03-28 (Asia/Shanghai)
