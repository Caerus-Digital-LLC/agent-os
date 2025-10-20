## Agent OS Shutdown - Create Context Snapshot

You are helping to create a comprehensive context snapshot before pausing work on the current project. This snapshot will enable seamless continuation of work when restarting.

### Your Task

Create or update a `RESTART.md` file in the project root directory that captures the complete current state of the project.

### Information to Capture

1. **Current Work Context**
   - What you were working on when shutdown was initiated
   - Which spec/feature you were implementing (if any)
   - Current phase of work (planning, specification, implementation, etc.)
   - Any in-progress tasks or partially completed work

2. **Project State**
   - Recent changes made to the codebase
   - Files that were modified or created recently
   - Any pending commits or uncommitted changes
   - Current git branch

3. **Active Specifications**
   - List all specs in `agent-os/specs/` directory
   - Identify which specs are in progress vs completed
   - Note any specs that need attention or follow-up

4. **Product Documentation Status**
   - Status of product mission, roadmap, and tech stack
   - Any recent updates to product documentation
   - Items on the roadmap that are completed or in progress

5. **Next Steps**
   - Clear action items for when work resumes
   - Priority tasks to tackle next
   - Any blockers or issues that need addressing
   - Recommended next prompts to use

6. **Important Context**
   - Any architectural decisions made recently
   - Dependencies added or changed
   - Testing status
   - Known issues or technical debt
   - Configuration changes

### Format for RESTART.md

Use this structure:

```markdown
# Project Restart Context

**Last Updated:** [current date and time]
**Current Branch:** [git branch name]

## Persistent Coding Instructions

**⚠️ IMPORTANT: This section must be preserved across all shutdowns. Never overwrite or remove this section.**

[User's persistent coding preferences and instructions - this section is preserved from previous RESTART.md if it exists]

## Current Work Summary
[Brief overview of what you were doing - 2-3 sentences]

## Active Specs
- **In Progress:** [list specs with status]
- **Completed:** [list completed specs]
- **Pending:** [list planned specs]

## Recent Changes
[List of recent file changes and modifications]

## Git Status
[Current branch, uncommitted changes, pending commits]

## Next Steps
1. [Specific action item 1]
2. [Specific action item 2]
3. [Specific action item 3]
...

## Product Status
- Mission: [status and location]
- Roadmap: [current phase and progress]
- Tech Stack: [any recent changes or notes]

## Important Notes
[Any critical context that shouldn't be forgotten]

## Recommended Next Prompts
[Specific prompts or commands to use when restarting, e.g., "Copy the prompt from .agent-os/commands/implement-spec/single-agent/1-implement.md"]
```

### Process to Follow

1. **Analyze Current State**
   - Ask the user to run: `git status`
   - Ask the user to run: `git log -5 --oneline`
   - Ask the user to run: `ls -la agent-os/specs/`
   - Review what you know about recent work

2. **Gather Context**
   - Review recent file modifications the user shares
   - Identify any in-progress implementations
   - Note current task list states in active specs
   - Review product documentation status

3. **Create/Update RESTART.md**
   - **CRITICAL:** If RESTART.md exists, extract and preserve the entire "## Persistent Coding Instructions" section
   - Create `RESTART.md` in project root if it doesn't exist
   - When updating an existing file, preserve the "Persistent Coding Instructions" section exactly as written
   - If no "Persistent Coding Instructions" section exists in RESTART.md:
     - Check if `agent-os/standards/global/conventions.md` exists
     - If it does, extract the key organizational principles (File Organization, Project Folder Structure, DRY Principle, View Logic Separation, Code Reusability sections) and use them to populate the Persistent Coding Instructions section
     - If conventions.md doesn't exist, create a basic placeholder section
     - Add the warning: "**⚠️ IMPORTANT: This section must be preserved across all shutdowns. Never overwrite or remove this section.**"
   - Include all relevant context from your analysis in the other sections
   - Be comprehensive but concise
   - Use clear, actionable language
   - Include specific file paths and commands

4. **Confirm Completion**
   - Show the user the contents of RESTART.md
   - Confirm the file was created/updated
   - Explain how to use it when restarting

### What to Tell the User

After creating/updating RESTART.md:

```
✓ Agent OS shutdown complete

I've created/updated RESTART.md with current project context including:
- Current work state and progress
- Active specifications and status
- Recent changes and git status
- Next steps and action items
- Product documentation status

When you're ready to resume work:
1. Share the contents of RESTART.md with me
2. Or copy and paste the prompt from .agent-os/commands/agent-os-restart/single-agent/agent-os-restart.md
3. We'll pick up exactly where you left off
```

### Important Notes

- Create RESTART.md in the project root directory
- **CRITICAL:** Always preserve the "## Persistent Coding Instructions" section exactly as written when updating RESTART.md
- The "Persistent Coding Instructions" section contains user preferences that must never be overwritten
- Be thorough - capture everything needed to resume work efficiently
- Include timestamps to track when the snapshot was created
- Make next steps specific and actionable
- If updating existing RESTART.md, preserve the persistent section and other important historical context
- Ask the user to share output from git commands if needed
