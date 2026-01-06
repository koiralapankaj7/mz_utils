#!/bin/bash

# GitHub Rulesets Setup Script (OPTIONAL AUTOMATION HELPER)
#
# This is an OPTIONAL script that automates ruleset setup via GitHub CLI.
# You can also import the ruleset manually via GitHub UI:
#   1. Go to https://github.com/koiralapankaj7/mz_utils/settings/rules
#   2. Click "New ruleset" → "Import a ruleset"
#   3. Upload .github/rulesets/main-protection.json
#
# This script does the same thing but via the API instead of the UI.
#
# Prerequisites:
#   - GitHub CLI installed: https://cli.github.com/
#   - Authenticated: gh auth login (with your personal account, not work)
#
# Usage:
#   chmod +x .github/setup-rulesets.sh
#   .github/setup-rulesets.sh

set -e

REPO="koiralapankaj7/mz_utils"
RULESET_FILE=".github/rulesets/main-protection.json"

echo "🔒 Setting up GitHub Rulesets for $REPO"

# Check if gh is installed
if ! command -v gh &> /dev/null; then
    echo "❌ GitHub CLI (gh) is not installed."
    echo "📦 Install it from: https://cli.github.com/"
    exit 1
fi

# Check if authenticated
if ! gh auth status &> /dev/null; then
    echo "❌ Not authenticated with GitHub CLI."
    echo "🔑 Run: gh auth login"
    exit 1
fi

echo "✅ GitHub CLI is installed and authenticated"
echo ""

# Check if ruleset file exists
if [ ! -f "$RULESET_FILE" ]; then
    echo "❌ Ruleset file not found: $RULESET_FILE"
    exit 1
fi

echo "⚙️  Creating ruleset from: $RULESET_FILE"

# Create the ruleset
gh api \
  --method POST \
  -H "Accept: application/vnd.github+json" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  "/repos/$REPO/rulesets" \
  --input "$RULESET_FILE"

echo ""
echo "✅ Ruleset created successfully!"
echo ""
echo "📋 Protection rules applied:"
echo "  ✓ Require pull request before merging"
echo "  ✓ Required approvals: 0"
echo "  ✓ Dismiss stale reviews: Yes"
echo "  ✓ Require review thread resolution: Yes"
echo "  ✓ Require status checks: Analyze, Test, Package Analysis, Build Example App"
echo "  ✓ Require branches to be up to date: Yes"
echo "  ✓ Prevent branch deletion: Yes"
echo "  ✓ Prevent force pushes: Yes"
echo "  ✓ Require linear history: Yes"
echo ""
echo "🔍 View rulesets at: https://github.com/$REPO/settings/rules"
echo ""
echo "✨ Done! Try pushing directly to main - it should be blocked."
