#!/bin/bash

# =============================================================================
# Add Persistent Coding Instructions to Project RESTART.md
# Updates agent-os commands and adds persistent section without destroying content
# =============================================================================

set -e  # Exit on error

# Get the directory where this script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
BASE_DIR="$HOME/agent-os"
PROJECT_DIR="${1:-$(pwd)}"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# -----------------------------------------------------------------------------
# Helper Functions
# -----------------------------------------------------------------------------

print_status() {
    echo -e "${BLUE}==>${NC} $1"
}

print_success() {
    echo -e "${GREEN}✓${NC} $1"
}

print_error() {
    echo -e "${RED}✗${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}⚠${NC} $1"
}

# -----------------------------------------------------------------------------
# Main Script
# -----------------------------------------------------------------------------

echo ""
print_status "Updating Agent OS in project: $PROJECT_DIR"
echo ""

# Change to project directory
cd "$PROJECT_DIR"

# Check if agent-os is installed
if [[ ! -d "agent-os" ]]; then
    print_error "Agent OS is not installed in this project."
    print_status "Run: $BASE_DIR/scripts/project-install.sh"
    exit 1
fi

# Step 1: Update commands to get the new shutdown logic
print_status "Updating agent-os commands..."
"$BASE_DIR/scripts/project-update.sh" --overwrite-commands
echo ""

# Step 2: Add persistent coding instructions to RESTART.md if it exists
if [[ ! -f "RESTART.md" ]]; then
    print_warning "RESTART.md does not exist in this project yet."
    print_status "Run /agent-os-shutdown to create it with persistent instructions included."
    exit 0
fi

# Check if persistent section already exists
if grep -q "## Persistent Coding Instructions" "RESTART.md"; then
    print_success "Persistent Coding Instructions section already exists in RESTART.md"
    print_status "Update complete!"
    exit 0
fi

# Step 3: Extract persistent section from agent-os RESTART.md
AGENT_OS_RESTART="$BASE_DIR/RESTART.md"
if [[ ! -f "$AGENT_OS_RESTART" ]]; then
    print_error "Cannot find $AGENT_OS_RESTART"
    exit 1
fi

# Extract the persistent coding instructions section
print_status "Extracting persistent coding instructions..."
TEMP_PERSISTENT=$(mktemp)

# Use awk to extract from "## Persistent Coding Instructions" to the next "## " or "---"
awk '
/^## Persistent Coding Instructions/ { flag=1 }
flag {
    print
    if (/^---$/ && NR > 1) { flag=0 }
}
' "$AGENT_OS_RESTART" > "$TEMP_PERSISTENT"

# Step 4: Insert into project RESTART.md
print_status "Adding persistent section to RESTART.md..."

# Create temp file for the new content
TEMP_OUTPUT=$(mktemp)

# Insert right before "## Current Work Summary" or after the header if that doesn't exist
awk -v persistent_file="$TEMP_PERSISTENT" '
BEGIN { inserted=0 }
/^## Current Work Summary/ {
    if (!inserted) {
        while ((getline line < persistent_file) > 0) {
            print line
        }
        close(persistent_file)
        print ""
        inserted=1
    }
}
{ print }
END {
    # If we never found "## Current Work Summary", append at the end
    if (!inserted) {
        print ""
        while ((getline line < persistent_file) > 0) {
            print line
        }
        close(persistent_file)
    }
}
' "RESTART.md" > "$TEMP_OUTPUT"

# Replace original file
mv "$TEMP_OUTPUT" "RESTART.md"

# Clean up temp files
rm "$TEMP_PERSISTENT"

print_success "Persistent Coding Instructions section added to RESTART.md"
echo ""
print_status "Update complete!"
print_status "Your RESTART.md now includes persistent coding instructions that will be preserved on every shutdown."
echo ""
