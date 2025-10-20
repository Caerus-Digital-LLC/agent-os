## Agent OS Restart - Resume from Context Snapshot

You are helping to resume work on the current project by loading and processing the context snapshot from `RESTART.md`.

### Your Task

Help the user resume their work by reading the `RESTART.md` file and providing a comprehensive summary of where they left off, along with actionable next steps.

### Process

**Step 1: Request RESTART.md**

Ask the user to share the contents of their `RESTART.md` file:

```
Please share the contents of your RESTART.md file so I can help you pick up where you left off.

You can either:
1. Copy and paste the contents here, or
2. Run this command and share the output: `cat RESTART.md`

If you don't have a RESTART.md file, let me know and I'll help you get started!
```

**Step 2: Analyze Context (after receiving RESTART.md)**

Once you receive the RESTART.md contents:
- Parse all the context information
- Understand what was being worked on
- Identify the current state of all active work
- Note any blocking issues or important context
- Understand the recommended next steps

**Step 3: Present Comprehensive Summary**

Provide a clear, structured summary:

```markdown
## Welcome Back to [Project Name]!

### Last Session Summary
[Brief overview of what was being worked on from RESTART.md]

**Last Updated:** [timestamp from RESTART.md]
**Current Branch:** [git branch from RESTART.md]

### Active Work Status

**Currently In Progress:**
- [List specs/features currently being worked on]

**Recently Completed:**
- [List recently finished items]

**Planned Next:**
- [List items planned but not started]

### Recent Changes
[Highlight key changes from the last session]

### Current State
**Git Branch:** [branch name]
**Uncommitted Changes:** [yes/no and details]
**Active Spec:** [current spec being worked on, if any]

### Recommended Next Steps

Based on where you left off, here's what I recommend:

1. [Specific next step 1 - include which prompt file to use if applicable]
2. [Specific next step 2 - include which prompt file to use if applicable]
3. [Specific next step 3 - include which prompt file to use if applicable]

### Important Context
[Any critical notes, decisions, or blockers from RESTART.md]

---

### Ready to Continue?

Here are your options:

**Option A: Continue with recommended next steps**
- [Explain what this involves and which prompt to use]

**Option B: Work on a specific item**
- Let me know which spec or task you'd like to focus on

**Option C: Start something new**
- I can help you with:
  - Product planning (use `.agent-os/commands/plan-product/single-agent/step-1-gather-requirements.md`)
  - New feature spec (use `.agent-os/commands/new-spec/single-agent/1-initialize-spec.md`)
  - Or anything else you need

**What would you like to work on?**
```

### Handling Different Scenarios

**Scenario 1: User was in middle of implementation**
```
Based on your RESTART.md, you were implementing [spec name] and had completed [X] out of [Y] tasks.

Next step: Continue implementation
- Copy the prompt from: `.agent-os/commands/implement-spec/single-agent/1-implement.md`
- Focus on these remaining tasks: [list specific tasks]
```

**Scenario 2: User was in planning/spec phase**
```
Based on your RESTART.md, you were working on creating the spec for [feature name].

Next step: Continue specification
- Copy the prompt from: `.agent-os/commands/create-spec/single-agent/[appropriate-step].md`
- We'll pick up with: [specific next action]
```

**Scenario 3: Between features**
```
Based on your RESTART.md, you recently completed [feature] and are ready for the next item on your roadmap.

Next step: Start new feature
- Copy the prompt from: `.agent-os/commands/new-spec/single-agent/1-initialize-spec.md`
- Suggested next feature based on roadmap: [feature name]
```

**Scenario 4: User has no RESTART.md**
```
It looks like you don't have a RESTART.md file yet. No problem!

Let me help you get started. What would you like to do?

1. **Plan your product** - Define mission, roadmap, and tech stack
   - Start with: `.agent-os/commands/plan-product/single-agent/step-1-gather-requirements.md`

2. **Create a feature spec** - Start building a specific feature
   - Start with: `.agent-os/commands/new-spec/single-agent/1-initialize-spec.md`

3. **Something else** - Just let me know what you're working on!
```

### Key Principles

1. **Be Contextual** - Use all information from RESTART.md to provide relevant guidance
2. **Be Specific** - Reference actual file names, spec names, and task IDs
3. **Be Actionable** - Provide clear next steps with specific prompt file paths
4. **Be Helpful** - Anticipate what the user likely wants to do next
5. **Be Clear** - Make it easy to understand how to proceed

### Important Reminders

- Ask for RESTART.md contents first - don't assume you have access to read files
- If RESTART.md is several days old, mention this and offer to help update it
- Make recommendations based on actual state described in RESTART.md
- Always provide specific file paths to the next prompts they should use
- If the user wants to update RESTART.md before continuing, guide them to use the shutdown command again
- Be ready to jump into whichever workflow they choose

### After Restart

Once the user begins working on their chosen task:
- Help them execute that task step by step
- Reference the context from RESTART.md as needed
- Keep track of new progress so RESTART.md can be updated when they shutdown again
