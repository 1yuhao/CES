# Hot Memory

Purpose: minimum context required for the current development loop.

## Current State

- Phase: governance baseline complete, feature development ready.
- Active branch policy: feature/fix work should start on `codex/<topic>`, not `main`.
- Default runtime posture: `workspace-write` + `on-request` approvals.
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

1. Start first feature slice on `codex/<topic>`.
2. Keep memory updates in sync with each implementation task.
3. Enforce preflight and verification gates before "done".
4. Keep requirement baseline updated in `memory/warm/requirements.md`.

## Open Risks

- R-001: accidental privilege escalation during execution.
- R-002: context drift if hot memory is not refreshed after each task.

## Last Reviewed

- 2026-03-28 (Asia/Shanghai)
