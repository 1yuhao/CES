# Ai-Vibe-Coding-Baseline

Codex-first engineering workspace with governance, safety, memory continuity, and full Git traceability.

[简体中文文档](./README.zh-CN.md)

## Why This Repository Exists

This project is designed to prevent three common failures in AI-assisted development:

- losing project intent across long conversations or model handoffs
- wasting context tokens by loading unnecessary history
- drifting from safe and auditable engineering practices

## Core Principles

- Governance-first before feature-first.
- Small, reversible, testable iterations.
- Least privilege and explicit approval for risky actions.
- Requirements are recorded as durable artifacts, not only chat messages.
- README is a living contract and must stay synchronized with project reality.

## Repository Map

- `AGENTS.md`: execution constitution for agents.
- `SKILL.md`: default task workflow and output contract.
- `MEMORY.md`: token-aware memory control plane.
- `memory/hot.md`: minimum operational context for current loop.
- `memory/warm/requirements.md`: requirement source of truth.
- `memory/warm/decisions.md`: ADR-lite decision records.
- `memory/warm/risk-register.md`: active risk tracking.
- `memory/warm/change-log.md`: commit-to-intent mapping.
- `memory/warm/iteration-board.md`: sprint/task status board.
- `memory/warm/runbook.md`: operating procedures and handoff path.
- `memory/warm/architecture.md`: memory architecture and load policy.
- `memory/cold/`: append-only historical archive.
- `codex/rules/default.rules`: executable command policy.
- `docs/security-baseline.md`: security controls baseline.
- `docs/agent-governance.md`: governance standard.
- `docs/preflight-checklist.md`: pre-implementation checklist.
- `docs/ai-project-management.md`: AI task and iteration management guide.
- `docs/model-handoff-drill.md`: 5-minute model handoff validation drill.
- `docs/regression-test-plan.md`: regression testing strategy and pass criteria.
- `docs/context-budget-policy.md`: measurable context loading budget policy.
- `docs/code-development-constraints.md`: hard constraints for low-coupling, CLI-first implementation.
- `docs/context-mode-policy.md`: mandatory Base/Code dual-mode context separation.
- `scripts/governance-check.sh`: policy behavior validator.
- `scripts/memory-integrity-check.sh`: memory and traceability validator.
- `scripts/traceability-check.sh`: requirements/change-log/README traceability validator.
- `scripts/project-health-check.sh`: one-command health check for governance + memory + traceability.
- `scripts/regression-test.sh`: full regression test runner (`--strict-platform` supported).
- `scripts/context-budget-check.sh`: context data and token-budget validator.
- `scripts/code-constraints-check.sh`: code development hard-constraint validator.
- `.github/ISSUE_TEMPLATE/*`: structured issue intake for requirements and tasks.
- `.github/pull_request_template.md`: PR checklist with requirement traceability.
- `.github/CODEOWNERS`: repository ownership and required reviewer mapping.
- `.github/workflows/governance-ci.yml`: CI checks for governance and memory integrity.
- `docs/branch-protection-runbook.md`: branch protection enforcement guide.
- `scripts/check-branch-protection.sh`: branch protection status checker.
- `.github/workflows/pr-traceability.yml`: PR requirement traceability guard.
- `CONTRIBUTING.md`: contributor onboarding and workflow contract.

## Development Contract

1. Do not start feature/fix work on `main`.
2. Create branch: `git checkout -b codex/<topic>`.
3. Implement the smallest safe change.
4. Run relevant verification.
5. Execute memory write protocol:
- append factual entry in active monthly cold log
- update `memory/hot.md` if active state changed
- update `memory/warm/change-log.md`
- update `memory/warm/requirements.md` when requirements change
6. Commit and push.
7. Open PR before merge to `main`.

## Context and Token Policy

- Default read set: `MEMORY.md` + `memory/hot.md`.
- Load warm memory only when task context requires it.
- Load cold archive only for explicit historical tracing.
- Never bulk-load all memory files into one context window.

## Requirement Tracking Policy

- Every stable requirement must be recorded in `memory/warm/requirements.md`.
- Requirement changes must be appended in the requirement change log.
- Scope/behavior decisions must reference requirement IDs when applicable.

## Security and Permission Policy

- Default posture: `workspace-write` + `on-request`.
- Risk model: L0-L4 in `AGENTS.md`.
- Destructive operations require explicit approval and rollback awareness.
- Validate policy behavior after rule changes:
`scripts/governance-check.sh`

## One-command Validation

Run this before major commits or release prep:
`scripts/project-health-check.sh`

Health check semantics:

- Core checks: must pass (governance, memory integrity, traceability)
- Advisory checks: informative, non-blocking (branch-protection API reachability)

## README Update Policy (Mandatory)

README must be updated when any of the following changes:

- architecture or memory model
- governance or security policy
- command/rules behavior
- requirement tracking process
- workflow/DoD definitions

If the change affects Chinese users, update `README.zh-CN.md` in the same commit.
