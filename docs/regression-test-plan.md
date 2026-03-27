# Regression Test Plan

This plan validates the Ai-Vibe-Coding-Baseline collaboration workspace as an engineering system, not just code snippets.

## Goals

- Ensure governance and memory controls still work after any change.
- Detect traceability breaks early.
- Keep model-handoff continuity reliable.
- Support both strict security posture and accepted-exception posture.

## Test Levels

## 1) Smoke (Fast, always run)

- `scripts/governance-check.sh`
- `scripts/memory-integrity-check.sh`
- `scripts/traceability-check.sh`
- `scripts/context-budget-check.sh`
- `scripts/code-constraints-check.sh`

Purpose: quick fail-fast for critical repository guarantees.

## 2) Platform (Policy, optional strictness)

- `scripts/check-branch-protection.sh`

Purpose: verify GitHub branch policy still matches governance expectations.

Modes:

- Balanced mode: advisory (non-blocking).
- Strict mode: blocking.

## 3) End-to-End Health (Aggregated)

- `scripts/project-health-check.sh`

Purpose: one-command confidence gate before major commits/releases.

## 4) Handoff Readiness (Continuity)

- `docs/model-handoff-drill.md` (manual drill)

Purpose: ensure a new model/session can recover context in under 5 minutes.

## Execution Matrix

- Before commit: Smoke
- Before PR: Smoke + End-to-End
- Before release/milestone: Smoke + End-to-End + Platform(strict) + Handoff drill

## Pass Criteria

- All smoke checks pass.
- End-to-end health passes (advisory checks may warn in balanced mode).
- No unresolved placeholders in traceability artifacts.
- Handoff drill answers are coherent and actionable.
