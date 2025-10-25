## Memory Update - Update Progress Snapshot

This command helps you update RESTART.md with your current progress to prevent loss of work and maintain project context.

### What This Does

Updates your project's RESTART.md file with:
- Current timestamp and work summary
- Recent file changes and modifications
- Current git status
- Updated next steps

**⚠️ Important:** This preserves your "Persistent Coding Instructions" section - it will never be overwritten.

### Instructions

Follow these steps to update your RESTART.md file:

#### Step 1: Check Current Git Status

Run these commands to gather current project state:

```bash
# Check current branch
git branch --show-current

# Check git status
git status

# See recent commits
git log -5 --oneline
```

#### Step 2: Identify Recent Changes

Note what you've worked on since the last update:
- Which files did you create or modify?
- What features or fixes did you implement?
- What decisions did you make?

#### Step 3: Open RESTART.md

Open the `RESTART.md` file in your project root.

#### Step 4: Update the File

**⚠️ CRITICAL: Do NOT modify the "Persistent Coding Instructions" section**

Update these sections:

1. **At the top:**
   ```markdown
   **Last Updated:** [Current date and time]
   **Current Branch:** [Your current git branch]
   ```

2. **Current Work Summary:**
   Replace with 2-3 sentences describing what you're actively working on RIGHT NOW.

3. **Recent Changes:**
   Add or update with:
   - Files created/modified/deleted since last update
   - New features or fixes implemented
   - Important decisions made

4. **Git Status:**
   Update with:
   - Current branch name
   - Uncommitted changes (if any)
   - Recent commits from step 1
   - Status with remote (ahead/behind)

5. **Next Steps:**
   Update the action items list with:
   - New tasks discovered
   - Mark completed items as done or remove them
   - Keep 3-7 actionable next steps

#### Step 5: Save the File

Save RESTART.md with your updates.

#### Step 6: Confirm

Reply "Done" when you've completed the update.

### What NOT to Do

❌ Do NOT modify the "Persistent Coding Instructions" section
❌ Do NOT remove historical information that's still relevant
❌ Do NOT rewrite the entire file - just update what changed

### Why This Matters

- If your AI session crashes, the next agent can resume from your last update
- Prevents loss of context, decisions, and work progress
- Makes project handoffs and restarts seamless
- Creates a continuous record of your work

### When to Update

Run `/memory-update`:
- After completing a significant task
- After making a series of file changes
- After important commits
- When switching between different work areas
- Periodically during long sessions (every 30-60 minutes)

**Think of this as saving your game progress - do it often!**

---

**Ready to update?** Start with Step 1 above and work through each step.
