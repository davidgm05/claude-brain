---
created: 2026-04-21
project: ubuntu
type: discovery
tags: [imported, claude-mem]
observation_id: 1711
---

# "Skill injector searches two user directories"

**Subtitle:** "Learned skill locations: global ~/.omc/skills and user config dir"


## Narrative
"Investigation of the skill injector script revealed the two directories it scans for skills: a global location under the user's home directory (~/.omc/skills) and a user-configured location inside the oh-my-claude-sisyphus package directory. Skills are markdown files (.md). Max 5 skills per session are injected."


## Facts
"[""Global skills directory: ~/.omc/skills (under home directory)"",""User skills directory: cfgDir/skills/omc-learned (config-based path)"",""Skill files use .md extension"",""Skill injector is located in oh-my-claude-sisyphus npm package at scripts/skill-injector.mjs""]"

