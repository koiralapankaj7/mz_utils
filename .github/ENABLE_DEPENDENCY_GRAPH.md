# Enable Dependency Graph (One-Time Setup)

The Dependency Review workflow requires the **Dependency graph** feature to be enabled on your repository.

## Quick Setup (2 minutes)

1. **Go to Security Settings**

   Visit: <https://github.com/koiralapankaj7/mz_utils/settings/security_analysis>

2. **Enable Dependency Graph**

   - Find "Dependency graph" section
   - Click **"Enable"** button

3. **Enable Dependabot Alerts** (Recommended)

   While you're there, also enable:
   - ✅ **Dependabot alerts** - Get notified about vulnerable dependencies
   - ✅ **Dependabot security updates** - Automatic PRs to fix vulnerabilities

4. **Done!**

   The Dependency Review workflow will now work on future PRs.

---

## What This Does

### Dependency Graph

- Tracks all dependencies in your `pubspec.yaml`
- Shows dependency tree visualization
- Enables dependency review on PRs

### Dependabot Alerts

- Scans for known vulnerabilities in dependencies
- Sends alerts when vulnerable packages are detected
- Provides remediation advice

### Dependabot Security Updates

- Automatically creates PRs to update vulnerable dependencies
- Includes changelogs and release notes
- Helps keep your package secure with minimal effort

---

## Why It's Safe

These features:

- ✅ **Read-only** - Only analyze your code, never modify it
- ✅ **Privacy-friendly** - Data stays within GitHub
- ✅ **Industry standard** - Used by millions of repositories
- ✅ **Free** - No cost for public repositories

---

## After Enabling

Once enabled, the CI workflow's **Dependency Review** job will:

- ✅ Check for new vulnerabilities in PR dependency changes
- ✅ Block PRs that introduce known security issues
- ✅ Show dependency diff in PR (what packages changed)

This is an extra layer of security for your package!

---

## Alternative: Disable the Job

If you prefer not to enable Dependency graph, you can disable the job in `.github/workflows/ci.yml`:

```yaml
# Comment out or remove this entire job
# dependency-review:
#   name: Dependency Review
#   ...
```

However, we recommend keeping it enabled for better security.
