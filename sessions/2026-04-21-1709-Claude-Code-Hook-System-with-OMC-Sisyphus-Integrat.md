---
created: 2026-04-21
project: ubuntu
type: discovery
tags: [imported, claude-mem]
observation_id: 1709
---

# "Claude Code Hook System with OMC Sisyphus Integration"

**Subtitle:** "Multiple PreToolUse, SessionStart, PostToolUse, and UserPromptSubmit hooks"


## Narrative
"Claude Code configured with extensive hook system from oh-my-claude-sisyphus package. Multiple hooks for prompt protection, context monitoring, skill injection, keyword detection, and project memory. The skill-injector is specifically attached to UserPromptSubmit to inject learned skills autonomously based on trigger keywords."


## Facts
"[""Claude Code settings.json configures env with MiniMax-M2.7 model and custom base URL"",""PreToolUse hooks: proteger.sh (Bash), gsd-prompt-guard.js (Write/Edit), oh-my-claude-sisyphus pre-tool-enforcer.mjs (all tools)"",""SessionStart hooks: gsd-check-update.js, session-start.mjs, project-memory-session.mjs, wiki-session-start.mjs (all), setup-init.mjs (init matcher), setup-maintenance.mjs (maintenance matcher)"",""PostToolUse hooks: gsd-context-monitor.js (Bash/Edit/Write/MultiEdit/Agent/Task), post-tool-verifier.mjs (all), project-memory-posttool.mjs (all)"",""UserPromptSubmit hooks: keyword-detector.mjs (all), skill-injector.mjs (all - 3s timeout)"",""PostToolUseFailure hook: post-tool-use-failure.mjs (all)""]"

