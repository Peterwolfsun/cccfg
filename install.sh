#!/usr/bin/env bash
# 把 cccfg 装到 ~/.claude 并链接到 ~/.local/bin。
# 不会覆盖已存在的配置（预设、别名、斜杠命令），只会安装缺失的文件。
set -euo pipefail

HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CLAUDE_DIR="${CLAUDE_DIR:-$HOME/.claude}"
BIN_DIR="${BIN_DIR:-$HOME/.local/bin}"

mkdir -p "$CLAUDE_DIR/bin" "$CLAUDE_DIR/commands" "$BIN_DIR"

cp "$HERE/cccfg" "$CLAUDE_DIR/bin/cccfg"
chmod +x "$CLAUDE_DIR/bin/cccfg"

[ -f "$CLAUDE_DIR/cccfg-presets.json" ] || cp "$HERE/cccfg-presets.json" "$CLAUDE_DIR/cccfg-presets.json"
[ -f "$CLAUDE_DIR/cccfg-aliases.example.json" ] || cp "$HERE/cccfg-aliases.example.json" "$CLAUDE_DIR/cccfg-aliases.example.json"
[ -f "$CLAUDE_DIR/cccfg-aliases.json" ] || cp "$HERE/cccfg-aliases.example.json" "$CLAUDE_DIR/cccfg-aliases.json"
[ -f "$CLAUDE_DIR/commands/cccfg.md" ] || cp "$HERE/commands/cccfg.md" "$CLAUDE_DIR/commands/cccfg.md"

ln -sf "$CLAUDE_DIR/bin/cccfg" "$BIN_DIR/cccfg"

printf '%s\n' \
  "安装完成。" \
  "  下一步: 编辑 $CLAUDE_DIR/cccfg-aliases.json，把 REPLACE_WITH_* 换成你自己的模型 id" \
  "          (可在 ~/.claude/settings.json 的 modelPicker.options[].model 找到)" \
  "  然后运行: cccfg check" \
  "  斜杠命令: 在 Claude Code 里输入 /cccfg"
