---
created: 2026-04-21
project: ubuntu
type: discovery
tags: [imported, claude-mem]
observation_id: 1715
---

# "Plugin install syntax discovery"

**Subtitle:** "--marketplace flag is not valid for claude plugin install command"


## Narrative
"While exploring plugin installation, the agent discovered that the `--marketplace` flag is not a valid option for the `claude plugin install` command. This is a gotcha about the CLI syntax that the agent will need to work around."


## Facts
"[""`claude plugin install code-review --marketplace claude-plugins-official` returns error: \""unknown option '--marketplace'\"""",""Plugin marketplace must be specified differently or defaults to installed marketplace""]"

