# 我的Neovim的配置文件

## 插件的快捷键
### Coc快捷键用法
![coc](https://user-images.githubusercontent.com/251450/55285193-400a9000-53b9-11e9-8cff-ffe4983c5947.gif)

| 快捷键 | 行为 |
|:----:|:----:|
| Ctrl-n | 补全下一个 |
| Ctrl-p | 补全上一个 |
| gd | 跳转定位|
| sr | 阅读函数帮助文档|
| [g | 跳转上一个错误 |
| ]g | 跳转下一个错误 |
| < leader>rn | 变量重命名 |
| < leader>t | 翻译单词 |

### Markdown快捷键用法
![Markdown](https://cloud.githubusercontent.com/assets/5492542/15363504/839753be-1d4b-11e6-9ac8-def4d7122e8d.gif)

| 快捷键 | 行为 |
|:----:|:----:|
| so | 打开网页 |
| sc | 关闭网页 |

### 代码片段UltiSnips
![Ultisnips](https://camo.githubusercontent.com/296aecf30e1607233814196db6bd3f5f47e70c73/68747470733a2f2f7261772e6769746875622e636f6d2f5369725665722f756c7469736e6970732f6d61737465722f646f632f64656d6f2e676966)

| 快捷键 | 行为 |
|:----:|:----:|
| TAB | 展开代码片段 |
| TAB | 跳转下一个代码片段 |
| Ctrl-o | 跳转上一个代码片段 |


### 颜色主题

| 快捷键 | 行为 |
|:----:|:----:|
| < leader>c1 | 更换主题1 |
| < leader>c2 | 更换主题2 |

### Nerdtree文件树
![Nerdtree文件树](https://github.com/preservim/nerdtree/raw/master/screenshot.png)

| 快捷键 | 行为 |
|:----:|:----:|
| T | 打开文件树 |

### NerdComment代码注释

| 快捷键 | 行为 |
|:----:|:----:|
| ctrl+/ | 添加/取消注释 |


### vim-buffet多个缓冲区
![vim-buffet多个缓冲区](https://raw.githubusercontent.com/bagrat/vim-buffet/e915a9f0627228c317a7498c800208813c0298c3/demo.png)

| 快捷键 | 行为 |
|:----:|:----:|
| TAB | 下一个缓冲区 |
| S-TAB | 上一个缓冲区 |
| < leader>1 | 切换到缓冲区1 |
| < leader>2 | 切换到缓冲区2 |
| < leader>3 | 切换到缓冲区3 |
| < leader>4 | 切换到缓冲区4 |
| < leader>5 | 切换到缓冲区5 |
| < leader>6 | 切换到缓冲区6 |
| < leader>7 | 切换到缓冲区7 |
| < leader>8 | 切换到缓冲区8 |
| < leader>9 | 切换到缓冲区9 |
| < leader>10 | 切换到缓冲区10 |

### vim-surround周围文字
想要添加包裹符号 (string -> "string"):
```
ves"
```
想要修改包裹符号 ("string" -> 'string'):
```shell
vesc"'
```
想要删除包裹符号 ('string' -> string):
```
vesd'
```
