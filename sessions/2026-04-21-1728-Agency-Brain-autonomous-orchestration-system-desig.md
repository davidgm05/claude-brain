---
created: 2026-04-21
project: ubuntu
type: feature
tags: [imported, claude-mem]
observation_id: 1728
---

# "Agency Brain autonomous orchestration system designed"

**Subtitle:** "New orchestration layer converts high-level instructions into multi-agent work with safety gates and infinite memory"


## Narrative
"A comprehensive spec was created for the ""Agency Brain"" - a virtual CTO orchestration layer for inkcalendar-agency. The system transforms high-level instructions (""mejora el funnel de leads"", ""arregla el daemon"") into automated work by dispatching specialized agents in parallel. Key components: Orchestrator (decides which agents to use), Skill Injector (context-aware skill selection), Safety Gate (blocks destructive ops), Reporter (terminal + Telegram), Memory System (persists across sessions), Agent Pool (49 agents). The infinite memory system stores project state, agent decisions, and learnings in ~/.omc/memory/ with semantic retrieval for context recovery. Out of scope: direct DB writes (uses existing interfaces), sending real messages without confirmation, creating new agents."


## Facts
"[""Agency Brain spec created at docs/superpowers/specs/2026-04-21-agency-brain-design.md"",""System operates in always-autonomous mode by default, coordinating 49 agents in parallel"",""Reports progress every 5-10 minutes via terminal + Telegram integration"",""Safety gate pauses only for destructive actions (mass deletes, drops, real external sends)"",""Infinite memory implemented at ~/.omc/memory/ with project state, agent decisions, and knowledge base"",""Context-aware skill injection analyzes project + problem + goal to select relevant agent pool"",""Memory structure includes: projects/inkcalendar-agency/state.yaml, daemon-status.json, decisions/, agents/memory/, knowledge/"",""Agent pool categorized into: Debugging, Planning, Execution, Verification, SEO, Research, Quality""]"

