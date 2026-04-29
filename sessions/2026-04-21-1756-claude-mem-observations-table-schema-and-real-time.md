---
created: 2026-04-21
project: ubuntu
type: discovery
tags: [imported, claude-mem]
observation_id: 1756
---

# "claude-mem observations table schema and real-time capture confirmed"

**Subtitle:** "Database stores 1754 observations with rich structure - current session's observations (1705-1754) being recorded live."


## Narrative
"CRITICAL DISCOVERY: The claude-mem observations table is actively capturing this session's observations in real-time. The schema shows rich observation structure including type, title, subtitle, facts (array), narrative, concepts, files_read, and files_modified. The FTS5 virtual table provides fast search across observation content. Current observations 1705-1754 are from today's session where the infinite memory system is being implemented. The observation types align exactly with what this memory agent has been recording - the system is fully operational and capturing everything being done."


## Facts
"[""observations table schema: id, memory_session_id, project, text, type, title, subtitle, facts, narrative, concepts, files_read, files_modified, created_at"",""FTS5 triggers active on observations table: full-text index on title, subtitle, narrative, text, facts, concepts"",""Current session (April 21) has observations 1705-1754 being recorded in real-time"",""Observation types: bugfix, feature, refactor, discovery, decision, change"",""observations_fts virtual table provides fast full-text search across all observations"",""Index on created_at_epoch DESC for recent-first retrieval"",""Foreign key to sdk_sessions on memory_session_id""]"

