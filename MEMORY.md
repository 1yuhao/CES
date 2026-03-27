# MEMORY.md

Token-aware memory control plane for CES.

## Current Snapshot

- Project: CES
- Phase: governance baseline complete, ready for first feature slice
- Default branch policy: use `codex/<topic>` for feature/fix work
- Default execution posture: `workspace-write` + `on-request`
- Last major milestone: governance hardening and bilingual docs completed
- Default context mode: `Base Mode` (governance-first, code-on-demand)

## Default Read Set (Load First)

1. `MEMORY.md`
2. `memory/hot.md`

Do not load warm/cold memory unless task requirements need them.

## Memory Index

- Hot memory: `memory/hot.md`
- Decisions: `memory/warm/decisions.md`
- Requirements: `memory/warm/requirements.md`
- Risks: `memory/warm/risk-register.md`
- Commit mapping: `memory/warm/change-log.md`
- Iteration board: `memory/warm/iteration-board.md`
- Runbook: `memory/warm/runbook.md`
- Memory architecture: `memory/warm/architecture.md`
- Full archive: `memory/cold/`

## Bootstrap Sequence (Model Handoff)

1. Read `MEMORY.md`.
2. Read `memory/hot.md`.
3. Read one warm file on demand:
   - `requirements.md` for scope/behavior tasks
   - `change-log.md` for recent execution trace
4. Inspect `git log -n 20 --oneline`.

## Memory Write Protocol (2+1)

For each meaningful task:

1. Always update `memory/hot.md`.
2. Always append commit intent/result in `memory/warm/change-log.md`.
3. Conditionally update `memory/warm/requirements.md` when user requirements changed.

Extended writes (on-demand):

- Append factual record to active monthly cold log for major milestones.
- Update decisions/risks when governance or architecture changed.
- Update iteration board when task state tracking is needed.

## Guardrails

- Preserve history: cold logs are append-only.
- Preserve tokens: default context uses only the default read set.
- Preserve reliability: no "done" claim without verification evidence.
- Preserve low coupling: keep governance context and code context separated by mode.
