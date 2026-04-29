---
created: 2026-04-21
project: ubuntu
type: feature
tags: [imported, claude-mem]
observation_id: 1757
---

# "migrate-claude-mem.js migration script created"

**Subtitle:** "Phase 5 complete: Script to export 100 recent observations from claude-mem to Obsidian vaults."


## Narrative
"Phase 5 of the infinite memory implementation is complete. The migrate-claude-mem.js script is a one-time migration tool that exports recent observations from the claude-mem SQLite database to Obsidian vaults. It reads observations with id > 1650 (approximately 100 recent observations), formats them as markdown with YAML frontmatter including all metadata (type, project, narrative, facts, concepts), and writes them to the appropriate vault's sessions/ folder. The script determines target vault based on the observation's project field - inkcalendar observations go to inkcalendar vault, others go to SecondBrain."


## Facts
"[""Created: /home/ubuntu/.claude/hooks/migrate-claude-mem.js"",""Uses better-sqlite3 for SQLite database access"",""Queries observations where id > 1650, ordered by id DESC, limit 100"",""Formats each observation as markdown with YAML frontmatter (created, project, type, tags, memory_session, observation_id)"",""Auto-detects project and writes to inkcalendar vault or SecondBrain based on project field"",""Output filename format: {date}-{id}-{safe-title}.md"",""Requires better-sqlite3 npm package to run""]"

