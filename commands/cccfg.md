---
description: 查看或快速切换 Claude Code 的 agent 模型配置
argument-hint: [show|check|presets|preset <名>|set <agent> <模型>|save <名>]
---

用 Bash 工具执行下面这条命令（把 $ARGUMENTS 原样拼在末尾；没有参数时不拼）：

```
python3 "$HOME/.claude/bin/cccfg" $ARGUMENTS
```

然后把命令的原始输出如实展示给我，不要改写其中的模型名、数值或路径。如果输出里有 `[错误]` 或 `[提示]`，逐条解释含义，但**不要自行修改任何配置文件**——除非我在参数里明确用了 `preset` / `set` / `effort` / `concurrency` / `global-effort` / `main` / `rollback`。

常用示例：
- `/cccfg` — 看当前配置
- `/cccfg check` — 校验配置并列出反模式
- `/cccfg preset balanced --dry-run` — 预览「均衡」预设会改什么
- `/cccfg preset balanced` — 应用「均衡」预设
- `/cccfg save before-experiment` — 把当前配置存成快照
