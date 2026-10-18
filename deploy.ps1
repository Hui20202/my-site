# 一键部署：把 index.html 传到云主机，并让 nginx 立即用新版本
# 用法（在 C:\Users\zero\projects\my-site 目录下）：  .\deploy.ps1
# 前提：~/.ssh/config 里配好了 Host clab（前面已经配过）

$ErrorActionPreference = "Stop"
$here = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $here

Write-Host "[1/3] 上传 index.html 和 assets ..." -ForegroundColor Cyan
scp -q index.html clab:/tmp/index.html
if ($LASTEXITCODE -ne 0) { throw "上传失败：检查校园网 / ssh clab 是否可用" }
scp -q -r assets clab:/tmp/assets
if ($LASTEXITCODE -ne 0) { throw "上传 assets 失败：检查 assets 目录是否存在" }

Write-Host "[2/3] 放到网站目录 ..." -ForegroundColor Cyan
ssh clab "sudo install -m 644 /tmp/index.html /var/www/html/index.html; sudo rm -rf /var/www/html/assets; sudo cp -r /tmp/assets /var/www/html/assets; sudo chown -R root:root /var/www/html/assets"
if ($LASTEXITCODE -ne 0) { throw "安装失败：检查云主机上的 sudo 权限" }

Write-Host "[3/3] 验证 ..." -ForegroundColor Cyan
$code = ssh clab "curl -s -o /dev/null -w '%{http_code}' http://127.0.0.1/"
if ($code -eq "200") {
    Write-Host "部署完成：http://10.129.246.200 已更新（HTTP 200）" -ForegroundColor Green
} else {
    Write-Host "警告：nginx 返回 $code，请检查 sudo systemctl status nginx" -ForegroundColor Yellow
}
