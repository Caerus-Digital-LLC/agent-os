## Memory Stop - Stop Background Progress Monitoring

You are helping to stop the memory-monitor background service that tracks project progress.

### Your Task

Stop the running memory-monitor service and provide status information to the user.

### Process

#### Step 1: Check If Monitor Is Running

First, check the current status:

```bash
# Check if monitor is running
if [[ -f .agent-os/memory-monitor.pid ]]; then
    PID=$(cat .agent-os/memory-monitor.pid)
    if kill -0 $PID 2>/dev/null; then
        echo "Memory monitor is running (PID: $PID)"
    else
        echo "Memory monitor PID file exists but process is not running"
        rm -f .agent-os/memory-monitor.pid
    fi
else
    echo "Memory monitor is not running"
fi
```

#### Step 2: Stop the Monitor

If the monitor is running, stop it:

```bash
# Get the path to memory-monitor.sh
AGENT_OS_BASE="$HOME/agent-os"
MONITOR_SCRIPT="$AGENT_OS_BASE/scripts/memory-monitor.sh"

# Stop the monitor
"$MONITOR_SCRIPT" stop
```

#### Step 3: Show Final Statistics

After stopping, show useful information:

```bash
# Show last few log entries
echo ""
echo "Last activity from memory monitor:"
tail -10 .agent-os/memory-monitor.log 2>/dev/null || echo "No log file found"

# Show when RESTART.md was last updated
if [[ -f RESTART.md ]]; then
    echo ""
    echo "RESTART.md last modified: $(stat -f "%Sm" RESTART.md 2>/dev/null || stat -c "%y" RESTART.md 2>/dev/null)"
fi
```

#### Step 4: Confirm to User

```
✓ Memory monitor stopped

The background monitoring service has been stopped:
- Process terminated cleanly
- RESTART.md contains latest automatic updates
- Monitor logs saved in .agent-os/memory-monitor.log

Next steps:
- Run /memory-update to add detailed context about your current work
- Run /memory-commit to create a progress checkpoint
- Run /agent-os-shutdown when ending your session

The monitor can be restarted anytime with /memory-start
```

### Implementation Notes

- Gracefully terminates the background process
- Cleans up PID file
- Preserves logs and state for reference
- Safe to run even if monitor isn't running
- Shows recent activity before stopping

### When to Use This Command

Stop the memory monitor when:
- ✓ Ending your work session (before shutdown)
- ✓ Switching to manual updates only
- ✓ Troubleshooting or restarting the monitor
- ✓ Checking monitor status and activity
- ✓ The monitor is consuming resources (rare)

### What Happens After Stopping

- The background process terminates
- RESTART.md keeps all updates made by the monitor
- Log files are preserved in `.agent-os/memory-monitor.log`
- State file is preserved in `.agent-os/memory-monitor.state`
- You can restart the monitor anytime with `/memory-start`
- You should use `/memory-update` manually going forward

### Notes

- Stopping the monitor doesn't delete any progress
- All RESTART.md updates are permanent
- Logs and state files remain for reference
- Safe to stop and restart as needed
- The monitor automatically stops when terminal closes anyway

### After Stopping

Consider running:
- `/memory-update` - Add detailed context manually
- `/memory-commit` - Create a progress checkpoint
- `/agent-os-shutdown` - If ending your session

Or simply restart the monitor with `/memory-start` if you stopped it for troubleshooting.
