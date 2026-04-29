---
created: 2026-04-21
project: ubuntu
type: discovery
tags: [imported, claude-mem]
observation_id: 1747
---

# "Comprehensive hooks infrastructure already exists for memory"

**Subtitle:** "oh-my-claude-sisyphus provides session-start, post-tool, and pre-compact hooks for memory but not connected to Obsidian."


## Narrative
"Discovered that an extensive memory infrastructure already exists through oh-my-claude-sisyphus hooks. The hooks are designed to learn from tool outputs and inject project memory context, but they may not be fully functional (the dist modules may be missing). The obsidian-mcp is the bridge needed to connect this hook infrastructure to persistent Obsidian storage. The plan likely involves configuring obsidian-mcp with multiple vaults and creating Obsidian notes from session activities, decisions, and learned patterns."


## Facts
"[""oh-my-claude-sisyphus has existing hooks: project-memory-session.mjs, project-memory-posttool.mjs, project-memory-precompact.mjs"",""Hooks use stdin JSON to receive context (cwd, sessionId, tool_name, tool_output)"",""Memory hooks import from ../dist/hooks/project-memory/ but this dist folder may not exist or be configured"",""14 hook types configured in settings.json including SessionStart, PostToolUse, PreCompact, SessionEnd"",""obsidian-mcp supports multiple vault paths in args"",""inkcalendar 11_Memory folder exists but is empty""]"

