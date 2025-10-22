# Project Restart Context

**Last Updated:** 2025-10-19 at 23:07 PST
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

---

## Current Work Summary

Just completed adding two new standard commands to the agent-os framework: `/agent-os-shutdown` and `/agent-os-restart`. These commands help manage context between work sessions by creating and reading comprehensive project snapshots.

## Recent Changes

### Files Created
- `profiles/default/commands/agent-os-shutdown/multi-agent/agent-os-shutdown.md`
- `profiles/default/commands/agent-os-shutdown/single-agent/agent-os-shutdown.md`
- `profiles/default/commands/agent-os-restart/multi-agent/agent-os-restart.md`
- `profiles/default/commands/agent-os-restart/single-agent/agent-os-restart.md`

### What Was Accomplished
1. Created directory structure for new commands
2. Implemented multi-agent version of /agent-os-shutdown command
3. Implemented single-agent version of /agent-os-shutdown command
4. Implemented multi-agent version of /agent-os-restart command
5. Implemented single-agent version of /agent-os-restart command
6. Set up new git repository in agent-os directory
7. Created GitHub repository at Caerus-Digital-LLC/agent-os
8. Committed and pushed all changes

## Git Status

**Branch:** main
**Status:** Clean working tree - all changes committed and pushed
**Last Commit:** ea1fc79 "Add /agent-os-shutdown and /agent-os-restart commands"
**Remote:** origin (https://github.com/Caerus-Digital-LLC/agent-os.git)
**Tracking:** origin/main (up to date)

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

### New Commands Status
- ✅ `/agent-os-shutdown` - COMPLETE
  - Creates RESTART.md with comprehensive project context
  - Captures current work, git status, recent changes, and next steps
  - Supports both multi-agent (Claude Code, Cursor) and single-agent (ChatGPT, Claude) modes

- ✅ `/agent-os-restart` - COMPLETE
  - Reads RESTART.md and provides comprehensive restart summary
  - Helps resume work exactly where it was left off
  - Recommends specific next steps based on context

### Repository Setup
- ✅ Separate git repository created in `/Users/matthewelmore/agent-os`
- ✅ GitHub repository created under Caerus-Digital-LLC organization
- ✅ Initial commit with all agent-os files pushed to GitHub
- ✅ All changes committed and pushed successfully

## Next Steps

1. **Test the new commands in an actual project**
   - Install agent-os in a test project or existing project
   - Run `/agent-os-shutdown` to create a RESTART.md
   - Close the session, then run `/agent-os-restart` to verify it works correctly

2. **Update documentation**
   - Consider adding documentation about the new commands to Instructions.md
   - Update README.md to mention the new commands

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
