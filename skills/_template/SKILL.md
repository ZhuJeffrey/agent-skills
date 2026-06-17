---
name: skill-template
description: Template for creating new Cursor Agent Skills. Use when starting a new skill or asking about SKILL.md structure.
disable-model-invocation: true
---

# Skill Template

Copy this directory and replace the placeholders below.

## Instructions

1. Rename the directory to match your skill (lowercase, hyphens).
2. Update the `name` and `description` in frontmatter.
3. Remove `disable-model-invocation` if the agent should auto-apply this skill from context.
4. Replace this body with your workflow.

## Description tips

- Write the description in **third person**.
- Include **what** the skill does and **when** to trigger it.
- Add keywords users might mention (file types, tools, task names).

## Example workflow section

```markdown
## Workflow

1. Step one — gather context
2. Step two — perform the task
3. Step three — validate output
```

## Additional resources

- For extended docs, add [reference.md](reference.md) and link from here.
- For examples, add [examples.md](examples.md).
