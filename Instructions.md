# Getting Started with Agent OS

<div align="center">

**Transform your AI coding agents from novices into productive developers**

Agent OS is a spec-driven agentic development system that ensures AI agents produce quality code on the first try by providing structured workflows, development standards, and multi-agent orchestration.

</div>

---

## Table of Contents

- [What is Agent OS?](#what-is-agent-os)
- [Prerequisites](#prerequisites)
- [Installation Methods](#installation-methods)
  - [Method 1: Base Installation (Recommended)](#method-1-base-installation-recommended)
  - [Method 2: Direct Project Installation](#method-2-direct-project-installation)
- [Using Agent OS in a New Project](#using-agent-os-in-a-new-project)
- [Using Agent OS in an Existing Project](#using-agent-os-in-an-existing-project)
- [The Agent OS Workflow](#the-agent-os-workflow)
- [Available Commands](#available-commands)
- [Configuration & Customization](#configuration--customization)
- [Troubleshooting](#troubleshooting)

---

## What is Agent OS?

Agent OS is a comprehensive framework that:

- **Structures AI Development** - Provides clear workflows for planning, specification, and implementation
- **Maintains Quality Standards** - Ensures AI agents follow your coding conventions and best practices
- **Orchestrates Multiple Agents** - Coordinates specialized AI agents for different tasks (database, API, UI, testing)
- **Enforces Spec-First Development** - Creates detailed specifications before writing code
- **Supports Multiple Tools** - Works with Claude Code, Cursor, ChatGPT, or any AI coding tool

### Compatible AI Tools

- **Multi-Agent Mode**: Claude Code, Cursor
- **Single-Agent Mode**: ChatGPT, Claude, or any AI assistant

---

## Prerequisites

Before installing Agent OS, ensure you have:

- **Bash Shell** - macOS, Linux, or WSL on Windows
- **Git** - For version control integration
- **AI Coding Tool** - Claude Code, Cursor, ChatGPT, or your preferred AI assistant

No programming language dependencies required - Agent OS is purely declarative (YAML + Markdown + Bash).

---

## Installation Methods

### Method 1: Base Installation (Recommended)

This creates a system-wide Agent OS installation in your home directory that can be reused across multiple projects.

#### Step 1: Install Base Agent OS

Choose your AI tool(s):

**For Claude Code:**
```bash
curl -sSL https://raw.githubusercontent.com/buildermethods/agent-os/main/setup/base.sh | bash -s -- --claude-code
```

**For Cursor:**
```bash
curl -sSL https://raw.githubusercontent.com/buildermethods/agent-os/main/setup/base.sh | bash -s -- --cursor
```

**For Multiple Tools:**
```bash
curl -sSL https://raw.githubusercontent.com/buildermethods/agent-os/main/setup/base.sh | bash -s -- --claude-code --cursor
```

**What this creates:**
- `~/.agent-os/` folder with all Agent OS files
- Centralized standards and profiles you can customize
- Scripts for project installations

#### Step 2: Install into Projects

After base installation, you can install Agent OS into any project:

```bash
# Navigate to your project directory
cd /path/to/your/project

# Run the project installation script
~/.agent-os/setup/project.sh
```

**With options:**
```bash
# Specify profile and mode
~/.agent-os/setup/project.sh --profile=default --multi-agent-mode true

# Available options:
# --profile=<name>         Choose a configuration profile (default: default)
# --multi-agent-mode       Enable multi-agent mode (for Claude Code/Cursor)
# --single-agent-mode      Enable single-agent mode (for ChatGPT/Claude)
```

---

### Method 2: Direct Project Installation

Install Agent OS directly into a project without a base installation:

```bash
cd /path/to/your/project
curl -sSL https://raw.githubusercontent.com/buildermethods/agent-os/main/setup/project.sh | bash -s -- --no-base --claude-code
```

**Note:** This creates a self-contained installation in your project but doesn't allow for centralized customization across projects.

---

## Using Agent OS in a New Project

Follow these steps to start a new project with Agent OS:

### Step 1: Create and Initialize Your Project

```bash
# Create project directory
mkdir my-awesome-app
cd my-awesome-app

# Initialize git repository
git init

# Install Agent OS
~/.agent-os/setup/project.sh
```

### Step 2: Plan Your Product

Run the product planning command in your AI tool:

**In Claude Code or Cursor:**
```
/plan-product
```

**In ChatGPT or Claude (Single-Agent Mode):**
Copy and paste the prompt from `.agent-os/commands/plan-product/single-agent/step-1-gather-requirements.md`

**What happens:**
The product-planner agent will:
1. Ask you questions about your product vision
2. Create a product mission document
3. Create a development roadmap
4. Document your tech stack decisions

**Output files created:**
```
agent-os/product/
├── mission.md      # Your product vision and strategy
├── roadmap.md      # Phased development plan
└── tech-stack.md   # Technical architecture decisions
```

### Step 3: Create Your First Feature Spec

Start a new feature specification:

**In Claude Code or Cursor:**
```
/new-spec
```

**What happens:**
1. **spec-initializer** creates a dated folder (e.g., `agent-os/specs/2025-10-19-user-authentication/`)
2. **spec-researcher** asks clarifying questions about your feature
3. Requirements are documented

**Output structure:**
```
agent-os/specs/2025-10-19-feature-name/
└── planning/
    ├── initialization.md    # Spec setup details
    ├── requirements.md      # Gathered requirements
    └── workflow.yml         # Workflow tracking
```

### Step 4: Write the Specification

Complete the specification:

**In Claude Code or Cursor:**
```
/create-spec
```

**What happens:**
1. **spec-writer** analyzes requirements and creates detailed `spec.md`
2. **tasks-list-creator** breaks spec into actionable task groups
3. **spec-verifier** validates completeness and creates verification report

**Output files:**
```
agent-os/specs/2025-10-19-feature-name/
├── planning/
│   └── ...
├── spec.md                          # Detailed specification
├── tasks.md                         # Breakdown of implementation tasks
└── verification/
    └── spec-verification.md         # Verification report
```

### Step 5: Implement the Feature

Execute the implementation:

**In Claude Code or Cursor:**
```
/implement-spec
```

**What happens:**
1. Main agent creates `task-assignments.yml` mapping tasks to specialized agents
2. Specialized implementer agents work on their assigned areas:
   - **database-engineer** - Database migrations, models, queries
   - **api-engineer** - API endpoints, controllers, business logic
   - **ui-designer** - UI components, views, styling
   - **testing-engineer** - Tests and test coverage
3. Each implementer:
   - Reads the spec and their assigned tasks
   - Implements the functionality
   - Updates `tasks.md` marking tasks complete `[x]`
   - Documents their work in an implementation report
4. Verifier agents review implementations:
   - **backend-verifier** - Verifies database and API work
   - **frontend-verifier** - Verifies UI components
5. **implementation-verifier** does final end-to-end verification

**Output structure:**
```
agent-os/specs/2025-10-19-feature-name/
├── implementation/
│   ├── 1_database_migrations/
│   │   └── report.md
│   ├── 2_api_endpoints/
│   │   └── report.md
│   ├── 3_ui_components/
│   │   └── report.md
│   └── 4_tests/
│       └── report.md
├── verification/
│   ├── backend-verification.md
│   ├── frontend-verification.md
│   └── final-verification.md
└── tasks.md (updated with ✓ marks)
```

### Step 6: Rinse and Repeat

Continue building features:
1. Run `/new-spec` for next feature
2. Run `/create-spec` to write specification
3. Run `/implement-spec` to build it
4. Repeat until product is complete

---

## Using Agent OS in an Existing Project

Integrating Agent OS into an existing codebase requires a few additional considerations:

### Step 1: Install Agent OS

```bash
# Navigate to your existing project
cd /path/to/existing/project

# Install Agent OS
~/.agent-os/setup/project.sh
```

### Step 2: Customize Standards (Important!)

Agent OS comes with default coding standards. For existing projects, you should customize these to match your current conventions:

```bash
# Edit global standards
vim .agent-os/standards/global/conventions.md
vim .agent-os/standards/global/coding-style.md
vim .agent-os/standards/global/commenting.md
vim .agent-os/standards/global/error-handling.md
```

**What to customize:**
- **File structure conventions** - Match your existing project structure
- **Naming conventions** - Variables, classes, files, etc.
- **Code style** - Indentation, spacing, brackets, etc.
- **Import/require patterns** - How dependencies are imported
- **Error handling** - How errors are caught and handled
- **Testing patterns** - Your current testing approach

### Step 3: Document Your Current State (Optional but Recommended)

Create product documentation for existing codebase:

```bash
# In your AI tool, run:
/plan-product
```

Tell the agent about your **existing** product:
- What the product does currently
- Current tech stack
- Existing architecture
- Development roadmap going forward

This creates baseline documentation in `agent-os/product/`.

### Step 4: Define Custom Roles (Optional)

If your project has specific team structures or domain areas, customize agent roles:

```bash
# Edit implementer roles
vim .agent-os/roles/implementers.yml

# Edit verifier roles
vim .agent-os/roles/verifiers.yml
```

**Example custom role:**
```yaml
implementers:
  - id: payment-engineer
    description: Implements payment processing and billing features
    your_role: You are a payment processing specialist...
    tools: Read, Write, Edit, Bash, WebFetch
    areas_of_responsibility:
      - Payment gateway integrations
      - Subscription management
      - Invoice generation
    standards:
      - global/*
      - payment/*
    verified_by:
      - backend-verifier
```

### Step 5: Start with New Features

Don't try to retrofit Agent OS into existing features. Instead, use it for **new feature development**:

```bash
# In your AI tool:
/new-spec
```

Build new features using the Agent OS workflow while keeping existing code as-is.

### Step 6: Gradual Adoption

As you build new features with Agent OS:
- Update standards based on what works
- Refine agent roles to match your workflow
- Gradually bring existing code into alignment with new standards
- Build confidence in the system

---

## The Agent OS Workflow

Agent OS follows a structured three-phase workflow:

### Phase 1: Product Planning
**Command:** `/plan-product`

**Purpose:** Define your product vision, roadmap, and technical architecture

**Outputs:**
- Product mission document
- Development roadmap
- Tech stack documentation

### Phase 2: Specification
**Commands:** `/new-spec` → `/create-spec`

**Purpose:** Create detailed specifications before writing code

**Process:**
1. Initialize spec folder structure
2. Gather and document requirements
3. Write comprehensive specification
4. Break down into actionable tasks
5. Verify specification completeness

**Outputs:**
- Requirements documentation
- Detailed specification (spec.md)
- Task breakdown (tasks.md)
- Verification reports

### Phase 3: Implementation
**Command:** `/implement-spec`

**Purpose:** Build features with specialized agents and verification

**Process:**
1. Assign tasks to specialized implementer agents
2. Each agent implements their area of responsibility
3. Each agent documents their work
4. Verifier agents review implementations
5. Final end-to-end verification
6. Update roadmap with completed items

**Outputs:**
- Implemented code
- Implementation reports
- Verification reports
- Updated task list
- Updated roadmap

---

## Available Commands

### Multi-Agent Mode (Claude Code, Cursor)

Run these commands directly in your AI tool:

| Command | Description |
|---------|-------------|
| `/plan-product` | Create product documentation (mission, roadmap, tech stack) |
| `/new-spec` | Initialize a new feature specification |
| `/create-spec` | Write specification and create task breakdown |
| `/implement-spec` | Implement specification with specialized agents |

### Single-Agent Mode (ChatGPT, Claude, etc.)

Copy prompts from these files into your AI tool:

**Product Planning:**
1. `.agent-os/commands/plan-product/single-agent/step-1-gather-requirements.md`
2. `.agent-os/commands/plan-product/single-agent/step-2-create-mission.md`
3. `.agent-os/commands/plan-product/single-agent/step-3-create-roadmap.md`
4. `.agent-os/commands/plan-product/single-agent/step-4-create-tech-stack.md`

**Specification:**
1. `.agent-os/commands/new-spec/single-agent/step-1-initialize.md`
2. `.agent-os/commands/new-spec/single-agent/step-2-research.md`
3. `.agent-os/commands/create-spec/single-agent/step-1-write-spec.md`
4. `.agent-os/commands/create-spec/single-agent/step-2-create-tasks.md`
5. `.agent-os/commands/create-spec/single-agent/step-3-verify-spec.md`

**Implementation:**
1. `.agent-os/commands/implement-spec/single-agent/step-1-implement.md`
2. `.agent-os/commands/implement-spec/single-agent/step-2-verify.md`

---

## Configuration & Customization

### Configuration File

Agent OS tracks its configuration in `config.yml`:

```yaml
version: 2.0.5
base_installation: true
multi_agent_mode: true
single_agent_mode: false
tools:
  claude_code: true
  cursor: false
profiles:
  current: default
```

### File Structure

After installation, your project will have:

```
your-project/
├── .agent-os/                    # Agent OS installation
│   ├── agents/                   # Multi-agent definitions
│   ├── commands/                 # Command prompts
│   ├── roles/                    # Agent role definitions
│   ├── standards/                # Coding standards
│   ├── workflows/                # Detailed workflows
│   └── config.yml                # Configuration
│
├── .claude/                      # Claude Code integration (if enabled)
│   ├── agents/                   # Symlinks to .agent-os/agents/
│   └── commands/                 # Symlinks to .agent-os/commands/
│
└── agent-os/                     # Your work products
    ├── product/                  # Product documentation
    │   ├── mission.md
    │   ├── roadmap.md
    │   └── tech-stack.md
    └── specs/                    # Feature specifications
        └── YYYY-MM-DD-feature-name/
            ├── planning/
            ├── spec.md
            ├── tasks.md
            ├── implementation/
            └── verification/
```

### Customizing Standards

Edit files in `.agent-os/standards/` to match your project:

- **global/conventions.md** - Project structure, git workflow
- **global/coding-style.md** - Language-specific formatting
- **global/commenting.md** - Code commenting practices
- **global/error-handling.md** - Error handling patterns
- **testing/test-writing.md** - Testing requirements

### Creating Custom Profiles

For different project types (Rails, Django, React, etc.):

```bash
# Create a new profile
~/.agent-os/scripts/create-profile.sh my-profile

# Install project with custom profile
~/.agent-os/setup/project.sh --profile=my-profile
```

### Creating Custom Roles

Add specialized agents for your domain:

```bash
# Create a new role
~/.agent-os/scripts/create-role.sh payment-engineer

# Edit the role definition
vim .agent-os/roles/implementers.yml
```

---

## Troubleshooting

### Commands Not Showing Up

**Problem:** `/plan-product` or other commands don't work in Claude Code

**Solution:**
1. Check that `.claude/commands/` exists and has files
2. Restart Claude Code
3. Verify installation: `ls -la .claude/commands/`

### Agents Not Working

**Problem:** Multi-agent commands aren't delegating to subagents

**Solution:**
1. Verify `.claude/agents/` exists
2. Check config.yml has `multi_agent_mode: true`
3. Ensure you're using Claude Code (multi-agent support required)

### Standards Not Being Followed

**Problem:** AI agents aren't following your coding standards

**Solution:**
1. Check that standards are properly defined in `.agent-os/standards/`
2. Verify agent role definitions reference the correct standards files
3. Be explicit in your requirements when starting specs
4. Review and update standards based on actual output

### Installation Fails

**Problem:** Installation script errors

**Solution:**
1. Ensure you have bash, git, and curl installed
2. Check permissions: `chmod +x ~/.agent-os/setup/project.sh`
3. Try direct project installation method instead
4. Check that you're in a valid project directory

### Can't Find Base Installation

**Problem:** `~/.agent-os/` doesn't exist

**Solution:**
1. Run base installation first: `curl -sSL https://raw.githubusercontent.com/buildermethods/agent-os/main/setup/base.sh | bash -s -- --claude-code`
2. Or use direct project installation with `--no-base` flag

---

## Next Steps

1. **Customize Your Standards** - Edit `.agent-os/standards/` to match your preferences
2. **Try the Workflow** - Build a small feature using `/new-spec` → `/create-spec` → `/implement-spec`
3. **Refine Your Process** - Adjust roles, standards, and workflows based on results
4. **Join the Community** - Visit [buildermethods.com](https://buildermethods.com) for more resources

---

## Additional Resources

- **Official Documentation:** [buildermethods.com](https://buildermethods.com)
- **GitHub Repository:** [github.com/buildermethods/agent-os](https://github.com/buildermethods/agent-os)
- **CHANGELOG:** See `CHANGELOG.md` for version history and updates
- **License:** MIT License (see `LICENSE` file)

---

<div align="center">

**Happy Building with Agent OS!**

*Transform your AI agents into productive developers today.*

</div>
