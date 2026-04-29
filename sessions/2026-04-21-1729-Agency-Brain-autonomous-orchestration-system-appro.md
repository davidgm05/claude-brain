---
created: 2026-04-21
project: ubuntu
type: decision
tags: [imported, claude-mem]
observation_id: 1729
---

# "Agency Brain autonomous orchestration system approved for implementation"

**Subtitle:** "Design spec for CTO-like virtual agent system that coordinates 49 agents with infinite memory and periodic reporting"


## Narrative
"The Agency Brain is an autonomous orchestration layer designed to act as a virtual CTO for inkcalendar-agency. The system analyzes user requests, determines required skills and agents, dispatches work in parallel, and reports progress every 5-10 minutes. Key architectural decisions include context-aware skill injection (not just keyword matching), infinite memory persistence across sessions via structured files in ~/.omc/memory/, and a safety gate for destructive operations like mass deletes. The implementation scope excludes direct database writes, real external messaging, and billing modifications."


## Facts
"[""Agency Brain design spec approved at /home/ubuntu/inkcalendar-agency/docs/superpowers/specs/2026-04-21-agency-brain-design.md"",""System transforms high-level instructions into autonomous agent work with 5-10 minute periodic reports"",""49 existing agents categorized into Debugging, Planning, Execution, Verification, SEO, Research, and Quality pools"",""Memory system persists to ~/.omc/memory/ with structured project state, decision logs, and knowledge base"",""Safety gate pauses for destructive operations requiring user confirmation before execution"",""Telegram integration for remote reporting with terminal fallback""]"

