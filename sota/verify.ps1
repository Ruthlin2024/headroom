# 检查 index.html 是否正确，并修复
$path = "D:\teach\sota\lessons\index.html"

Write-Host "=== 检查文件 ==="
if (-not (Test-Path $path)) { Write-Host "文件不存在!"; exit 1 }

$head = Get-Content $path -TotalCount 12 -Encoding UTF8
$head | ForEach-Object { Write-Host $_ }

$raw = Get-Content $path -Raw -Encoding UTF8
if ($raw -match "SOTA 学习目录") {
  Write-Host ""
  Write-Host "OK: 文件内容正确 (含 SOTA 学习目录)"
} elseif ($raw -match "甘特图") {
  Write-Host ""
  Write-Host "错误: 这是别的项目的文件! 请运行 fix-encoding.ps1 覆盖"
  exit 1
} else {
  Write-Host ""
  Write-Host "警告: 内容异常，建议运行 fix-encoding.ps1"
}
