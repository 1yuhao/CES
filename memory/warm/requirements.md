# Requirements Register

Purpose: persistent source of truth for user requirements and requirement changes.

## Stable Requirements (Current)

- `REQ-001` Governance-first development baseline must exist before formal feature work.
- `REQ-002` Security baseline must be explicit and executable (not only descriptive).
- `REQ-003` Agent permission control and escalation policy must be defined.
- `REQ-004` All changes must be Git-traceable and rollback-friendly.
- `REQ-005` Repository must stay connected to GitHub and remain synchronized.
- `REQ-006` Core control files are required: `AGENTS.md`, `SKILL.md`, `MEMORY.md`.
- `REQ-007` Memory must survive context loss and model handoff.
- `REQ-008` Memory design must preserve full history; no destructive "compression".
- `REQ-009` Token usage must be controlled; avoid loading full history into context.
- `REQ-010` README must be bilingual with English main entry and Chinese index link.
- `REQ-011` AI collaboration project management must be standardized with issue/PR templates and iteration tracking.
- `REQ-012` Governance and memory protocols should be validated automatically in CI.
- `REQ-013` Branch protection and reviewer ownership must be enforceable at GitHub platform level.
- `REQ-014` PRs should enforce requirement traceability (`REQ-xxx` or explicit `N/A`).
- `REQ-015` Workflow should balance reliability and efficiency (no over-engineering, no context overload).
- `REQ-016` Code development must enforce low coupling and CLI-first product contract.

## Requirement Change Log

### 2026-03-28

- `CR-001` Added explicit token-control requirement:
  - Context is a scarce resource and must be budgeted.
  - Avoid context overflow that causes drift/hallucination.
- `CR-002` Added explicit requirement persistence need:
  - User requirements must have a dedicated recording location.
- `CR-003` Added explicit project-management iteration requirement:
  - Review current baseline, research best practices, and iteratively add missing management capabilities.
- `CR-004` Added enforcement requirement:
  - Add CODEOWNERS and branch-protection operational runbook + status checks.
- `CR-005` Added PR-level traceability enforcement:
  - Validate requirement traceability in PR body via CI workflow.
- `CR-006` Added balanced-operation requirement:
  - Keep a minimal mandatory memory write set (`2+1`) and treat extended updates as on-demand.
- `CR-007` Added code-development hard constraints:
  - Validate low-coupling and CLI-first constraints via explicit checks in regression/health pipelines.
- `CR-008` Converted repository identity from baseline mirror to CES:
  - Repository naming, remote targets, and governance scripts must consistently use `CES`.
  - Legacy mirror identifiers must not remain in active docs or automation scripts.

## Traceability Notes

- Governance implementation references:
  - `AGENTS.md`
  - `SKILL.md`
  - `codex/rules/default.rules`
  - `docs/security-baseline.md`
  - `docs/agent-governance.md`
- Memory implementation references:
  - `MEMORY.md`
  - `memory/hot.md`
  - `memory/warm/*`
  - `memory/cold/*`
