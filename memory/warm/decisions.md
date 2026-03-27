# Decisions (ADR-lite)

## 2026-03-27

- Decision: establish a governance-first repository baseline before feature work.
- Rationale: reduce drift, improve safety, keep changes auditable and reversible.
- Impact:
  - `AGENTS.md` is the execution constitution.
  - `SKILL.md` is the default workflow contract.
  - `MEMORY.md` and `memory/*` provide durable continuity.

## 2026-03-28

- Decision: move from single-file memory to layered memory (`hot/warm/cold`).
- Rationale: prevent context overflow while preserving full history.
- Impact:
  - default context load is limited to `MEMORY.md` + `memory/hot.md`
  - themed data lives in `memory/warm/*`
  - immutable full logs live in `memory/cold/*`
