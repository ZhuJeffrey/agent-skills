#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
CURSOR_SKILLS="$HOME/.cursor/skills"

mkdir -p "$CURSOR_SKILLS"

linked=0
skipped=0

link_skill() {
  local skill_dir="$1"
  local skill_name
  skill_name="$(basename "$skill_dir")"

  if [[ ! -f "$skill_dir/SKILL.md" ]]; then
    echo "skip: $skill_name (no SKILL.md)"
    ((skipped++)) || true
    return
  fi

  local target="$CURSOR_SKILLS/$skill_name"
  ln -sfn "$skill_dir" "$target"
  echo "linked: $skill_name → $target"
  ((linked++)) || true
}

# Personal skills
for skill_dir in "$REPO_ROOT"/skills/*/; do
  skill_name="$(basename "$skill_dir")"
  [[ "$skill_name" == "_template" ]] && continue
  link_skill "$skill_dir"
done

# Product Manager Skills (deanpeters/Product-Manager-Skills submodule)
PM_SKILLS="$REPO_ROOT/vendor/product-manager-skills/skills"
if [[ -d "$PM_SKILLS" ]]; then
  echo ""
  echo "Product Manager Skills:"
  for skill_dir in "$PM_SKILLS"/*/; do
    link_skill "$skill_dir"
  done
else
  echo ""
  echo "warn: vendor/product-manager-skills not initialized — run: git submodule update --init"
fi

echo ""
echo "Done. $linked skill(s) linked, $skipped skipped."
echo "Skills directory: $CURSOR_SKILLS"
