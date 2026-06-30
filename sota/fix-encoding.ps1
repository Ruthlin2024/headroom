# 修复 SOTA 学习文件中文乱码（重新从 GitHub 下载 UTF-8 原文件）
# 用法: Set-ExecutionPolicy -Scope Process Bypass; .\fix-encoding.ps1

$Base = "https://raw.githubusercontent.com/Ruthlin2024/headroom/cursor/sota-learning-materials-3159/sota"
$Root = "D:\teach\sota"

$files = @(
  "MISSION.md",
  "NOTES.md",
  "RESOURCES.md",
  "assets/styles.css",
  "learning-records/0001-corrected-to-sota.md",
  "lessons/index.html",
  "lessons/0001-what-is-sota.html",
  "lessons/0002-read-paper-sota-claims.html",
  "lessons/0003-leaderboard-practice.html",
  "lessons/0004-claim-vs-evidence.html",
  "lessons/0005-sota-vs-production.html",
  "reference/sota-glossary.html",
  "reference/four-questions-checklist.html"
)

foreach ($rel in $files) {
  $url = "$Base/$rel"
  $out = Join-Path $Root $rel
  $dir = Split-Path $out -Parent
  if (-not (Test-Path $dir)) { New-Item -ItemType Directory -Path $dir -Force | Out-Null }

  # 下载原始 UTF-8 字节
  Invoke-WebRequest -Uri $url -OutFile $out -UseBasicParsing

  # 加 UTF-8 BOM，方便 Windows 浏览器识别中文
  $bytes = [System.IO.File]::ReadAllBytes($out)
  $utf8NoBom = New-Object System.Text.UTF8Encoding $false
  $text = $utf8NoBom.GetString($bytes)
  $utf8Bom = New-Object System.Text.UTF8Encoding $true
  [System.IO.File]::WriteAllText($out, $text, $utf8Bom)

  Write-Host "OK $rel"
}

Write-Host ""
Write-Host "完成! 请刷新浏览器或重新打开:"
Write-Host "  D:\teach\sota\lessons\index.html"
Start-Process (Join-Path $Root "lessons\index.html")
