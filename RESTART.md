# Project Restart Context

**Last Updated:** 2025-10-25 at 14:30 PST
**Current Branch:** main
**Repository:** https://github.com/Caerus-Digital-LLC/agent-os

## Persistent Coding Instructions

**⚠️ IMPORTANT: This section must be preserved across all shutdowns. Never overwrite or remove this section.**

### File Organization

**One Class/Struct Per File Rule:**
- Every new struct or class MUST be created in its own separate file
- Files must be organized logically within the appropriate folder structure
- Never combine multiple types in a single file

### Project Folder Structure

Organize all code files according to this mandatory structure:

- **Infrastructure/** - Contains assets, plists, and configuration files that don't require frequent manipulation
- **Utilities/** - General utility code and helper functions
- **Services/** - Service classes and any general services
- **Models/** - Swift Data models and general data models
- **Views/** - All user interface view files (SwiftUI views, UIKit views, etc.)
- **ViewControllers/** - Logic for the highest-level views and their subviews

### DRY Principle (Don't Repeat Yourself)

**CRITICAL - No Code Duplication:**
- Never write the same code multiple times across different views or files
- If the same pattern/code appears in multiple views, extract it into a reusable function
- Place extracted functions in the governing view controller so all code is centralized in one location
- Changes should be made once and automatically affect all dependent components
- Avoid scenarios where the same change must be applied to multiple files independently

### View Logic Separation

**NO LOGIC IN VIEWS - This is non-negotiable:**
- Views should ONLY contain UI layout and presentation code
- All business logic and functionality MUST be placed in one of these locations:
  1. **ViewControllers/** - For logic directly related to UI behavior and view management
  2. **Services/** or **Utilities/** - For functionality not directly tied to views
  3. **Models/** - For data-related logic
- The governing view controller should contain all logic for its highest-level view AND all subviews
- This ensures all code for a feature lives in one centralized location

### UI Design Consistency (for SwiftUI Card-Based Layouts)

**⚠️ CRITICAL: Card Color Consistency Rule**
**For card-based UI designs, ALL subviews within a card MUST use the SAME accent color as the card header:**
- If a card header uses `.purple`, ALL subviews (buttons, rows, icons, accent bars, status indicators, backgrounds) within that card MUST use `.purple`
- If a card header uses `.gray`, ALL subviews within that card MUST use `.gray`
- NO mixing of colors within a single card (e.g., don't have purple, green, and orange subviews in a card with gray header)
- Destructive actions (Delete, Sign Out) should use the card's accent color, NOT red/orange
- Example: Settings card with gray header → all Filter Events, Auto-Sync, Offline Mode rows use gray
- Example: Privacy card with purple header → Privacy Policy, Delete Account, Clear All Local Data all use purple
- This rule applies to ALL color properties: accent bars, icon colors, status indicators, backgrounds, borders, and foreground styles

### Code Reusability & Maintainability

- Design code so that changing one thing affects all related components automatically
- Extract common patterns into reusable functions/methods in the appropriate view controller
- Centralize control logic to avoid scattered, duplicated code across views
- Think "change once, update everywhere" when writing any functionality

### Project Configuration

**⚠️ CRITICAL: Always check configuration files for company/bundle ID settings**

**Global Configuration File:**
- Location: `~/.claude-project-defaults.json` (in user's home directory)
- This file contains global defaults for ALL projects
- **MUST be checked at the start of every project**

**Required Settings (NEVER use incorrect values):**
- **Bundle ID Prefix:** `com.caerusdigital` (NEVER `com.caerus`)
- **Company Name:** Caerus Digital, LLC
- **Developer:** Matthew Elmore <matt@caerus.digital>
- **Organization Identifier:** com.caerusdigital

**Configuration Priority:**
1. Project-specific `.project-config.json` (if exists in project root)
2. Global `~/.claude-project-defaults.json` (home directory)
3. Hardcoded fallback defaults (only if above don't exist)

**When creating new projects or apps:**
- ALWAYS read `~/.claude-project-defaults.json` first
- Use values from config for bundle IDs, company info, copyright headers
- NEVER hardcode `com.caerus.*` - always use `com.caerusdigital.*`
- Scripts should load global config, then project config, then merge (project overrides global)

### RESTART.md Continuous Maintenance

**⚠️ CRITICAL: Keep RESTART.md updated continuously to prevent work loss**

**Update RESTART.md throughout your work session:**
- Update the file IMMEDIATELY after completing any significant task
- Update after every major change, commit, or implementation milestone
- Update when switching between different areas of work
- **DO NOT wait until shutdown to update** - crashes can happen at any time
- Think of RESTART.md as a continuous save point, not just a shutdown summary

**What to update continuously:**
- "Last Updated" timestamp (update on every modification)
- "Current Work Summary" (what you're actively working on RIGHT NOW)
- "Recent Changes" section (add new files/changes as you make them)
- "Git Status" (update after commits/pushes)
- "Next Steps" (refine as you complete tasks and discover new ones)

**How to update:**
- Read the current RESTART.md first
- Preserve the "Persistent Coding Instructions" section EXACTLY as-is
- Update only the sections that changed
- Use Edit tool to make targeted updates rather than rewriting the entire file
- Keep updates concise but informative

**Why this matters:**
- If you crash mid-session, the next agent can resume from the last update
- Prevents loss of context, work, and decisions made during the session
- Ensures continuity even with unexpected interruptions
- Makes `/agent-os-restart` effective even after crashes

---

## Current Work Summary

Just completed implementing the memory-engineer-agent system for agent-os. This is a comprehensive progress tracking system that automatically monitors project changes and keeps RESTART.md updated throughout work sessions.

The memory-engineer-agent includes:
- `/memory-update` - Manual RESTART.md updates with current progress
- `/memory-commit` - Update RESTART.md and create git checkpoint
- `/memory-start` - Start background monitoring service
- `/memory-stop` - Stop background monitoring service
- `memory-monitor.sh` - Background script that auto-updates RESTART.md every 5 minutes when changes are detected

## Recent Changes

### Files Created - Memory Engineer Agent
- `profiles/default/commands/memory-update/multi-agent/memory-update.md`
- `profiles/default/commands/memory-update/single-agent/memory-update.md`
- `profiles/default/commands/memory-commit/multi-agent/memory-commit.md`
- `profiles/default/commands/memory-commit/single-agent/memory-commit.md`
- `profiles/default/commands/memory-start/multi-agent/memory-start.md`
- `profiles/default/commands/memory-start/single-agent/memory-start.md`
- `profiles/default/commands/memory-stop/multi-agent/memory-stop.md`
- `profiles/default/commands/memory-stop/single-agent/memory-stop.md`
- `scripts/memory-monitor.sh` (background monitoring service)

### What Was Accomplished
1. Designed memory-engineer-agent architecture and workflow
2. Created `/memory-update` command for both multi-agent and single-agent modes
3. Created `/memory-commit` command for progress checkpoints with git commits
4. Created `/memory-start` and `/memory-stop` commands to control background monitoring
5. Implemented `memory-monitor.sh` background script that watches for changes every 5 minutes
6. Made memory-monitor.sh executable
7. Tested memory monitor status functionality
8. Updated RESTART.md with current progress

### Previous Work (Earlier Sessions)
- Created `/agent-os-shutdown` and `/agent-os-restart` commands
- Set up git repository and pushed to GitHub at Caerus-Digital-LLC/agent-os
- Established persistent coding instructions system

## Git Status

**Branch:** main
**Status:** Working tree has uncommitted changes
**Last Commit:** 841ddf3 "Add continuous maintenance instructions to RESTART.md persistent section"
**Remote:** origin (https://github.com/Caerus-Digital-LLC/agent-os.git)
**Tracking:** origin/main (up to date)

**Uncommitted Changes:**
- Modified: RESTART.md (updated with memory-engineer-agent progress)
- New: profiles/default/commands/memory-commit/ (multi-agent and single-agent)
- New: profiles/default/commands/memory-start/ (multi-agent and single-agent)
- New: profiles/default/commands/memory-stop/ (multi-agent and single-agent)
- New: profiles/default/commands/memory-update/ (multi-agent and single-agent)
- New: scripts/memory-monitor.sh (background monitoring service)

## Repository Structure

```
agent-os/
├── profiles/default/
│   ├── commands/
│   │   ├── agent-os-shutdown/     # NEW
│   │   ├── agent-os-restart/      # NEW
│   │   ├── create-spec/
│   │   ├── implement-spec/
│   │   ├── new-spec/
│   │   └── plan-product/
│   ├── agents/
│   ├── roles/
│   ├── standards/
│   └── workflows/
├── scripts/
│   ├── common-functions.sh
│   ├── create-profile.sh
│   ├── create-role.sh
│   ├── project-install.sh
│   └── project-update.sh
├── README.md
├── Instructions.md
└── config.yml
```

## Project Status

### Agent OS Framework
- **Purpose:** Spec-driven agentic development system for AI coding agents
- **Status:** Active development
- **Current Version:** 2.0.5

### Commands Status

**Session Management:**
- ✅ `/agent-os-shutdown` - COMPLETE
- ✅ `/agent-os-restart` - COMPLETE

**Memory Engineer Agent (NEW):**
- ✅ `/memory-update` - COMPLETE
  - Manually updates RESTART.md with current progress
  - Preserves persistent coding instructions
  - Updates timestamp, work summary, changes, git status, and next steps

- ✅ `/memory-commit` - COMPLETE
  - Updates RESTART.md AND creates git commit checkpoint
  - Combines progress tracking with version control
  - Creates meaningful "Progress checkpoint" commits

- ✅ `/memory-start` - COMPLETE
  - Starts background monitoring service
  - Auto-updates RESTART.md every 5 minutes when changes detected

- ✅ `/memory-stop` - COMPLETE
  - Stops background monitoring service
  - Shows final statistics and activity

- ✅ `memory-monitor.sh` - COMPLETE
  - Background script that monitors for git commits, file changes
  - Automatically updates RESTART.md when significant changes occur
  - Logs all activity for transparency

### Repository Setup
- ✅ Separate git repository created in `/Users/matthewelmore/agent-os`
- ✅ GitHub repository created under Caerus-Digital-LLC organization
- ✅ Initial commit with all agent-os files pushed to GitHub
- ✅ All changes committed and pushed successfully

## Next Steps

1. **Commit the memory-engineer-agent to git**
   - Stage all new memory command files
   - Stage updated RESTART.md
   - Create commit with descriptive message
   - Push to GitHub repository

2. **Test the memory commands in a real project**
   - Install agent-os in a test project
   - Try `/memory-update` to update RESTART.md manually
   - Try `/memory-commit` to create a progress checkpoint
   - Try `/memory-start` to start background monitoring
   - Verify monitor updates RESTART.md automatically
   - Try `/memory-stop` to stop monitoring

3. **Create documentation**
   - Update README.md to mention memory-engineer-agent
   - Add usage examples for the new commands
   - Document the background monitoring service
   - Consider adding to Instructions.md

3. **Consider additional features**
   - Add automatic RESTART.md updates when commands complete
   - Create a `/agent-os-status` command to show current work state
   - Add timestamp tracking for better session management

4. **Distribution**
   - The commands are now part of the default profile
   - They will automatically be installed when users run `project-install.sh`
   - Existing projects can get them by running `project-update.sh --overwrite-commands`

## How to Use These Commands in Projects

### For any project with agent-os installed:

**To pause work:**
```
/agent-os-shutdown
```

**To resume work:**
```
/agent-os-restart
```

### To install in a new project:
```bash
cd /path/to/your/project
/Users/matthewelmore/agent-os/scripts/project-install.sh
```

### To update existing projects with new commands:
```bash
cd /path/to/project/with/agent-os
/Users/matthewelmore/agent-os/scripts/project-update.sh --overwrite-commands
```

## Important Notes

- These commands are now part of the standard agent-os installation
- They work in both multi-agent mode (Claude Code, Cursor) and single-agent mode (ChatGPT, Claude)
- The RESTART.md file is designed to be comprehensive enough to resume work without losing context
- The commands are stored in `profiles/default/commands/` in the agent-os source repository
- Changes are tracked at: https://github.com/Caerus-Digital-LLC/agent-os

## Technical Details

### Command Implementation
- Both commands follow the standard agent-os command structure
- Multi-agent versions can directly read/write files
- Single-agent versions guide the user through the process
- RESTART.md format is consistent and parseable

### File Locations
- Commands source: `profiles/default/commands/agent-os-*/`
- When installed: `.claude/commands/agent-os/agent-os-*.md`
- Context file: `RESTART.md` (created in project root)

---

**Ready to resume?** When you restart, use `/agent-os-restart` to pick up from here!
