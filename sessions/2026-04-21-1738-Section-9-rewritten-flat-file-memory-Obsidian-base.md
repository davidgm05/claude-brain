---
created: 2026-04-21
project: ubuntu
type: refactor
tags: [imported, claude-mem]
observation_id: 1738
---

# "Section 9 rewritten: flat file memory → Obsidian-based dual vault"

**Subtitle:** "Complete redesign of infinite memory architecture using Obsidian vaults instead of ~/.omc/memory/ files."


## Narrative
"The primary session made a major architectural change to the Agency Brain design document. Section 9 (Infinite Memory Implementation) was completely refactored from a flat file-based system (using ~/.omc/memory/) to a proper Obsidian-based knowledge management system. The new design uses a dual vault strategy: SecondBrain vault stores global memory (learnings, preferences, agent memories, session summaries) while the inkcalendar-agency vault stores project-specific memory (decisions, system state, client info). Cross-vault linking via Obsidian's wiki-style links creates a unified knowledge web. The memory-write protocol specifies exact triggers and formats, with frontmatter (created date, project, type, tags, related) for proper organization."


## Facts
"[""Section 9 of agency-brain-design.md completely rewritten"",""Memory backend changed from flat files (~/.omc/memory/) to Obsidian vaults"",""Dual vault strategy implemented: SecondBrain (global) + inkcalendar-agency vault (project-specific)"",""Cross-vault linking enabled between SecondBrain and inkcalendar vault"",""Memory-write protocol defined with specific triggers and markdown format"",""Obsidian MCP tools specified: search_notes, read_note, create_note, edit_note, create_tag, search_by_tag, get_backlinks"",""Three immediate TODOs identified: test MCP connection, create memory functions, populate initial context"",""Vault responsibilities clearly divided: SecondBrain for global learnings, inkcalendar vault for project state and decisions""]"

