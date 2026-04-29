---
created: 2026-04-21
project: ubuntu
type: discovery
tags: [imported, claude-mem]
observation_id: 1755
---

# "claude-mem database schema revealed"

**Subtitle:** "SQLite schema shows sessions, prompts, and FTS5 search - observations table not yet found."


## Narrative
"Discovered the claude-mem SQLite database schema. The database stores SDK sessions and user prompts with full-text search capability. The schema shows sessions are tracked with content_session_id and memory_session_id fields. Prompts are stored with FTS5 indexing for fast search. This schema differs from what was expected (observation table) - the memory system may store observations differently or the schema is incomplete in what was captured. The migration script will need to query sdk_sessions and user_prompts tables to reconstruct context."


## Facts
"[""claude-mem.db is SQLite 3.x database at /home/ubuntu/.claude-mem/claude-mem.db"",""schema_versions table tracks migrations"",""sdk_sessions table: content_session_id, memory_session_id, project, started_at, status"",""user_prompts table: content_session_id, prompt_text, created_at_epoch with FTS5 full-text search"",""user_prompts_fts virtual table for FTS5 search on prompt_text"",""Indexes on content_session_id, project, started_at_epoch DESC""]"

