---
created: 2026-04-21
project: ubuntu
type: feature
tags: [imported, claude-mem]
observation_id: 1753
---

# "write-memory.mjs hook created for Obsidian memory writes"

**Subtitle:** "Phase 3 complete: PostToolUse hook now captures decisions, errors, learnings to both vaults."


## Narrative
"Phase 3 of the infinite memory implementation is complete. The write-memory.mjs hook has been created as a PostToolUse hook that monitors user prompts for significant memory triggers. When detected (decisions, errors, remember tags, task completions, learning keywords), it formats a memory entry with YAML frontmatter and writes it to the appropriate vault(s). For inkcalendar projects, it writes to both the inkcalendar vault and SecondBrain. For global topics, it writes to SecondBrain only. This hook enables automatic memory persistence during sessions."


## Facts
"[""Created: /home/ubuntu/.claude/hooks/write-memory.mjs (PostToolUse hook)"",""Detects triggers: decision, error, remember tags, task completion, learning keywords (supports Spanish)"",""Writes markdown files with YAML frontmatter (created, project, tags) to vault's sessions/ folder"",""Auto-detects project (inkcalendar-agency or global) and writes to appropriate vault(s)"",""Also appends to 11_Memory/decisions/ daily log for inkcalendar vault"",""Outputs <memory-written> context tag showing which vaults received the memory"",""Uses timeout-protected stdin reading for cross-platform compatibility""]"

