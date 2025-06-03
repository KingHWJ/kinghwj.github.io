#!/bin/bash

echo "00-进入hexo文件夹"
cd hexo

# 生成静态文件
echo "01-生成静态文件"
hexo generate

# 切换到发布分支
echo "02-切换到发布分支: gh-pages"
git checkout gh-pages

# 复制生成文件（需注意当前目录位置）
echo "03-复制生成文件"
cp -rf public/* ./

# 提交更新
echo "04-提交更新"
git add .
git commit -m "Update pages $(date +"%Y-%m-%d %H:%M:%S")"
git push origin gh-pages

# 切换回开发分支
echo "05-切换回主分支: main"
git checkout main
