#!/bin/bash

# =============================================================================
# Memory Monitor - Background service to track project progress
# Automatically updates RESTART.md when significant changes are detected
# =============================================================================

set -e

# Configuration
MONITOR_INTERVAL=300  # Check every 5 minutes (300 seconds)
PROJECT_DIR="$(pwd)"
RESTART_FILE="$PROJECT_DIR/RESTART.md"
STATE_FILE="$PROJECT_DIR/.agent-os/memory-monitor.state"
PID_FILE="$PROJECT_DIR/.agent-os/memory-monitor.pid"
LOG_FILE="$PROJECT_DIR/.agent-os/memory-monitor.log"

# Ensure .agent-os directory exists
mkdir -p "$PROJECT_DIR/.agent-os"

# =============================================================================
# Logging Functions
# =============================================================================

log_info() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] INFO: $1" | tee -a "$LOG_FILE"
}

log_debug() {
    if [[ "${DEBUG:-false}" == "true" ]]; then
        echo "[$(date '+%Y-%m-%d %H:%M:%S')] DEBUG: $1" | tee -a "$LOG_FILE"
    fi
}

log_error() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] ERROR: $1" | tee -a "$LOG_FILE" >&2
}

# =============================================================================
# State Management
# =============================================================================

# Save current state
save_state() {
    local git_head=$(git rev-parse HEAD 2>/dev/null || echo "none")
    local file_count=$(find . -type f -not -path '*/\.git/*' -not -path '*/node_modules/*' -not -path '*/\.agent-os/*' 2>/dev/null | wc -l | tr -d ' ')
    local last_update=$(date +%s)

    cat > "$STATE_FILE" <<EOF
GIT_HEAD=$git_head
FILE_COUNT=$file_count
LAST_UPDATE=$last_update
EOF

    log_debug "State saved: HEAD=$git_head, FILES=$file_count"
}

# Load previous state
load_state() {
    if [[ -f "$STATE_FILE" ]]; then
        source "$STATE_FILE"
        log_debug "State loaded: HEAD=${GIT_HEAD:-none}, FILES=${FILE_COUNT:-0}"
    else
        GIT_HEAD="none"
        FILE_COUNT=0
        LAST_UPDATE=0
        log_debug "No previous state found, starting fresh"
    fi
}

# =============================================================================
# Change Detection
# =============================================================================

# Check if significant changes occurred
detect_changes() {
    local current_head=$(git rev-parse HEAD 2>/dev/null || echo "none")
    local current_file_count=$(find . -type f -not -path '*/\.git/*' -not -path '*/node_modules/*' -not -path '*/\.agent-os/*' 2>/dev/null | wc -l | tr -d ' ')

    # Check for new commits
    if [[ "$current_head" != "$GIT_HEAD" ]] && [[ "$GIT_HEAD" != "none" ]]; then
        log_info "Detected new commit(s): $GIT_HEAD -> $current_head"
        return 0  # Changes detected
    fi

    # Check for file count changes (files added/deleted)
    local file_diff=$((current_file_count - FILE_COUNT))
    if [[ $file_diff -ne 0 ]]; then
        log_info "Detected file count change: $file_diff files"
        return 0  # Changes detected
    fi

    # Check for uncommitted changes
    if ! git diff --quiet 2>/dev/null; then
        log_info "Detected uncommitted changes"
        return 0  # Changes detected
    fi

    # Check for staged changes
    if ! git diff --cached --quiet 2>/dev/null; then
        log_info "Detected staged changes"
        return 0  # Changes detected
    fi

    log_debug "No significant changes detected"
    return 1  # No changes
}

# =============================================================================
# RESTART.md Update Logic
# =============================================================================

# Extract persistent instructions from RESTART.md
extract_persistent_section() {
    if [[ ! -f "$RESTART_FILE" ]]; then
        echo ""
        return
    fi

    # Extract everything between "## Persistent Coding Instructions" and the next "## " heading
    awk '/^## Persistent Coding Instructions$/,/^## [^P]/' "$RESTART_FILE" | sed '$d'
}

# Update RESTART.md with current state
update_restart_file() {
    log_info "Updating RESTART.md..."

    # Backup existing file
    if [[ -f "$RESTART_FILE" ]]; then
        cp "$RESTART_FILE" "$RESTART_FILE.backup"
    fi

    # Extract persistent section to preserve it
    local persistent_section=$(extract_persistent_section)

    # Get current git info
    local current_branch=$(git branch --show-current 2>/dev/null || echo "unknown")
    local current_time=$(date '+%Y-%m-%d at %H:%M %Z')
    local git_status=$(git status --short 2>/dev/null || echo "Not a git repository")
    local recent_commits=$(git log -3 --oneline 2>/dev/null || echo "No commits yet")

    # Count files by type
    local modified_files=$(git diff --name-only 2>/dev/null | wc -l | tr -d ' ')
    local staged_files=$(git diff --cached --name-only 2>/dev/null | wc -l | tr -d ' ')
    local untracked_files=$(git ls-files --others --exclude-standard 2>/dev/null | wc -l | tr -d ' ')

    # Create updated RESTART.md
    cat > "$RESTART_FILE" <<EOF
# Project Restart Context

**Last Updated:** $current_time (auto-updated by memory-monitor)
**Current Branch:** $current_branch

$persistent_section

---

## Current Work Summary

*This section is auto-maintained by memory-monitor. Last significant change detected: $(date '+%Y-%m-%d at %H:%M')*

Active monitoring detected changes in the project. Use \`/memory-update\` to add detailed context about your current work.

## Git Status

**Branch:** $current_branch

**File Changes:**
- Modified files: $modified_files
- Staged files: $staged_files
- Untracked files: $untracked_files

**Status:**
\`\`\`
$git_status
\`\`\`

**Recent Commits:**
\`\`\`
$recent_commits
\`\`\`

## Next Steps

*Run \`/memory-update\` to update this section with your current priorities and next steps.*

1. Review recent changes
2. Update work context
3. Define next priorities

## Notes

- This file is automatically monitored and updated by memory-monitor
- Run \`/memory-update\` to add detailed context
- Run \`/memory-commit\` to create a progress checkpoint
- Run \`/agent-os-shutdown\` when ending your session

---

**Auto-Monitor Status:** Active (checking every $(($MONITOR_INTERVAL / 60)) minutes)
**To stop monitoring:** Run \`/memory-stop\`
EOF

    log_info "RESTART.md updated successfully"
}

# =============================================================================
# Main Monitor Loop
# =============================================================================

# Cleanup on exit
cleanup() {
    log_info "Memory monitor stopping..."
    rm -f "$PID_FILE"
    exit 0
}

trap cleanup SIGTERM SIGINT

# Main monitoring function
run_monitor() {
    log_info "Memory monitor started (PID: $$, Interval: ${MONITOR_INTERVAL}s)"
    echo $$ > "$PID_FILE"

    # Initial state
    save_state

    while true; do
        log_debug "Checking for changes..."

        # Load previous state
        load_state

        # Detect changes
        if detect_changes; then
            log_info "Significant changes detected, updating RESTART.md"
            update_restart_file
            save_state
        else
            log_debug "No changes detected, skipping update"
        fi

        # Wait before next check
        sleep $MONITOR_INTERVAL
    done
}

# =============================================================================
# Command Interface
# =============================================================================

case "${1:-start}" in
    start)
        if [[ -f "$PID_FILE" ]] && kill -0 $(cat "$PID_FILE") 2>/dev/null; then
            echo "Memory monitor is already running (PID: $(cat "$PID_FILE"))"
            exit 1
        fi
        run_monitor
        ;;
    stop)
        if [[ -f "$PID_FILE" ]]; then
            local pid=$(cat "$PID_FILE")
            if kill -0 $pid 2>/dev/null; then
                kill $pid
                echo "Memory monitor stopped (PID: $pid)"
            else
                echo "Memory monitor is not running"
                rm -f "$PID_FILE"
            fi
        else
            echo "Memory monitor is not running"
        fi
        ;;
    status)
        if [[ -f "$PID_FILE" ]] && kill -0 $(cat "$PID_FILE") 2>/dev/null; then
            echo "Memory monitor is running (PID: $(cat "$PID_FILE"))"
            echo "Log: $LOG_FILE"
            if [[ -f "$STATE_FILE" ]]; then
                echo ""
                echo "Current state:"
                cat "$STATE_FILE"
            fi
        else
            echo "Memory monitor is not running"
        fi
        ;;
    *)
        echo "Usage: $0 {start|stop|status}"
        exit 1
        ;;
esac
