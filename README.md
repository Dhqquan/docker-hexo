# docker-hexo

将 hexo 制作成 docker Image。

修复了显示Mathjax的问题。



## 制作 Image

下载 **Dockerfile**、**docker-entrypoint.sh** 和 **inline.js**

```shell
$ docker build -t xxx/hexo .
```

xxx/hexo 是你定义的 Image 名称，注意别忘了后面的 `.`



##制作 Container

### hexo-server Container

```shell
$ docker run -p 4000:80 --name hexo-server -d \
-v {你的博客文件夹路径}/.ssh:/root/.ssh \
-v {你的博客文件夹路径}/source:/Hexo/source \
-v {你的博客文件夹路径}/themes:/Hexo/themes \
-v {你的博客文件夹路径}/_config.yml:/Hexo/_config.yml \
xxx/hexo {你的 github username} {你的 github email} server
```

注意：

+ { 你的博客文件夹路径 } 即你新建的文件目录 eg：/Hexo
+ 命令中的 xxx/hexo 即上一步的 Image 名称
+ 命令中的 -v 即挂载命令

Kitematic 中可以看到 hexo-server container 正在运行，点击 exec 可以进入 container 控制台。



### hexo-deploy Container

```shell
$ docker run -p 4000:80 --name hexo-deploy -d \
-v {你的博客文件夹路径}/.ssh:/root/.ssh \
-v {你的博客文件夹路径}/source:/Hexo/source \
-v {你的博客文件夹路径}/themes:/Hexo/themes \
-v {你的博客文件夹路径}/_config.yml:/Hexo/_config.yml \
xxx/hexo {你的 github username} {你的 github email} deploy
```

hexo-deploy 将你的博客部署到 Github 上。



## 参考

<https://github.com/yakumioto/docker-hexo>

[Hexo 的 Next 主题中渲染 MathJax 数学公式](https://blog.csdn.net/wgshun616/article/details/81019687)

