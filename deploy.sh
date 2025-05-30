#!/bin/bash
#
## deploy.sh
## 必须在 hexo 分支执行！
#
#echo "▶️ 开始清理旧文件..."
#hexo clean
#
#echo "🚀 生成静态文件..."
#hexo generate
#
#echo "🔧 配置 Git 身份信息（自动适应不同环境）"
#git config --global user.name "kinghwj"
#git config --global user.email "kinghwj0605@icloud.com"
#
#echo "🌐 强制推送更新到 gh-pages 分支..."
#hexo deploy --generate  # 强制覆盖目标分支
#
#echo "✅ 部署完成！访问 https://yourname.github.io 查看效果"


# 生成静态文件
hexo generate

# 切换到发布分支
git checkout gh-pages

# 复制生成文件（需注意当前目录位置）
cp -rf public/* ./

# 提交更新
git add .
git commit -m "Update pages $(date +"%Y-%m-%d %H:%M:%S")"
git push origin gh-pages

# 切换回开发分支
git checkout hexo
