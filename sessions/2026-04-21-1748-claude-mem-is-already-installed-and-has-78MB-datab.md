---
created: 2026-04-21
project: ubuntu
type: discovery
tags: [imported, claude-mem]
observation_id: 1748
---

# "claude-mem is already installed and has 7.8MB database"

**Subtitle:** "System has an existing vector-memory system with chroma embeddings and SQLite storage."


## Narrative
"CRITICAL DISCOVERY: claude-mem is already installed and operational with a substantial 7.8MB SQLite database. This vector-based memory system has been running and capturing session data (evidenced by observer-sessions folder and supervisor config). The user has been using claude-mem as their primary memory system but is now wanting to ALSO connect Obsidian for ""infinite real memory"" - meaning they want a more robust, persistent, and searchable storage layer beyond what claude-mem provides. The two systems are complementary: claude-mem handles vector-based semantic search while Obsidian provides structured, human-readable markdown notes."


## Facts
"[""claude-mem already installed at /home/ubuntu/.claude-mem/ with 7.8MB database"",""claude-mem uses chroma vector database for embeddings"",""claude-mem has observer-sessions folder - already doing session observation"",""supervisor.json and settings.json exist in claude-mem config"",""claude-mem enabled in settings.json plugins: \""claude-mem@thedotmack\"": true"",""MCP config only has obsidian, not claude-mem (different memory systems)""]"

