---
created: 2026-04-21
project: ubuntu
type: feature
tags: [imported, claude-mem]
observation_id: 1754
---

# "read-memory.mjs hook created for Obsidian memory retrieval"

**Subtitle:** "Phase 4 complete: SessionStart hook now searches both vaults when user asks ""what do you remember""."


## Narrative
"Phase 4 of the infinite memory implementation is complete. The read-memory.mjs SessionStart hook enables memory retrieval on demand. When the user asks ""what do you remember about X"", the hook searches both vaults for relevant markdown files, scores them by term frequency, and returns formatted results. This provides the query capability the user requested for infinite memory - the ability to ask about past topics and get contextual recall from Obsidian vaults."


## Facts
"[""Created: /home/ubuntu/.claude/hooks/read-memory.mjs (SessionStart hook)"",""Triggers on \""what do you remember\"", \""recuerdas\"", \""qué sabes sobre\"" patterns"",""Searches both SecondBrain and inkcalendar vault recursively (depth 3, max 5 results per term)"",""Scoring based on term frequency in markdown files"",""Supports both English and Spanish queries"",""Deduplicates and limits to top 5 memories"",""Outputs <memory-retrieval> context block with formatted results""]"

