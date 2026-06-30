# 本地启动 HTTP 服务，解决 Cursor 内置浏览器 file:// 白屏
# 用法: Set-ExecutionPolicy -Scope Process Bypass; .\serve.ps1

$Root = "D:\teach\sota"
$Port = 8765

if (-not (Test-Path (Join-Path $Root "lessons\index.html"))) {
  Write-Host "错误: 找不到 $Root\lessons\index.html"
  Write-Host "请先运行 fix-encoding.ps1"
  exit 1
}

Write-Host "SOTA 学习站点: http://localhost:$Port/lessons/index.html"
Write-Host "按 Ctrl+C 停止服务"
Write-Host ""

Start-Process "http://localhost:$Port/lessons/index.html"
Set-Location $Root
python -m http.server $Port
