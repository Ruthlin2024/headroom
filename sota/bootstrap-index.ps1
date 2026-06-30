# 不依赖 GitHub，直接把 index.html 写入本地（解决空文件/白屏）
# 用法: Set-ExecutionPolicy -Scope Process Bypass; .\bootstrap-index.ps1

$out = "D:\teach\sota\lessons\index.html"
$dir = Split-Path $out -Parent
if (-not (Test-Path $dir)) { New-Item -ItemType Directory -Path $dir -Force | Out-Null }

$html = @'
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="UTF-8" />
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>SOTA 学习目录</title>
  <style>
    body { font-family: "Microsoft YaHei", "PingFang SC", sans-serif; max-width: 42rem; margin: 2rem auto; padding: 0 1rem; line-height: 1.6; color: #1a1a1a; background: #faf9f7; }
    h1 { font-size: 1.75rem; }
    h2 { border-bottom: 1px solid #ddd; padding-bottom: 0.3rem; margin-top: 2rem; }
    a { color: #2563eb; }
    .sub { color: #555; }
    footer { margin-top: 3rem; padding-top: 1rem; border-top: 1px solid #ddd; color: #666; font-size: 0.9rem; }
  </style>
</head>
<body>
  <h1>SOTA 学习目录</h1>
  <p class="sub">State-of-the-Art · 全部资料在 sota 文件夹</p>

  <h2>课程</h2>
  <ol>
    <li><a href="0001-what-is-sota.html">SOTA 是什么？四要素拆解</a></li>
    <li><a href="0002-read-paper-sota-claims.html">如何读论文里的 SOTA 声明</a></li>
    <li><a href="0003-leaderboard-practice.html">Leaderboard 实操指南</a></li>
    <li><a href="0004-claim-vs-evidence.html">声明 vs 证据：批判性阅读</a></li>
    <li><a href="0005-sota-vs-production.html">SOTA 不等于能上线</a></li>
  </ol>

  <h2>参考</h2>
  <ul>
    <li><a href="../reference/sota-glossary.html">术语速查</a></li>
    <li><a href="../reference/four-questions-checklist.html">四要素检查清单</a></li>
  </ul>

  <footer>有问题？回 Cursor Agent 继续 /teach</footer>
</body>
</html>
'@

[System.IO.File]::WriteAllText($out, $html, (New-Object System.Text.UTF8Encoding $true))
$len = (Get-Item $out).Length
Write-Host "已写入 index.html，大小: $len 字节"
if ($len -lt 500) { Write-Host "错误: 文件仍然太小"; exit 1 }

Start-Process $out
Write-Host "已用 Edge 打开。若 Cursor 内置浏览器白屏，请用 Edge 窗口查看。"
