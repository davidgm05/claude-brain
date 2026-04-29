---
created: 2026-04-21
project: ubuntu
type: discovery
tags: [imported, claude-mem]
observation_id: 1723
---

# "Keyword Detector Hook Enables Autonomous Skill Activation"

**Subtitle:** "A Node.js hook at ~/.claude/hooks/keyword-detector.mjs monitors input and auto-triggers skill modes"


## Narrative
"The primary session is investigating the keyword detector hook that implements the autonomous skill activation system. This Node.js hook (keyword-detector.mjs) monitors user input for predefined ""magic keywords"" and automatically triggers corresponding skill modes without explicit /slash commands. When a keyword like ""tdd"" or ""code review"" is detected, the hook injects a mode-specific message that activates the appropriate workflow. The hook prioritizes keywords in a specific order and includes modes for parallel execution (ultrawork), extended reasoning (ultrathink), security reviews, and tri-model orchestration (ccg). This is the core mechanism enabling the context-driven autonomous agent behavior the user requested."


## Facts
"[""The keyword detector hook parses user input for magic keywords and automatically activates corresponding skill modes"",""Supported keywords include: ralph (persistence mode), autopilot (autonomous execution), ultrawork/ulw (parallel execution), tdd, code review, security review, ultrathink, deepsearch, analyze, deep interview, ai-slop-cleaner, ccg (tri-model orchestration), ralplan (iterative planning)"",""The hook uses atomic file writes and dynamic imports for cross-platform compatibility (Windows, macOS, Linux)"",""Hook structure includes message constants (ULTRATHINK_MESSAGE, TDD_MESSAGE, CODE_REVIEW_MESSAGE, SECURITY_REVIEW_MESSAGE, SEARCH_MESSAGE) that are injected when keywords are detected"",""The hook is located at /home/ubuntu/.claude/hooks/keyword-detector.mjs and imports shared modules from a lib directory""]"

