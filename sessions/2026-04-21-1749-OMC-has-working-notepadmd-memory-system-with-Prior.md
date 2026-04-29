---
created: 2026-04-21
project: ubuntu
type: discovery
tags: [imported, claude-mem]
observation_id: 1749
---

# "OMC has working notepad.md memory system with Priority Context"

**Subtitle:** "Existing hooks create .omc/notepad.md with Priority Context (always loaded), Working Memory (7-day prune), and MANUAL sections."


## Narrative
"DISCOVERED: oh-my-claude-sisyphus already has a sophisticated working memory system through notepad.md. The session-start.mjs hook automatically restores Priority Context on session start. The post-tool-use.mjs hook captures <remember> tags from task outputs and persists them. The MANUAL section never auto-prunes, providing permanent storage. The user wants to connect this to Obsidian for more robust, searchable, and human-readable permanent memory beyond what notepad.md provides."


## Facts
"[""oh-my-claude-sisyphus creates .omc/notepad.md with three sections: Priority Context, Working Memory, MANUAL"",""Priority Context section is ALWAYS loaded on session start via session-start.mjs hook"",""Working Memory entries auto-pruned after 7 days - session notes with timestamps"",""MANUAL section preserves user content forever - never auto-pruned"",""post-tool-use.mjs processes <remember> and <remember priority> tags from Task tool output"",""Notepad path initialized per-project in .omc directory"",""session-start.mjs restores ultrawork mode and pending tasks from state""]"

