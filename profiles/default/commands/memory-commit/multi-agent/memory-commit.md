## Memory Commit - Update Progress and Create Commit

You are helping to update RESTART.md with current progress and create a git commit to preserve this checkpoint.

### Your Task

1. Update the `RESTART.md` file with current project state (same as `/memory-update`)
2. Create a git commit with RESTART.md and optionally other staged/modified files
3. Push to remote if appropriate

### Process

#### Step 1: Update RESTART.md

Follow the same process as `/memory-update`:

1. **Read Current RESTART.md**
   - Load the existing file
   - Identify the "Persistent Coding Instructions" section boundaries

2. **Gather Current State**
   - Run `git status` to check uncommitted changes
   - Run `git log -5 --oneline` to see recent commits
   - Run `git branch --show-current` for current branch
   - Run `git diff --stat` to see what changed

3. **Update RESTART.md**
   - Update "Last Updated" timestamp
   - Update "Current Branch" if changed
   - **Preserve "Persistent Coding Instructions" section EXACTLY**
   - Update "Current Work Summary" with current focus
   - Update "Recent Changes" with new modifications
   - Update "Git Status" with current state
   - Update "Next Steps" with current priorities

#### Step 2: Review What to Commit

Check what files have changes:
- Run `git status` to see all modified/new files
- Run `git diff` to review changes
- Determine which files should be included in this progress commit

#### Step 3: Create Progress Commit

Create a meaningful commit that captures this checkpoint:

1. **Stage Files**
   - Always stage RESTART.md
   - Stage other files if they represent completed work or logical checkpoint
   - If files are partially complete, consider if they should be committed

2. **Craft Commit Message**
   - Use format: "Progress checkpoint: [brief description]"
   - First line: Concise summary of what was accomplished
   - Body: Bullet points of specific changes if needed
   - Include standard footer:
     ```

     🤖 Generated with [Claude Code](https://claude.com/claude-code)

     Co-Authored-By: Claude <noreply@anthropic.com>
     ```

3. **Examples of Good Commit Messages:**
   ```
   Progress checkpoint: Implement user authentication flow

   - Created login/signup UI components
   - Implemented JWT token handling
   - Added auth middleware
   - Updated RESTART.md with progress

   🤖 Generated with [Claude Code](https://claude.com/claude-code)

   Co-Authored-By: Claude <noreply@anthropic.com>
   ```

   ```
   Progress checkpoint: Fix navigation bugs

   - Resolved back button issue in settings
   - Fixed breadcrumb state management
   - Updated RESTART.md with progress

   🤖 Generated with [Claude Code](https://claude.com/claude-code)

   Co-Authored-By: Claude <noreply@anthropic.com>
   ```

4. **Create the Commit**
   - Use heredoc format for multi-line messages:
     ```bash
     git add RESTART.md [other-files]
     git commit -m "$(cat <<'EOF'
     Progress checkpoint: [description]

     - [change 1]
     - [change 2]
     - Updated RESTART.md with progress

     🤖 Generated with [Claude Code](https://claude.com/claude-code)

     Co-Authored-By: Claude <noreply@anthropic.com>
     EOF
     )"
     ```

#### Step 4: Consider Pushing

After committing:
- Check if there's a remote: `git remote -v`
- Check branch tracking: `git branch -vv`
- If appropriate and safe, push to remote: `git push`
- **Don't force push** unless explicitly requested by user

#### Step 5: Confirm to User

Show summary of what was done:
```
✓ Progress checkpoint created

Commit: [short hash] "Progress checkpoint: [description]"

Updated RESTART.md and committed:
- RESTART.md (updated with current progress)
- [list of other files]

[Pushed to remote / Ready to push when needed]
```

### Critical Rules

**⚠️ NEVER modify the "Persistent Coding Instructions" section in RESTART.md**

**Commit Safety:**
- Don't commit files with secrets (.env, credentials.json, etc.)
- Don't commit large binary files unless appropriate
- Don't force push to main/master
- Don't amend commits from other developers
- Don't skip git hooks unless user explicitly requests it

### When to Use This Command

Use `/memory-commit` to create progress checkpoints:
- After completing a feature or significant task
- Before switching to work on something completely different
- At the end of a productive work session
- When you want to preserve a known-good state
- Periodically during long implementations (every 1-2 hours)

**Benefits:**
- Creates version-controlled progress snapshots
- Makes it easy to roll back if needed
- Provides clear history of work progression
- Updates RESTART.md at the same time
- Preserves context even if session crashes after commit

### Implementation Notes

- This combines `/memory-update` + git commit in one command
- Always update RESTART.md before committing
- Commit message should reflect actual work done, not just "update RESTART.md"
- Include RESTART.md in commit but don't make it the primary focus
- This is a "progress" commit, not a "feature complete" commit
- Can be run multiple times during implementation
- Safe to use - won't overwrite or lose work
