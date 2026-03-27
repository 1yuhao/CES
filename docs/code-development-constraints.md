# Code Development Hard Constraints

This document defines mandatory constraints for implementation work in `Code Mode`.

## 1) Architecture and Coupling

- Use low-coupling, high-cohesion module design.
- Keep business logic separated from CLI entrypoints and infrastructure adapters.
- Avoid cross-module hidden dependencies and circular imports.
- Keep each feature change scoped to a clear module boundary.

## 2) CLI-First Product Contract

- All operational workflows must be executable via CLI commands.
- Human operators should only need dashboards for visibility, not core operations.
- Every automation-critical command should support machine-friendly output (`--json` when applicable).
- Command exit codes must be reliable for scripting and agent orchestration.

## 3) Testability

- New behavior in `src/` must include or update tests in `tests/`.
- Prefer deterministic tests for command contracts and core logic.
- Keep test setup isolated from external mutable state when possible.

## 4) Implementation Safety

- No large unrelated refactor mixed into feature/fix work.
- No direct secret handling in source files.
- No destructive side effects without explicit operator intent and safeguards.

## 5) Required Validation

Run before merge:

- `scripts/code-constraints-check.sh`
- `scripts/regression-test.sh` (or stricter mode when needed)
