# Risk Register

## R-001

- Risk: privilege overreach during agent execution.
- Mitigation: sandbox defaults, approval gating, command rules.
- Status: active control.

## R-002

- Risk: context loss across long sessions or model handoff.
- Mitigation: layered memory architecture and bootstrap read sequence.
- Status: active control.

## R-003

- Risk: token waste from loading unnecessary historical context.
- Mitigation: read only `MEMORY.md` + `memory/hot.md` by default; load warm/cold on demand.
- Status: active control.

## R-004

- Risk: `main` branch protection can be bypassed by admin-level push privileges.
- Mitigation: tracked via branch-protection checker and runbook; no immediate remediation required.
- Status: accepted exception (user-approved).
