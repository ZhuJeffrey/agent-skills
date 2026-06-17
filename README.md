# agent-skills

Personal [Cursor Agent Skills](https://cursor.com/docs/context/skills) — markdown workflows that teach the AI how to handle specific tasks.

## Structure

Each skill is a directory with a `SKILL.md` file:

```
skills/
├── my-skill/
│   ├── SKILL.md          # Required — instructions + YAML frontmatter
│   ├── reference.md      # Optional — detailed docs
│   └── examples.md       # Optional — usage examples
└── _template/            # Copy this to start a new skill
```

## Install skills in Cursor

Link all skills into your personal Cursor skills directory:

```bash
./scripts/install.sh
```

This symlinks `skills/*` → `~/.cursor/skills/`. Cursor loads skills from there across all projects.

To install a single skill:

```bash
ln -sf "$(pwd)/skills/my-skill" ~/.cursor/skills/my-skill
```

## Create a new skill

1. Copy the template:
   ```bash
   cp -r skills/_template skills/my-new-skill
   ```
2. Edit `skills/my-new-skill/SKILL.md` — update the `name` and `description` in frontmatter.
3. Run `./scripts/install.sh` to link it.
4. In Cursor, invoke with `@my-new-skill` or let the agent auto-discover via the description.

## SKILL.md format

```markdown
---
name: my-skill
description: What it does and when to use it. Write in third person.
---

# My Skill

## Instructions
...
```

See `skills/_template/SKILL.md` for a full starter.

## Contributing

Add skills under `skills/<skill-name>/`. Keep each `SKILL.md` under 500 lines; put long reference material in separate files.
