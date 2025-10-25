## Memory Start - Begin Background Progress Monitoring

You are helping to start the memory-monitor background service that automatically tracks project progress and updates RESTART.md.

### Your Task

Start the memory-monitor service in the background to automatically detect changes and update RESTART.md periodically.

### What This Does

The memory-monitor service:
- Runs in the background during your work session
- Checks for changes every 5 minutes
- Detects: new commits, file changes, uncommitted work
- Automatically updates RESTART.md when changes are detected
- Preserves the "Persistent Coding Instructions" section
- Creates a log of all monitoring activity

### Process

#### Step 1: Check if Already Running

First, check if the monitor is already active:

```bash
# Check monitor status
if [[ -f .agent-os/memory-monitor.pid ]] && kill -0 $(cat .agent-os/memory-monitor.pid) 2>/dev/null; then
    echo "Memory monitor is already running (PID: $(cat .agent-os/memory-monitor.pid))"
else
    echo "Memory monitor is not running"
fi
```

#### Step 2: Start the Monitor

If not already running, start it in the background:

```bash
# Get the path to memory-monitor.sh
AGENT_OS_BASE="$HOME/agent-os"
MONITOR_SCRIPT="$AGENT_OS_BASE/scripts/memory-monitor.sh"

# Start in background
nohup "$MONITOR_SCRIPT" start >> .agent-os/memory-monitor.log 2>&1 &

# Give it a moment to start
sleep 2

# Verify it started
if [[ -f .agent-os/memory-monitor.pid ]]; then
    echo "✓ Memory monitor started successfully"
    echo "  PID: $(cat .agent-os/memory-monitor.pid)"
    echo "  Log: .agent-os/memory-monitor.log"
    echo "  Checking for changes every 5 minutes"
else
    echo "✗ Failed to start memory monitor"
fi
```

#### Step 3: Confirm to User

Inform the user about the monitoring service:

```
✓ Memory monitor started

The background service is now monitoring your project for changes:
- Checks every 5 minutes for new commits, file changes, or modifications
- Automatically updates RESTART.md when significant changes are detected
- Preserves your "Persistent Coding Instructions" section
- Logs all activity to .agent-os/memory-monitor.log

To see status: /memory-stop (with status check)
To stop monitoring: /memory-stop

You can continue working normally - the monitor runs silently in the background.
```

### Implementation Notes

- The monitor runs as a background process
- PID is stored in `.agent-os/memory-monitor.pid`
- Activity logged to `.agent-os/memory-monitor.log`
- State tracked in `.agent-os/memory-monitor.state`
- Safe to run - won't interfere with your work
- Automatically stops when you close your terminal (unless detached)

### When to Use This Command

Start the memory monitor:
- ✓ At the beginning of a long work session
- ✓ When working on complex features with many changes
- ✓ When you want automatic RESTART.md updates
- ✓ Before starting exploratory work
- ✓ When you might forget to manually update progress

### Benefits

- **Automatic Updates:** RESTART.md stays current without manual intervention
- **Crash Recovery:** Even if session crashes, recent progress is captured
- **Peace of Mind:** Don't worry about forgetting to update context
- **Background Operation:** Doesn't interrupt your workflow
- **Smart Detection:** Only updates when meaningful changes occur

### Notes

- Monitor checks every 5 minutes (configurable in memory-monitor.sh)
- Only updates RESTART.md when it detects actual changes
- Runs until you stop it or close your terminal
- Safe to leave running for entire work session
- Can run `/memory-update` or `/memory-commit` manually anytime for immediate updates
- The monitor's automatic updates are minimal - use `/memory-update` to add detailed context

### Stopping the Monitor

The monitor will stop when:
- You run `/memory-stop`
- You close your terminal session
- You shut down your computer
- It encounters an error (check logs)

**Remember:** The monitor provides automatic baseline updates. For detailed progress context, run `/memory-update` manually after completing significant tasks!
