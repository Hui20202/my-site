# my-site

我（Hui20202）的第一台服务器上的个人主页。

- **技术栈**：纯静态 HTML + CSS，无框架
- **跑在哪**：北大 CLab 云主机 `zero-first`（`10.129.246.200`），由 nginx 提供
- **什么时候能看**：校园网内 / 连北大 VPN 时，访问 http://10.129.246.200
- **本地路径**：`C:\Users\zero\projects\my-site`

## 文件

| 文件 | 作用 |
|---|---|
| `index.html` | 页面本体（深色 + 樱花粉，五片纯 CSS 飘落花瓣） |
| `deploy.ps1` | 一键部署：把 `index.html` 传到云主机并重载 nginx |

## 怎么改

1. 改 `index.html`
2. `git diff` 看看改了什么；改坏了 `git restore index.html`
3. `.\deploy.ps1` 部署上去
4. 满意就 `git add . && git commit -m "说明" && git push`

## 这一路的知识沉淀

`C:\01-工作文档\。06-第二大脑\`：

- `concepts/信息基础设施三件套.md` —— 远程 / 版本 / 搬运
- `concepts/AI成长复盘-总览.md` —— 按卡点记的成长台账

## 时间线

- 2026-10-14 云主机建好（2核2G / Ubuntu 24.04），nginx 上线
- 2026-10-17 纳入 Git，三份副本（本地 / GitHub / 云主机）
