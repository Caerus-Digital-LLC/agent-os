## Memory Start - Begin Background Progress Monitoring

This command starts a background service that automatically monitors your project and updates RESTART.md when it detects changes.

### What This Does

Starts the memory-monitor service which:
- Monitors your project for changes every 5 minutes
- Detects new commits, file changes, and modifications
- Automatically updates RESTART.md when significant changes occur
- Runs silently in the background
- Preserves your "Persistent Coding Instructions" section

### Instructions

#### Step 1: Check if Already Running

First, check if the monitor is already active:

```bash
# Check status
if [[ -f .agent-os/memory-monitor.pid ]] && kill -0 $(cat .agent-os/memory-monitor.pid) 2>/dev/null; then
    echo "Memory monitor is already running (PID: $(cat .agent-os/memory-monitor.pid))"
else
    echo "Memory monitor is not running"
fi
```

#### Step 2: Start the Monitor

If not already running, start it:

```bash
# Start the memory monitor in the background
nohup $HOME/agent-os/scripts/memory-monitor.sh start >> .agent-os/memory-monitor.log 2>&1 &

# Wait a moment for it to start
sleep 2

# Check if it started successfully
if [[ -f .agent-os/memory-monitor.pid ]]; then
    echo "✓ Memory monitor started (PID: $(cat .agent-os/memory-monitor.pid))"
else
    echo "✗ Failed to start - check .agent-os/memory-monitor.log"
fi
```

#### Step 3: Verify It's Running

Check the status:

```bash
# View the log to confirm it's working
tail -5 .agent-os/memory-monitor.log
```

You should see messages like:
```
[2025-01-15 10:30:00] INFO: Memory monitor started (PID: 12345, Interval: 300s)
```

#### Step 4: Continue Working

That's it! The monitor is now running in the background.

- It will check for changes every 5 minutes
- RESTART.md will be updated automatically when changes are detected
- Your "Persistent Coding Instructions" section will always be preserved
- Activity is logged to `.agent-os/memory-monitor.log`

### What You'll See

The monitor runs silently. It only updates RESTART.md when it detects:
- New git commits
- Files added or deleted
- Uncommitted changes
- Staged changes

### Viewing Monitor Activity

To see what the monitor is doing:

```bash
# View recent activity
tail -20 .agent-os/memory-monitor.log

# Follow live activity
tail -f .agent-os/memory-monitor.log
```

### When to Use This

Start the memory monitor:
- ✓ At the beginning of long work sessions
- ✓ When working on complex features
- ✓ When you want automatic progress tracking
- ✓ Before starting exploratory work
- ✓ When you might forget to update progress manually

### Benefits

- **Automatic Updates:** RESTART.md stays current without effort
- **Crash Recovery:** Progress is captured even if your session crashes
- **Background Operation:** Doesn't interrupt your work
- **Smart Detection:** Only updates when real changes occur
- **Set It and Forget It:** Just start it and work normally

### Stopping the Monitor

To stop the monitor:

```bash
# Stop the service
$HOME/agent-os/scripts/memory-monitor.sh stop
```

Or use the `/memory-stop` command.

The monitor will also stop automatically when you:
- Close your terminal
- Shut down your computer
- Log out of your session

### Important Notes

- The monitor provides automatic baseline updates
- For detailed context, still run `/memory-update` manually after major tasks
- The monitor's updates are intentionally minimal
- It won't slow down your work or interfere with your processes
- Safe to leave running for entire work session

### Troubleshooting

**Monitor won't start:**
```bash
# Check if script exists
ls -la $HOME/agent-os/scripts/memory-monitor.sh

# Make sure it's executable
chmod +x $HOME/agent-os/scripts/memory-monitor.sh

# Try starting manually
$HOME/agent-os/scripts/memory-monitor.sh start
```

**Monitor stopped unexpectedly:**
```bash
# Check the log for errors
tail -50 .agent-os/memory-monitor.log
```

---

**Ready to start?** Run the commands in Step 2 above, then reply "Done" when the monitor is running.

**Remember:** The monitor provides automatic updates, but you should still use `/memory-update` to add detailed context after completing significant work!
