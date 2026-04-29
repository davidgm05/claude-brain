# Session: 2026-04-09 - Tools Setup & Obsidian Second Brain

## Date: April 9, 2026
## Session ID: ~12:00 UTC

## What we did today

### 1. Installed Firecrawl
- GitHub: https://github.com/firecrawl/firecrawl
- API Key: `fc-a338c135e3924158b14cdcddfc89ac35`
- Location: `/home/ubuntu/firecrawl/apps/js-sdk/`
- Status: ✅ Working via REST API

### 2. Installed Playwright CLI
- GitHub: https://github.com/microsoft/playwright-cli
- Installed globally: v1.59.1
- Chromium browser installed
- Location: `/home/ubuntu/playwright-cli/`
- Status: ✅ Working - can take screenshots, PDFs, open browsers

### 3. Configured Obsidian Second Brain
- Vault: `/home/ubuntu/SecondBrain/`
- MCP config: `~/.mcp.json` with obsidian-mcp server
- obsidian-mcp npm package installed globally
- Structure: sessions/, projects/, skills/, reflections/
- Status: ⏳ Requires Claude Code restart to activate MCP

## Next Steps
- User will restart Claude Code session
- After restart, MCP should auto-connect to Obsidian vault
- Test by creating a note in the vault

## Notes
- Firecrawl API has ~500 credits/month free tier
- obsidian-mcp is a simple MCP server that reads/writes markdown files
- The vault path `/home/ubuntu/SecondBrain` was manually created with proper structure
