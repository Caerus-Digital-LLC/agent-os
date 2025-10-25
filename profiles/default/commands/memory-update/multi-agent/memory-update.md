## Memory Update - Update Progress Snapshot

You are helping to update the RESTART.md file with current progress. This keeps project context fresh and prevents loss of work if the session ends unexpectedly.

### Your Task

Update the `RESTART.md` file in the project root directory to reflect the current state of work, including recent progress, changes, and next steps.

### What to Update

1. **Timestamp**
   - Update "Last Updated" to current date/time
   - Update "Current Branch" if it changed

2. **Current Work Summary**
   - Brief description of what you're currently working on
   - Replace with current focus, not historical work
   - Keep it concise (2-3 sentences)

3. **Recent Changes**
   - Files created, modified, or deleted since last update
   - New features or fixes implemented
   - Any significant decisions or changes made

4. **Git Status**
   - Current branch name
   - Uncommitted changes (if any)
   - Recent commits since last update
   - Push/pull status with remote

5. **Next Steps**
   - Update with current priorities
   - Add new tasks discovered during work
   - Mark completed tasks as done or remove them
   - Keep 3-7 actionable next steps

### Critical Rules

**⚠️ NEVER modify or remove the "Persistent Coding Instructions" section**
- This section contains user preferences that must survive all updates
- Always preserve it exactly as written
- It should be between the header and "Current Work Summary"

### Process

1. **Read Current RESTART.md**
   - Load the existing file
   - Identify the "Persistent Coding Instructions" section boundaries
   - Note what sections need updating

2. **Gather Current State**
   - Run `git status` to check uncommitted changes
   - Run `git log -5 --oneline` to see recent commits
   - Run `git branch --show-current` for current branch
   - Check what files changed recently

3. **Update RESTART.md**
   - Update "Last Updated" timestamp
   - Update "Current Branch" if changed
   - **Preserve "Persistent Coding Instructions" section EXACTLY**
   - Update "Current Work Summary" with current focus
   - Update "Recent Changes" with new modifications
   - Update "Git Status" with current state
   - Update "Next Steps" with current priorities
   - Keep other sections as-is unless they need updating

4. **Confirm to User**
   - Show brief summary of what was updated
   - Confirm RESTART.md is current

### Output to User

After updating RESTART.md, inform the user:

```
✓ RESTART.md updated successfully

Updated sections:
- Timestamp: [new timestamp]
- Current Work Summary: [brief summary]
- Recent Changes: [X files/features updated]
- Git Status: [branch and commit info]
- Next Steps: [X action items]

RESTART.md is now current and ready for session recovery.
```

### Implementation Notes

- **CRITICAL:** Never modify the "Persistent Coding Instructions" section
- Only update sections that actually changed
- Keep updates concise but informative
- Use Edit tool for targeted updates rather than rewriting entire file
- If RESTART.md doesn't exist, create it using the format from /agent-os-shutdown
- Update should take < 30 seconds to complete
- This command can be run frequently (after each major task completion)

### When to Use This Command

- After completing a significant task or feature
- After making a series of file changes
- After important commits
- When switching between different work areas
- Periodically during long work sessions (every 30-60 minutes)
- Before taking a break (but not ending the session)

**Think of this as "saving your game progress" - do it often to prevent loss!**
