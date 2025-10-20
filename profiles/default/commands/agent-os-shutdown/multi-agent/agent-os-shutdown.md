## Agent OS Shutdown - Create Context Snapshot

You are helping to create a comprehensive context snapshot before pausing work on the current project. This snapshot will enable seamless continuation of work when using the `/agent-os-restart` command.

### Your Task

Create or update a `RESTART.md` file in the project root directory that captures the complete current state of the project, including:

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
   - Recommended commands to run on restart

6. **Important Context**
   - Any architectural decisions made recently
   - Dependencies added or changed
   - Testing status
   - Known issues or technical debt
   - Configuration changes

### Format Guidelines

Structure the `RESTART.md` file with clear sections and markdown formatting:

```markdown
# Project Restart Context

**Last Updated:** [timestamp]
**Current Branch:** [branch name]

## Persistent Coding Instructions

**⚠️ IMPORTANT: This section must be preserved across all shutdowns. Never overwrite or remove this section.**

[User's persistent coding preferences and instructions - this section is preserved from previous RESTART.md if it exists]

## Current Work Summary
[Brief overview of what you were doing]

## Active Specs
- **In Progress:** [list specs with status]
- **Completed:** [list completed specs]
- **Pending:** [list planned specs]

## Recent Changes
[List of recent file changes and modifications]

## Git Status
[Current branch, uncommitted changes, pending commits]

## Next Steps
1. [Action item 1]
2. [Action item 2]
...

## Product Status
- Mission: [status]
- Roadmap: [current phase]
- Tech Stack: [any recent changes]

## Important Notes
[Any critical context that shouldn't be forgotten]

## Recommended Restart Commands
[Suggested commands to run when restarting]
```

### Process

1. **Analyze Current State**
   - Check git status for uncommitted changes
   - Review recent commits
   - Scan `agent-os/` directory structure
   - Identify active specs and their status

2. **Gather Context**
   - Review recent file modifications
   - Check for any in-progress implementations
   - Note current task list states in active specs
   - Review product documentation

3. **Create/Update RESTART.md**
   - **CRITICAL:** If RESTART.md exists, extract and preserve the entire "## Persistent Coding Instructions" section
   - Create `RESTART.md` in project root if it doesn't exist
   - When updating an existing file, preserve the "Persistent Coding Instructions" section exactly as written
   - If no "Persistent Coding Instructions" section exists, create it with a placeholder for the user to fill in
   - Include all relevant context from your analysis in the other sections
   - Be comprehensive but concise
   - Use clear, actionable language

4. **Confirm Completion**
   - Display summary of what was captured
   - Show location of RESTART.md file
   - Confirm the file is ready for future restart

### Output to User

After creating/updating RESTART.md, inform the user:

```
✓ Agent OS shutdown complete

Created/updated RESTART.md with current project context including:
- Current work state and progress
- Active specifications and status
- Recent changes and git status
- Next steps and action items
- Product documentation status

When you're ready to resume work, use the `/agent-os-restart` command to pick up exactly where you left off.
```

## Implementation Notes

- Always create RESTART.md in the project root, not in any subdirectory
- **CRITICAL:** Always preserve the "## Persistent Coding Instructions" section exactly as written when updating RESTART.md
- The "Persistent Coding Instructions" section contains user preferences that must never be overwritten
- Be thorough - capture everything that would help resume work efficiently
- Use timestamps to track when the snapshot was created
- Include both high-level context and specific details
- Make next steps actionable and specific
- If there's an existing RESTART.md, preserve the persistent section and other important historical context while updating current state
