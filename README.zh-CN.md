# CES

面向 Codex 协作开发的工程化工作区，强调治理、安全、记忆连续性和 Git 可追溯性。
本仓库已从治理基座镜像切换为 CES 独立项目。

[English README](./README.md)

## 建设目标

这个仓库重点解决三类问题：

- 会话变长或换模型后，项目意图丢失
- 上下文 token 被历史信息挤占，导致效率下降
- AI 协作开发缺少可审计、可回滚的工程约束

## 核心原则

- 先治理，后功能。
- 小步快跑，每步可验证、可回滚。
- 最小权限，风险操作必须显式审批。
- 需求必须落文档，不只停留在聊天记录。
- README 是长期契约，项目变化必须同步更新。

## 仓库结构索引

- `AGENTS.md`：Agent 执行宪法。
- `SKILL.md`：默认任务工作流与输出契约。
- `MEMORY.md`：面向 token 控制的记忆控制面板。
- `memory/hot.md`：当前循环最小运行上下文。
- `memory/warm/requirements.md`：需求事实源（需求台账）。
- `memory/warm/decisions.md`：ADR-lite 决策记录。
- `memory/warm/risk-register.md`：风险登记。
- `memory/warm/change-log.md`：commit 与意图映射。
- `memory/warm/iteration-board.md`：迭代任务状态看板。
- `memory/warm/runbook.md`：运行与交接手册。
- `memory/warm/architecture.md`：记忆架构与加载策略。
- `memory/cold/`：仅追加的历史归档。
- `codex/rules/default.rules`：可执行命令策略。
- `docs/security-baseline.md`：安全基线。
- `docs/agent-governance.md`：Agent 治理标准。
- `docs/preflight-checklist.md`：开发前检查清单。
- `docs/ai-project-management.md`：AI 任务与迭代管理指南。
- `docs/model-handoff-drill.md`：5 分钟模型切换演练。
- `docs/code-development-constraints.md`：代码开发硬约束（低耦合、CLI-first）。
- `scripts/governance-check.sh`：策略校验脚本。
- `scripts/memory-integrity-check.sh`：记忆完整性与追踪校验脚本。
- `scripts/traceability-check.sh`：需求/变更映射/README 追踪一致性校验。
- `scripts/project-health-check.sh`：一键项目健康检查（治理+记忆+追踪）。
- `scripts/code-constraints-check.sh`：代码开发硬约束校验脚本。
- `.github/ISSUE_TEMPLATE/*`：结构化需求/任务提单模板。
- `.github/pull_request_template.md`：带需求追踪的 PR 检查清单。
- `.github/CODEOWNERS`：仓库代码所有者与评审责任映射。
- `.github/workflows/governance-ci.yml`：治理与记忆校验 CI。
- `docs/branch-protection-runbook.md`：分支保护落地手册。
- `scripts/check-branch-protection.sh`：分支保护状态检查脚本。
- `.github/workflows/pr-traceability.yml`：PR 需求追踪校验。
- `CONTRIBUTING.md`：贡献者与协作流程说明。

## 开发执行契约

1. 功能/修复开发不得直接在 `main` 上进行。
2. 创建分支：`git checkout -b codex/<topic>`。
3. 实现最小安全改动。
4. 运行相关验证。
5. 执行记忆写入协议：
- 追加事实到当月 `memory/cold/YYYY-MM.md`
- 如状态变化，更新 `memory/hot.md`
- 更新 `memory/warm/change-log.md`
- 如需求变化，更新 `memory/warm/requirements.md`
6. 提交并推送。
7. 合并前走 PR 流程。

## 上下文与 Token 策略

- 默认只加载：`MEMORY.md` + `memory/hot.md`。
- 仅在任务需要时加载 `memory/warm/*`。
- 仅在明确追溯历史时加载 `memory/cold/*`。
- 禁止一次性加载全部记忆文件到单轮上下文。

## 需求记录策略

- 稳定需求统一记录在 `memory/warm/requirements.md`。
- 需求变更必须追加到变更日志区。
- 涉及范围/行为变更时，应引用对应需求 ID。

## 安全与权限策略

- 默认姿态：`workspace-write` + `on-request`。
- 风险分级：遵循 `AGENTS.md` 的 L0-L4。
- 破坏性操作必须显式审批并具备回滚意识。
- 修改规则后执行：
`scripts/governance-check.sh`

## 一键校验

在关键提交或发布前执行：
`scripts/project-health-check.sh`

健康检查语义：

- 核心检查：必须通过（治理、记忆完整性、追踪一致性）
- 建议检查：信息性、非阻塞（分支保护 API 可达性）

## README 更新策略（强制）

以下场景必须同步更新 README：

- 架构或记忆模型变化
- 治理或安全策略变化
- 命令规则行为变化
- 需求管理流程变化
- 开发流程或 DoD 变化

若影响中文协作者，需在同一提交中同步更新 `README.zh-CN.md`。
