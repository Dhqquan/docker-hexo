FROM mhart/alpine-node:6

MAINTAINER dhq , <dhq@dhquan.cn>

RUN \
    apk --update --no-progress add git openssh

WORKDIR /Hexo

RUN \
    npm install hexo-cli -g \
    && hexo init . \
    && npm install \
    && npm install hexo-generator-sitemap --save \
    && npm install hexo-generator-feed --save \
    && npm install hexo-deployer-git --save \
    && npm uninstall hexo-renderer-marked --save \
    && npm install hexo-renderer-kramed --save

VOLUME ["/Hexo/source", "/Hexo/themes", "/root/.ssh"]

EXPOSE 80

COPY docker-entrypoint.sh /docker-entrypoint.sh
COPY inline.js /Hexo/node_modules/kramed/lib/rules/inline.js

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ['/bin/bash']
