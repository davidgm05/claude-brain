---
created: 2026-04-21
project: ubuntu
type: discovery
tags: [imported, claude-mem]
observation_id: 1725
---

# "Oh-My-ClaudeCode v4.11.0 Orchestration System"

**Subtitle:** "OMC provides the core multi-agent orchestration layer with keyword-triggered skills and delegation rules"


## Narrative
"The primary session has oh-my-claudecode (OMC) v4.11.0 as the core orchestration layer. This system coordinates specialized agents with delegation rules (delegate multi-file changes/refactors/reviews, work directly for trivial ops). Skills are invoked via /oh-my-claudecode:<name> with automatic keyword detection. The system includes Tier-0 workflows for autopilot mode, ultrawork (parallel execution), ralph (persistence), team orchestration, and ralplan (iterative planning). Hooks inject context via system-reminder tags, and persistence markers control memory retention. State is maintained in .omc/ directories."


## Facts
"[""OMC version 4.11.0 is installed at ~/.claude/CLAUDE.md with multi-agent orchestration capabilities"",""Available agents: explore, planner, architect, executor, designer, writer, code-reviewer, verifier"",""Model routing: haiku (quick lookups), sonnet (standard), opus (complex/architecture)"",""Skill invocation: `/oh-my-claudecode:<name>` with auto-detection via keyword patterns"",""Tier-0 workflows: autopilot, ultrawork, ralph, team, ralplan with keyword triggers (ulw→ultrawork, ccg→tri-model, tdd→TDD, ultrathink→deep reasoning)"",""Hooks inject system-reminder tags; key patterns: hook success, [MAGIC KEYWORD:...], \""The boulder never stops\"" (ralph/ultrawork)"",""Persistence: `<remember>` (7 days), `<remember priority>` (permanent)"",""Kill switches: DISABLE_OMC, OMC_SKIP_HOOKS (comma-separated)"",""State paths: .omc/state/, .omc/notepad.md, .omc/project-memory.json, .omc/plans/, .omc/research/, .omc/logs/""]"

