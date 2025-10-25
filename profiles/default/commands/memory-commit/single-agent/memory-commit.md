## Memory Commit - Update Progress and Create Git Checkpoint

This command helps you update RESTART.md with current progress AND create a git commit to preserve this checkpoint in version control.

### What This Does

1. Updates RESTART.md with current project state (same as `/memory-update`)
2. Creates a git commit with RESTART.md and your recent changes
3. Optionally pushes to remote repository

### Instructions

Follow these steps to create a progress checkpoint:

#### Step 1: Update RESTART.md

First, update your RESTART.md file using the `/memory-update` command or manually:

1. Open `RESTART.md` in your project root
2. **⚠️ Do NOT modify the "Persistent Coding Instructions" section**
3. Update these sections:
   - "Last Updated" timestamp
   - "Current Branch" name
   - "Current Work Summary" - what you're working on now
   - "Recent Changes" - files/features you just completed
   - "Git Status" - current branch and commits
   - "Next Steps" - updated priorities

4. Save the file

#### Step 2: Review Changes

Check what will be included in the commit:

```bash
# See what files changed
git status

# Review the actual changes
git diff

# See what's staged
git diff --staged
```

#### Step 3: Stage Files

Add the files you want to commit:

```bash
# Always include RESTART.md
git add RESTART.md

# Add other files that represent completed or checkpoint-worthy work
git add path/to/file1.js
git add path/to/file2.js

# Or add all changes (be careful with this)
git add .
```

**⚠️ Warning:** Don't commit:
- Files with secrets (.env, credentials.json, etc.)
- Large binary files (unless appropriate)
- Incomplete/broken code (unless it's a safe checkpoint)

#### Step 4: Create Commit

Create a meaningful "progress checkpoint" commit:

```bash
git commit -m "Progress checkpoint: [brief description]

- [change 1]
- [change 2]
- [change 3]
- Updated RESTART.md with progress

🤖 Generated with [Claude Code](https://claude.com/claude-code)

Co-Authored-By: Claude <noreply@anthropic.com>"
```

**Examples of good commit messages:**

```bash
git commit -m "Progress checkpoint: Implement user authentication

- Created login and signup UI components
- Implemented JWT token handling
- Added authentication middleware
- Updated RESTART.md with progress

🤖 Generated with [Claude Code](https://claude.com/claude-code)

Co-Authored-By: Claude <noreply@anthropic.com>"
```

```bash
git commit -m "Progress checkpoint: Fix navigation bugs

- Resolved back button issue in settings
- Fixed breadcrumb state management
- Updated RESTART.md with progress

🤖 Generated with [Claude Code](https://claude.com/claude-code)

Co-Authored-By: Claude <noreply@anthropic.com>"
```

#### Step 5: Push to Remote (Optional)

If you want to backup to remote repository:

```bash
# Check if remote exists
git remote -v

# Push to remote
git push

# If this is a new branch
git push -u origin [branch-name]
```

**⚠️ Don't use** `git push --force` unless you're absolutely sure!

#### Step 6: Verify

Check that everything worked:

```bash
# See your new commit
git log -1

# Check status
git status
```

#### Step 7: Confirm

Reply "Done" when you've completed the checkpoint commit.

### When to Use `/memory-commit`

Create progress checkpoints:
- ✓ After completing a feature or significant task
- ✓ Before switching to work on something completely different
- ✓ At the end of a productive work session
- ✓ When you want to preserve a known-good state
- ✓ Periodically during long implementations (every 1-2 hours)

### Benefits

- **Version Control:** Progress saved in git history
- **Rollback Safety:** Easy to revert if something breaks
- **Work History:** Clear progression of implementation
- **Context Preservation:** RESTART.md updated at same time
- **Crash Recovery:** Even if session ends, checkpoint is committed

### What Makes a Good Progress Checkpoint?

✓ **DO:**
- Commit logical units of work
- Include descriptive commit message
- Update RESTART.md before committing
- Stage related files together
- Create checkpoints regularly

❌ **DON'T:**
- Commit broken/incomplete code (unless safe)
- Include secrets or credentials
- Force push without good reason
- Skip updating RESTART.md
- Make commits too large or too small

---

**Ready to create a progress checkpoint?** Start with Step 1 above and work through each step.

**Quick Tip:** You can run `/memory-commit` multiple times during a feature implementation to create regular checkpoints!
