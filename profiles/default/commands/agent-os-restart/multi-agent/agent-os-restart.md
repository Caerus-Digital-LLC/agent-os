## Agent OS Restart - Resume from Context Snapshot

You are helping to resume work on the current project by loading and processing the context snapshot from `RESTART.md`.

### Your Task

Read the `RESTART.md` file and use it to seamlessly resume work exactly where it was left off.

### Process

1. **Load Context Snapshot**
   - Read the `RESTART.md` file from the project root
   - If RESTART.md doesn't exist, inform the user and offer to help them get started with product planning or spec creation

2. **Analyze and Summarize**
   - Parse the context information
   - Understand what was being worked on
   - Identify the current state of all active work
   - Note any blocking issues or important context

3. **Present Status to User**
   Display a comprehensive summary including:
   - Brief overview of where work was left off
   - Current specs and their status
   - Recent changes made
   - Next steps that were identified
   - Any important notes or blockers

4. **Prepare to Continue**
   - Ask the user which next step they'd like to tackle first
   - Offer to continue with the recommended next steps from RESTART.md
   - Be ready to execute the appropriate workflow commands

### Output Format

Present the restart information clearly:

```markdown
## Welcome Back to [Project Name]

### Last Session Summary
[Brief overview of what was being worked on]

**Last Updated:** [timestamp from RESTART.md]
**Current Branch:** [git branch]

### Active Work

**In Progress:**
- [List specs/features currently being worked on]

**Recently Completed:**
- [List recently finished items]

**Pending:**
- [List items planned but not started]

### Current State

**Recent Changes:**
[Highlight key changes from last session]

**Git Status:**
[Current branch and any pending commits]

### Recommended Next Steps

Based on where we left off, here are the recommended next actions:

1. [Next step 1 with specific command if applicable]
2. [Next step 2 with specific command if applicable]
3. [Next step 3 with specific command if applicable]

### Important Context

[Any critical notes, decisions, or blockers from RESTART.md]

---

**What would you like to work on?**

You can:
- Continue with one of the recommended next steps above
- Work on a specific spec or feature
- Start something new
- Run any Agent OS command (/new-spec, /create-spec, /implement-spec, etc.)

Just let me know what you'd like to tackle!
```

### Handling Different Scenarios

**Scenario 1: Work was in middle of implementation**
- Summarize which tasks were completed vs pending
- Offer to continue implementation with `/implement-spec`
- Highlight which agents should work on remaining tasks

**Scenario 2: Work was in planning/spec phase**
- Show which specs are partially complete
- Offer to continue with `/create-spec` or relevant workflow
- Note what research or requirements were gathered

**Scenario 3: Between features**
- Show roadmap status
- Suggest next feature to tackle
- Offer to start new spec with `/new-spec`

**Scenario 4: No RESTART.md exists**
- Inform user that no restart context was found
- Offer to help with:
  - `/plan-product` if product docs don't exist
  - `/new-spec` if ready to start a feature
  - Review existing specs if they exist

### Key Principles

1. **Be Contextual** - Use all information from RESTART.md to provide relevant guidance
2. **Be Specific** - Reference actual file names, spec names, and task IDs
3. **Be Actionable** - Provide clear next steps and command options
4. **Be Helpful** - Anticipate what the user likely wants to do next
5. **Be Ready** - Prepare to immediately execute whichever command/workflow the user chooses

### Important Notes

- Always read RESTART.md first before responding
- If RESTART.md is outdated (several days old), mention this and offer to update it
- Cross-reference RESTART.md with actual project state (check specs directory, git status, etc.)
- Make it easy for the user to jump right back into productive work
- Update RESTART.md after this restart session if significant new work is done
