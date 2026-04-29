---
created: 2026-04-21
project: ubuntu
type: discovery
tags: [imported, claude-mem]
observation_id: 1716
---

# "Plugin install syntax requires @ format"

**Subtitle:** "Marketplace specified using plugin@marketplace format, not --marketplace flag"


## Narrative
"The agent discovered the correct syntax for installing plugins from specific marketplaces after several failed attempts. The `claude plugin install --help` output revealed that the format requires `@` notation (e.g., `plugin@marketplace`) rather than a `--marketplace` flag."


## Facts
"[""Correct syntax is `plugin@marketplace` format (e.g., `code-review@claude-plugins-official`)"",""Scope options: user (default), project, or local"",""Marketplace must be explicitly included in plugin name with @ separator""]"

