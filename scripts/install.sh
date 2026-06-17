#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
CURSOR_SKILLS="$HOME/.cursor/skills"

mkdir -p "$CURSOR_SKILLS"

linked=0
skipped=0

for skill_dir in "$REPO_ROOT"/skills/*/; do
  skill_name="$(basename "$skill_dir")"

  # Skip template — not meant to be installed
  if [[ "$skill_name" == "_template" ]]; then
    continue
  fi

  if [[ ! -f "$skill_dir/SKILL.md" ]]; then
    echo "skip: $skill_name (no SKILL.md)"
    ((skipped++)) || true
    continue
  fi

  target="$CURSOR_SKILLS/$skill_name"
  ln -sfn "$skill_dir" "$target"
  echo "linked: $skill_name → $target"
  ((linked++)) || true
done

echo ""
echo "Done. $linked skill(s) linked, $skipped skipped."
echo "Skills directory: $CURSOR_SKILLS"
