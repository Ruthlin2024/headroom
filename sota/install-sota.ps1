# SOTA 学习资料一键安装到 D:\teach\sota
# 用法: PowerShell 中执行:  Set-ExecutionPolicy -Scope Process Bypass; .\install-sota.ps1

$Root = "D:\teach\sota"
$dirs = @("assets","lessons","reference","learning-records")
foreach ($d in $dirs) { New-Item -ItemType Directory -Path (Join-Path $Root $d) -Force | Out-Null }

function Write-Utf8($rel, $content) {
  $path = Join-Path $Root $rel
  $dir = Split-Path $path -Parent
  if ($dir -and -not (Test-Path $dir)) { New-Item -ItemType Directory -Path $dir -Force | Out-Null }
  [System.IO.File]::WriteAllText($path, $content, [System.Text.UTF8Encoding]::new($false))
}

Write-Utf8 'MISSION.md' @'
# Mission: SOTA（State-of-the-Art）

## Why

能准确理解「当前最好」在 AI / 科研语境里**到底指什么**——不被标题党、排行榜数字或论文 abstract 里的 SOTA 声明误导；读论文、看模型发布、跟踪技术进展时有清晰的判断框架。

## Success looks like

- 看到「SOTA」能立刻追问四个要素：**任务、指标、基准、时间点**
- 能打开一篇声称 SOTA 的论文，判断证据是否支撑声明
- 知道去哪里查当前 leaderboard（如 Papers with Code）
- 理解「SOTA ≠ 万能」「SOTA ≠ 能直接上线」的常见误区
- 能用中文向他人解释 SOTA，并指出声明里可能的漏洞

## Constraints

- 学习目录：当前工作区的 `sota/` 文件夹（Windows 本地对应 `D:\teach\sota`）
- 中文讲解，保留英文术语 SOTA / benchmark / leaderboard
- 每课短、带自测；优先 AI/ML 场景，可延伸到其他科研领域

## Out of scope

- 深入某一具体模型架构（Transformer 细节等）—— 本工作区教「如何读懂 SOTA」，不教模型实现
- SOAR 学习法、医学 SOAT 骨科评估工具

'@

Write-Utf8 'NOTES.md' @'
# Notes

- 主题：**SOTA（State-of-the-Art）**
- 文件夹：**sota/**（全部资料在此目录）
- 生成日期：2026-06-30

## 文件清单

```
sota/
├── MISSION.md
├── RESOURCES.md
├── NOTES.md
├── assets/styles.css
├── lessons/
│   ├── index.html              ← 从这里开始
│   ├── 0001-what-is-sota.html
│   ├── 0002-read-paper-sota-claims.html
│   ├── 0003-leaderboard-practice.html
│   ├── 0004-claim-vs-evidence.html
│   └── 0005-sota-vs-production.html
├── reference/
│   ├── sota-glossary.html
│   └── four-questions-checklist.html
└── learning-records/
    └── 0001-corrected-to-sota.md
```

## 学习顺序

打开 `lessons/index.html` → 按 1→5 顺序学习 → 用检查清单分析一篇真实论文。

'@

Write-Utf8 'RESOURCES.md' @'
# SOTA Resources

## Knowledge

- [State-of-the-Art Claims Require State-of-the-Art Evidence (arXiv)](https://arxiv.org/html/2605.17273v1)
  批判性阅读必读：SOTA 声明与 benchmark 证据之间的 gap。Use for: 判断论文/排行榜声明是否站得住脚。
- [Exploring SOTA — DigitalOcean](https://www.digitalocean.com/community/tutorials/exploring-sota-guide-to-cutting-edge-ai-models)
  SOTA 入门：定义、benchmark、常见领域。Use for: 第一课背景。
- [State of the Art Model — HowAIWorks.ai Glossary](https://howaiworks.ai/glossary/state-of-the-art-model)
  简明术语表。Use for: 快速查定义。
- [Papers with Code — Leaderboards](https://paperswithcode.com/)
  查某任务当前排名与论文链接。Use for: 实践「任务+指标+基准+时间」四要素。

## Wisdom (Communities)

- [r/MachineLearning](https://reddit.com/r/MachineLearning)
  论文讨论、对 SOTA 声明的质疑常出现。Use for: 看社区如何解读 leaderboard 变化。
- 本地：读一篇声称 SOTA 的论文 abstract + 表格，用 Agent 做「四要素 + 证据强度」拆解

## Gaps

- 若你的目标是**非 AI 领域**（如材料、生物）的 SOTA，需补充该领域专用 benchmark 列表——请在 Agent 中说明领域。

## 历史修正

- 原目标误写为 SOAT → 曾对齐 SOAR 学习法 / 医学 SOAT
- **2026-06-30 确认**：用户要的是 **SOTA = State-of-the-Art**

'@

Write-Utf8 'assets/styles.css' @'
:root {
  --bg: #faf9f7;
  --text: #1a1a1a;
  --muted: #555;
  --accent: #2563eb;
  --accent-soft: #dbeafe;
  --border: #e5e2dd;
  --correct: #15803d;
  --wrong: #b91c1c;
  font-family: "Georgia", "Noto Serif SC", serif;
  line-height: 1.65;
}

* { box-sizing: border-box; }

body {
  margin: 0;
  background: var(--bg);
  color: var(--text);
  max-width: 42rem;
  margin-inline: auto;
  padding: 2rem 1.25rem 4rem;
}

h1 {
  font-size: 1.75rem;
  font-weight: 600;
  letter-spacing: -0.02em;
  margin-bottom: 0.25rem;
}

.subtitle {
  color: var(--muted);
  font-size: 0.95rem;
  margin-bottom: 2rem;
}

h2 {
  font-size: 1.15rem;
  margin-top: 2rem;
  border-bottom: 1px solid var(--border);
  padding-bottom: 0.35rem;
}

p { margin: 0.75rem 0; }

.soar-grid {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 0.75rem;
  margin: 1.25rem 0;
}

@media (max-width: 480px) {
  .soar-grid { grid-template-columns: 1fr; }
}

.soar-card {
  border: 1px solid var(--border);
  border-radius: 6px;
  padding: 0.85rem 1rem;
  background: #fff;
}

.soar-card strong {
  display: block;
  color: var(--accent);
  font-size: 0.85rem;
  letter-spacing: 0.04em;
  text-transform: uppercase;
  margin-bottom: 0.25rem;
}

.callout {
  border-left: 3px solid var(--accent);
  padding: 0.75rem 1rem;
  background: var(--accent-soft);
  margin: 1.25rem 0;
  font-size: 0.95rem;
}

.quiz {
  border: 1px solid var(--border);
  border-radius: 8px;
  padding: 1.25rem;
  background: #fff;
  margin: 1.5rem 0;
}

.quiz-options label {
  display: block;
  padding: 0.6rem 0.75rem;
  margin: 0.4rem 0;
  border: 1px solid var(--border);
  border-radius: 4px;
  cursor: pointer;
  transition: background 0.15s;
}

.quiz-options label:hover { background: #f5f5f4; }

.quiz-options input { margin-right: 0.5rem; }

#quiz-feedback {
  margin-top: 1rem;
  font-weight: 600;
  min-height: 1.5rem;
}

button {
  margin-top: 0.75rem;
  padding: 0.5rem 1.25rem;
  background: var(--accent);
  color: #fff;
  border: none;
  border-radius: 4px;
  font-size: 0.95rem;
  cursor: pointer;
}

button:hover { filter: brightness(1.08); }

footer {
  margin-top: 3rem;
  padding-top: 1rem;
  border-top: 1px solid var(--border);
  font-size: 0.85rem;
  color: var(--muted);
}

a { color: var(--accent); }

.card-grid {
  display: grid;
  grid-template-columns: 1fr 1fr 1fr;
  gap: 0.75rem;
  margin: 1.25rem 0;
}

@media (max-width: 560px) {
  .card-grid { grid-template-columns: 1fr; }
}

.card {
  border: 1px solid var(--border);
  border-radius: 6px;
  padding: 0.85rem 1rem;
  background: #fff;
}

.card strong {
  display: block;
  color: var(--accent);
  font-size: 0.85rem;
  margin-bottom: 0.25rem;
}

'@

Write-Utf8 'learning-records/0001-corrected-to-sota.md' @'
# 学习主题修正为 SOTA

用户澄清：要学的是 **SOTA（State-of-the-Art）**，不是 SOAR 学习法，也不是医学 Standardized Orthopedic Assessment Tool。此前 `soat` 文件夹命名来自拼写误差。

**Implications:** 废弃 SOAR 课程路径；从「SOTA 四要素」起步；工作区建议使用 `sota` 目录名。

'@

Write-Utf8 'lessons/0001-what-is-sota.html' @'
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>第 1 课：SOTA 是什么？</title>
  <link rel="stylesheet" href="../assets/styles.css" />
  <style>
    .quad { display: grid; grid-template-columns: 1fr 1fr; gap: 0.75rem; margin: 1.25rem 0; }
    @media (max-width: 480px) { .quad { grid-template-columns: 1fr; } }
    .quad div { border: 1px solid var(--border); border-radius: 6px; padding: 0.85rem; background: #fff; }
    .quad strong { color: var(--accent); display: block; margin-bottom: 0.25rem; }
    table { width: 100%; border-collapse: collapse; font-size: 0.9rem; margin: 1rem 0; }
    th, td { border: 1px solid var(--border); padding: 0.5rem 0.65rem; text-align: left; }
    th { background: #f5f5f4; }
  </style>
</head>
<body>
  <h1>第 1 课：SOTA 是什么？</h1>
  <p class="subtitle">State-of-the-Art · 约 12 分钟</p>

  <div class="callout">
    <strong>SOTA</strong> = <strong>State-of-the-Art</strong>，指在<strong>特定任务</strong>上、按<strong>特定指标</strong>、在<strong>特定基准</strong>上、于<strong>某一时间点</strong>报告的最佳已知结果。不是「全世界最强的 AI」。
  </div>

  <h2>一句话定义</h2>
  <p>
    在 AI/ML 里，SOTA 通常指：某模型在某 benchmark 上刷新了公开排行榜的最高分。
    来源：<a href="https://howaiworks.ai/glossary/state-of-the-art-model" target="_blank" rel="noopener">HowAIWorks — SOTA Glossary</a>
  </p>

  <h2>四个必问要素</h2>
  <p>看到「我们达到 SOTA」时，立刻拆成四问——缺任何一项，声明就不完整：</p>

  <div class="quad">
    <div><strong>1. 任务 Task</strong>图像分类？问答？代码生成？</div>
    <div><strong>2. 指标 Metric</strong>准确率？F1？BLEU？延迟？</div>
    <div><strong>3. 基准 Benchmark</strong>ImageNet？MMLU？自建测试集？</div>
    <div><strong>4. 时间 Time</strong>2024 年 3 月榜一，今天可能已被超越</div>
  </div>

  <h2>例子：同一句「SOTA」可能完全不同</h2>
  <table>
    <thead>
      <tr><th>说法</th><th>隐含四要素</th></tr>
    </thead>
    <tbody>
      <tr><td>「GPT-X 是 SOTA」</td><td>❌ 未说明任务/指标/基准——无法验证</td></tr>
      <tr><td>「在 MMLU 上 SOTA」</td><td>⚠️ 有基准，仍缺指标细节与对比设置</td></tr>
      <tr><td>「SuperGLUE 平均分 91.2，超过此前最佳 90.8」</td><td>✅ 任务+基准+数字+对比——可核查</td></tr>
    </tbody>
  </table>

  <h2>常见误区</h2>
  <ul>
    <li><strong>SOTA ≠ 所有任务都最好</strong> — A 模型在 NLP 榜一，在视觉可能一般</li>
    <li><strong>SOTA ≠ 能直接产品化</strong> — 榜一可能极慢、极贵、或只在实验室设置下成立</li>
    <li><strong>榜一 ≠ 真正全面更好</strong> — 研究指出很多 SOTA 声明证据不足，见 <a href="https://arxiv.org/html/2605.17273v1" target="_blank" rel="noopener">SOTA Claims Require SOTA Evidence</a></li>
  </ul>

  <h2>自测</h2>
  <div class="quiz">
    <p><strong>新闻标题：</strong>「某公司发布 SOTA 大模型，全面超越竞品。」<br/>最合理的第一反应是？</p>
    <div class="quiz-options">
      <label><input type="radio" name="q1" value="a" /> A. 它一定是最强的通用 AI，可以直接替换现有产品</label>
      <label><input type="radio" name="q1" value="b" /> B. 问：在哪个 task、metric、benchmark 上 SOTA？有无公开数字？</label>
      <label><input type="radio" name="q1" value="c" /> C. SOTA 只是营销词，完全不可信，直接忽略</label>
    </div>
    <button type="button" onclick="checkQuiz()">提交</button>
    <div id="quiz-feedback"></div>
  </div>

  <h2>下一课预告</h2>
  <p>
    第 2 课：如何读论文里的 SOTA 声明（abstract → 实验表格 → baseline 是否公平）。
    速查：<a href="../reference/sota-glossary.html">SOTA 术语表</a>
  </p>

  <footer>
    有问题？回 Cursor Agent 问，例如：「帮我把这篇论文的 SOTA 声明拆成四要素。」
  </footer>

  <script>
    function checkQuiz() {
      const picked = document.querySelector(''input[name="q1"]:checked'');
      const fb = document.getElementById(''quiz-feedback'');
      if (!picked) { fb.style.color = ''#b91c1c''; fb.textContent = ''请先选择。''; return; }
      if (picked.value === ''b'') {
        fb.style.color = ''#15803d'';
        fb.textContent = ''正确。SOTA 是 contextual 的——先追问四要素，再判断证据。'';
      } else if (picked.value === ''a'') {
        fb.style.color = ''#b91c1c'';
        fb.textContent = ''过度推断。SOTA 几乎从不当「全面最强」的同义词。'';
      } else {
        fb.style.color = ''#b91c1c'';
        fb.textContent = ''太绝对。很多 SOTA 可核查，关键是看证据是否匹配声明。'';
      }
    }
  </script>
</body>
</html>

'@

Write-Utf8 'lessons/0002-read-paper-sota-claims.html' @'
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>第 2 课：读论文里的 SOTA 声明</title>
  <link rel="stylesheet" href="../assets/styles.css" />
</head>
<body>
  <h1>第 2 课：如何读论文里的 SOTA 声明</h1>
  <p class="subtitle">从 abstract 到实验表格 · 约 15 分钟</p>

  <h2>阅读顺序（不要从结论倒推）</h2>
  <ol>
    <li><strong>Abstract</strong> — 圈出所有 SOTA / outperform / state-of-the-art 字样</li>
    <li><strong>实验设置</strong> — 用的哪个 benchmark？metric 怎么算？</li>
    <li><strong>对比表格</strong> — baseline 是谁？是否公平（同数据、同算力、同 prompt）？</li>
    <li><strong>提升幅度</strong> — 0.3 分在 100 分制里有意义吗？有误差条/多次 run 吗？</li>
  </ol>

  <div class="callout">
    Abstract 里的 SOTA 是<strong>主张</strong>；Table 2 才是<strong>证据</strong>。你的工作是检查二者是否匹配。
  </div>

  <h2>表格里要看的 5 列信息</h2>
  <ul>
    <li>Method / Model name</li>
    <li>Benchmark subset（如 MMLU 全量还是子集）</li>
    <li>Metric 数值</li>
    <li>Baseline 来源（同期公开模型还是作者复现）</li>
    <li>是否 bold 最佳 — bold 只表示该列最高，不表示全面胜利</li>
  </ul>

  <h2>红旗信号 🚩</h2>
  <ul>
    <li>只比「自家上一版」或弱 baseline</li>
    <li>测试集与训练集有泄漏嫌疑</li>
    <li>未报告 variance / 单次 run</li>
    <li>「SOTA on average」但多数子任务输给别人</li>
  </ul>
  <p>延伸阅读：<a href="https://arxiv.org/html/2605.17273v1" target="_blank" rel="noopener">SOTA Claims Require SOTA Evidence</a></p>

  <h2>自测</h2>
  <div class="quiz">
    <p>Abstract 写「achieves new SOTA on Benchmark X」，你下一步最该做？</p>
    <div class="quiz-options">
      <label><input type="radio" name="q1" value="a" /> A. 转发结论，说明 X 已被解决</label>
      <label><input type="radio" name="q1" value="b" /> B. 打开 Table，核对 metric、baseline、子任务分布</label>
      <label><input type="radio" name="q1" value="c" /> C. 只看 citation 数判断可信度</label>
    </div>
    <button type="button" onclick="check()">提交</button>
    <div id="fb"></div>
  </div>

  <footer>
    <a href="0001-what-is-sota.html">← 第 1 课</a> ·
    <a href="0003-leaderboard-practice.html">第 3 课 →</a>
  </footer>
  <script>
    function check() {
      const p = document.querySelector(''input[name="q1"]:checked'');
      const fb = document.getElementById(''fb'');
      if (!p) { fb.style.color=''#b91c1c''; fb.textContent=''请选择''; return; }
      fb.style.color = p.value===''b'' ? ''#15803d'' : ''#b91c1c'';
      fb.textContent = p.value===''b'' ? ''正确。证据在实验段，不在 abstract 形容词里。'' : p.value===''a'' ? ''过早下结论。'' : ''Citation 与单次实验设计无关。'';
    }
  </script>
</body>
</html>

'@

Write-Utf8 'lessons/0003-leaderboard-practice.html' @'
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>第 3 课：Leaderboard 实操</title>
  <link rel="stylesheet" href="../assets/styles.css" />
</head>
<body>
  <h1>第 3 课：Leaderboard 实操</h1>
  <p class="subtitle">Papers with Code · 约 10 分钟</p>

  <h2>为什么要查 leaderboard？</h2>
  <p>
    论文里的 SOTA 是<strong>发表时刻</strong>的快照；公开 leaderboard 帮你回答：
    「现在谁在第一？这篇论文还准吗？」
  </p>
  <p>入口：<a href="https://paperswithcode.com/" target="_blank" rel="noopener">paperswithcode.com</a></p>

  <h2>四步实操</h2>
  <ol>
    <li><strong>搜任务</strong> — 如 "question answering"、"image classification"</li>
    <li><strong>点进 benchmark</strong> — 看清 dataset 版本（如 ImageNet vs ImageNet-V2）</li>
    <li><strong>看 metric 列</strong> — Top-1 accuracy？mAP？不同列榜一可能不同</li>
    <li><strong>点第一名论文</strong> — 读 code 是否开源、设置是否可复现</li>
  </ol>

  <div class="callout">
    榜一经常变。记录查询日期，例如：「截至 2026-06，MMLU 榜一为 …」
  </div>

  <h2>动手作业</h2>
  <p>任选一个你关心的 AI 任务，在 Papers with Code 填这张表（可写在 NOTES.md）：</p>
  <ul>
    <li>Task：</li>
    <li>Benchmark 全名：</li>
    <li>Metric：</li>
    <li>当前榜一模型：</li>
    <li>查询日期：</li>
  </ul>

  <footer>
    <a href="0002-read-paper-sota-claims.html">← 第 2 课</a> ·
    <a href="0004-claim-vs-evidence.html">第 4 课 →</a>
  </footer>
</body>
</html>

'@

Write-Utf8 'lessons/0004-claim-vs-evidence.html' @'
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>第 4 课：声明 vs 证据</title>
  <link rel="stylesheet" href="../assets/styles.css" />
</head>
<body>
  <h1>第 4 课：声明 vs 证据</h1>
  <p class="subtitle">Claim-evidence gap · 约 12 分钟</p>

  <h2>核心问题</h2>
  <p>
    很多论文 abstract 写「SOTA」，但表格只证明：<strong>平均分高了 0.2</strong>。
    这不一定等于「大多数子任务更好」「效果量有意义」「去掉某个数据集仍领先」。
  </p>
  <p>
    来源：<a href="https://arxiv.org/html/2605.17273v1" target="_blank" rel="noopener">State-of-the-Art Claims Require State-of-the-Art Evidence</a>
  </p>

  <h2>声明强度 vs 证据强度</h2>
  <table style="width:100%;border-collapse:collapse;font-size:0.9rem">
    <tr style="background:#f5f5f4"><th style="border:1px solid #e5e2dd;padding:0.5rem">弱证据</th><th style="border:1px solid #e5e2dd;padding:0.5rem">强证据</th></tr>
    <tr><td style="border:1px solid #e5e2dd;padding:0.5rem">单一 aggregate 分数</td><td style="border:1px solid #e5e2dd;padding:0.5rem">多数子任务一致领先 + 效应量</td></tr>
    <tr><td style="border:1px solid #e5e2dd;padding:0.5rem">一次 run</td><td style="border:1px solid #e5e2dd;padding:0.5rem">多次 seed + 置信区间</td></tr>
    <tr><td style="border:1px solid #e5e2dd;padding:0.5rem">弱 baseline</td><td style="border:1px solid #e5e2dd;padding:0.5rem">同期强公开 baseline 公平对比</td></tr>
  </table>

  <h2>你可以用的三句话模板</h2>
  <ul>
    <li>「作者在 <em>benchmark B</em> 的 <em>metric M</em> 上报告了最高分。」（事实）</li>
    <li>「这是否构成 broad SOTA，取决于子任务分布与效应量。」（审慎）</li>
    <li>「我尚未验证 baseline 公平性与复现性。」（诚实边界）</li>
  </ul>

  <div class="quiz">
    <p>平均分第一，但 60% 子任务输给榜二。最准确的表述？</p>
    <div class="quiz-options">
      <label><input type="radio" name="q1" value="a" /> A. 全面 SOTA，全面超越榜二</label>
      <label><input type="radio" name="q1" value="b" /> B. aggregate metric 领先，但子任务表现不一致</label>
      <label><input type="radio" name="q1" value="c" /> C. 不是 SOTA，声明造假</label>
    </div>
    <button type="button" onclick="check()">提交</button>
    <div id="fb"></div>
  </div>

  <footer>
    <a href="0003-leaderboard-practice.html">← 第 3 课</a> ·
    <a href="0005-sota-vs-production.html">第 5 课 →</a>
  </footer>
  <script>
    function check() {
      const p = document.querySelector(''input[name="q1"]:checked'');
      const fb = document.getElementById(''fb'');
      if (!p) { fb.style.color=''#b91c1c''; fb.textContent=''请选择''; return; }
      fb.style.color = p.value===''b'' ? ''#15803d'' : ''#b91c1c'';
      fb.textContent = p.value===''b'' ? ''正确。精确描述 aggregate vs per-task。'' : p.value===''a'' ? ''过度解读 aggregate。'' : ''不一定造假，可能是 claim 过强。'';
    }
  </script>
</body>
</html>

'@

Write-Utf8 'lessons/0005-sota-vs-production.html' @'
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>第 5 课：SOTA ≠ 能上线</title>
  <link rel="stylesheet" href="../assets/styles.css" />
</head>
<body>
  <h1>第 5 课：SOTA ≠ 能上线 ≠ 最便宜</h1>
  <p class="subtitle">三个维度不要混 · 约 10 分钟</p>

  <h2>三个正交维度</h2>
  <div class="card-grid">
    <div class="card"><strong>榜单性能</strong>Benchmark 分数是否最高</div>
    <div class="card"><strong>产品可用</strong>延迟、稳定性、安全、可维护</div>
    <div class="card"><strong>经济可行</strong>推理成本、GPU、能耗</div>
  </div>

  <p>实验室 SOTA 可能在 8×H100 上跑；产品可能要 CPU 边缘部署——<strong>不是同一个问题</strong>。</p>

  <h2>选型问句（比「是不是 SOTA」更有用）</h2>
  <ul>
    <li>我们的 task 和 benchmark 一致吗？</li>
    <li>p99 延迟预算是多少？</li>
    <li>单次推理成本上限？</li>
    <li>失败时谁负责？（幻觉、安全）</li>
  </ul>

  <div class="callout">
    <strong>毕业标准：</strong>你能向同事解释——为什么我们不直接上 leaderboard 第一名。
  </div>

  <h2>课程完成 ✓</h2>
  <p>五课走完，你应能：四要素拆解 → 读表 → 查榜 → 批判声明 → 区分研究 vs 产品。</p>
  <p>继续练习：选一篇真实论文，用 <a href="../reference/four-questions-checklist.html">检查清单</a> 写半页分析，存到 <code>learning-records/</code>。</p>

  <footer>
    <a href="0004-claim-vs-evidence.html">← 第 4 课</a> ·
    <a href="index.html">返回目录</a>
  </footer>
</body>
</html>

'@

Write-Utf8 'lessons/index.html' @'
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>SOTA 学习目录</title>
  <link rel="stylesheet" href="../assets/styles.css" />
</head>
<body>
  <h1>SOTA 学习目录</h1>
  <p class="subtitle">State-of-the-Art · 全部资料在 <code>sota/</code> 文件夹</p>

  <h2>课程</h2>
  <ol>
    <li><a href="0001-what-is-sota.html">SOTA 是什么？四要素拆解</a></li>
    <li><a href="0002-read-paper-sota-claims.html">如何读论文里的 SOTA 声明</a></li>
    <li><a href="0003-leaderboard-practice.html">Leaderboard 实操指南</a></li>
    <li><a href="0004-claim-vs-evidence.html">声明 vs 证据：批判性阅读</a></li>
    <li><a href="0005-sota-vs-production.html">SOTA ≠ 能上线 ≠ 最便宜</a></li>
  </ol>

  <h2>参考</h2>
  <ul>
    <li><a href="../reference/sota-glossary.html">术语速查</a></li>
    <li><a href="../reference/four-questions-checklist.html">四要素检查清单（可打印）</a></li>
    <li><a href="../MISSION.md">MISSION.md</a></li>
    <li><a href="../RESOURCES.md">RESOURCES.md</a></li>
  </ul>

  <footer>有问题？回 Cursor Agent 继续 /teach</footer>
</body>
</html>

'@

Write-Utf8 'reference/four-questions-checklist.html' @'
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="UTF-8" />
  <title>SOTA 四要素检查清单</title>
  <link rel="stylesheet" href="../assets/styles.css" />
  <style>@media print { body { max-width: none; } }</style>
</head>
<body>
  <h1>SOTA 四要素检查清单</h1>
  <p class="subtitle">读论文 / 新闻 / 发布会时打印使用</p>

  <h2>1. Task — 什么任务？</h2>
  <p>□ 任务定义清楚 &nbsp; □ 与我的场景一致 &nbsp; □ 不明确 ___</p>

  <h2>2. Metric — 什么指标？</h2>
  <p>□ 指标名称：______ &nbsp; □ 越高越好 / 越低越好 &nbsp; □ 未说明</p>

  <h2>3. Benchmark — 什么基准？</h2>
  <p>□ 数据集版本：______ &nbsp; □ 公开可复现 &nbsp; □ 自建/私有</p>

  <h2>4. Time — 何时有效？</h2>
  <p>□ 论文/发布日期：______ &nbsp; □ 已查当前 leaderboard：______</p>

  <h2>证据强度（可选）</h2>
  <p>□ baseline 公平 &nbsp; □ 多次 run / 误差 &nbsp; □ 子任务一致 &nbsp; □ 仅 aggregate</p>

  <h2>产品维度（可选）</h2>
  <p>□ 延迟可接受 &nbsp; □ 成本可接受 &nbsp; □ 安全/合规 OK</p>

  <footer><a href="../lessons/index.html">← 课程目录</a></footer>
</body>
</html>

'@

Write-Utf8 'reference/sota-glossary.html' @'
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>SOTA 术语速查</title>
  <link rel="stylesheet" href="../assets/styles.css" />
  <style>
    dl { margin: 1rem 0; }
    dt { font-weight: 600; color: var(--accent); margin-top: 1rem; }
    dd { margin: 0.25rem 0 0 0; }
    .avoid { font-size: 0.85rem; color: var(--muted); }
  </style>
</head>
<body>
  <h1>SOTA 术语速查</h1>
  <p class="subtitle">State-of-the-Art · 本工作区 canonical 用语</p>

  <dl>
    <dt>SOTA / State-of-the-Art</dt>
    <dd>在特定任务+指标+基准上，某时间点报告的最佳已知结果。</dd>
    <dd class="avoid">避免：最强 AI、全面超越、永远最好。</dd>

    <dt>Benchmark（基准）</dt>
    <dd>标准化测试集 + 评测协议，使不同方法可公平对比。</dd>

    <dt>Leaderboard（排行榜）</dt>
    <dd>按 benchmark 汇总模型排名；如 Papers with Code。</dd>

    <dt>Metric（指标）</dt>
    <dd>衡量好坏的数字：accuracy、F1、BLEU、latency 等；不同指标榜一可能不同。</dd>

    <dt>Baseline（基线）</dt>
    <dd>对比用的参照模型；不公平 baseline 会夸大 SOTA 幅度。</dd>

    <dt>Claim-evidence gap</dt>
    <dd>SOTA 声明强度超过 benchmark 表格实际能支撑的程度。</dd>
  </dl>

  <h2>与易混词区分</h2>
  <dl>
    <dt>SOAR</dt>
    <dd>学习方法（Select/Organize/Associate/Regulate）—— 无关。</dd>
    <dt>医学 SOAT</dt>
    <dd>Standardized Orthopedic Assessment Tool，骨科查体评分 —— 无关。</dd>
  </dl>

  <footer><a href="../lessons/0001-what-is-sota.html">← 第 1 课</a></footer>
</body>
</html>

'@

Write-Host "完成! 文件已写入 $Root"
Write-Host "打开课程: Start-Process `"$Root\lessons\index.html`""
Start-Process (Join-Path $Root "lessons\index.html")