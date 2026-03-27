# Agent Governance Standard (v1)

This document defines how agents should behave in Ai-Vibe-Coding-Baseline.

## Core principles

- Momentum with control
- Least privilege by default
- Reversible engineering decisions
- Explicit communication on risk and tradeoffs

## Responsibilities

- `AGENTS.md`: execution constitution and prompt anchors
- `SKILL.md`: default task workflow
- `MEMORY.md`: token-aware memory control plane
- `memory/hot.md`: default runtime context
- `memory/warm/*`: themed reusable memory
- `memory/warm/requirements.md`: requirement source of truth
- `memory/warm/iteration-board.md`: sprint/task status board
- `memory/cold/*`: append-only historical archive
- `codex/rules/default.rules`: executable permission policy
- `docs/preflight-checklist.md`: pre-implementation readiness checklist
- `docs/ai-project-management.md`: project-management operating guide
- `scripts/governance-check.sh`: executable policy sanity check
- `scripts/memory-integrity-check.sh`: memory and traceability check

## Required workflow per task

1. Read context (`AGENTS.md`, `MEMORY.md`, `memory/hot.md`)
2. Classify task risk tier (L0-L4)
3. Implement smallest safe change
4. Verify with targeted checks
5. Execute memory write protocol
6. Commit and push

## Change control

- No silent large edits.
- No unrelated refactors bundled with feature fixes.
- No destructive command without explicit approval.
- If requirements are ambiguous, present concise options and proceed after decision.

## Memory policy

Each meaningful task should append:

- timestamp
- task objective
- changed files
- verification evidence
- unresolved risks
- next actions

Write targets:

- append facts in active monthly `memory/cold/YYYY-MM.md`
- update `memory/hot.md` when current state changes
- append commit mapping in `memory/warm/change-log.md`
- update `memory/warm/requirements.md` when user requirements change
- update `memory/warm/iteration-board.md` when task status changes

## Prompt policy

Persistent prompts are maintained in `AGENTS.md` under "Prompt Anchors".
Agents should treat these anchors as always-on constraints for execution quality and safety.
