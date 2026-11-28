#!/bin/bash
# prints my workflow into every session and puts my git gate in this clone, so nobody has to remember either
set -uo pipefail
cd "${CLAUDE_PROJECT_DIR:-.}"
for vault in . ../second-brain-vault "$HOME/second-brain-vault" /home/user/second-brain-vault; do
  gate="$vault/90-System/Automation/git-gate/install.py"
  if [ -f "$gate" ]; then
    [ -f "$(git rev-parse --git-path hooks 2>/dev/null)/gate.py" ] || python3 "$gate" . >/dev/null 2>&1 || echo "My git gate did not install here. Install it before the first commit."
    break
  fi
done
cat .claude/workflow.md
