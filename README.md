# claude-sounds

Movie-quote MP3 clips that play as Claude Code hook sounds on macOS.

Each subdirectory maps to a Claude Code hook event. A random clip from the matching folder plays on every event via `afplay`.

| Directory | Hook event | When it fires |
|---|---|---|
| `session_start/` | `SessionStart` | New Claude Code session opens |
| `user_prompt_submit/` | `UserPromptSubmit` | You submit a prompt |
| `notification/` | `Notification` | Claude needs your attention |
| `stop/` | `Stop` | Claude finishes responding |
| `post_tool_use_failure/` | `PostToolUseFailure` | A tool call fails |
| `pre_tool_use/` | `PreToolUse` | Before any tool runs (empty by default) |
| `post_tool_use/` | `PostToolUse` | After any tool runs (empty by default) |
| `pre_compact/` | `PreCompact` | Before context compaction (empty by default) |
| `post_compact/` | `PostCompact` | After context compaction (empty by default) |

## Install

```bash
git clone https://github.com/fterraneo/claude-sounds.git
cd claude-sounds
chmod +x install.sh
./install.sh
```

Then merge the hooks from `settings-hooks.json` into `~/.claude/settings.json`.

## How it works

Each hook command picks a random MP3 from its folder and plays it at low volume (-v 0.025):

```bash
f=(~/.ai_coding_hooks/session_start/*.mp3)
afplay -v 0.025 "${f[$((RANDOM % ${#f[@]}))]}"
```

All hooks run async so they never block Claude Code.

## Adding your own sounds

Drop any `.mp3` file into the relevant subdirectory under `~/.ai_coding_hooks/` and it will be included in the random rotation automatically.
