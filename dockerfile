from docker.cnb.cool/masx200/docker_mirror/amap-maps-mcp-server:2025-08-03-15-23-58

copy ./debian.sources /etc/apt/sources.list.d/debian.sources
run apt update
run apt install apt-transport-https ca-certificates -y nano
run rm -rf /var/lib/apt/lists/*
run apt clean
COPY ./sources.list /etc/apt/sources.list

RUN apt-get update && apt-get install -y \
    apt-transport-https \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*



RUN apt-get update  && apt-get install -y sudo  && rm -rf /var/lib/apt/lists/*

run apt clean


WORKDIR /root/.npm/_npx/3f19108e4acac271/node_modules/@amap/amap-maps-mcp-server
run rm -rfv /root/.npm/_npx/3f19108e4acac271/node_modules/@amap/amap-maps-mcp-server/*
copy ./* /root/.npm/_npx/3f19108e4acac271/node_modules/@amap/amap-maps-mcp-server
copy ./build /root/.npm/_npx/3f19108e4acac271/node_modules/@amap/amap-maps-mcp-server/build
EXPOSE 3000 
copy . .
run npm config set registry https://registry.npmmirror.com
env HTTP_API_PORT=3000

run npm install -g cnpm --registry=https://registry.npmmirror.com



run cnpm install --force
ENTRYPOINT ["docker-entrypoint.sh"]
env NODE_OPTIONS="--max-old-space-size=4096"

env LANG=zh_CN.UTF-8
env DEBIAN_FRONTEND=noninteractive
env EDITOR=nano
env TZ=Asia/Shanghai

run apt-get update && apt-get install -y tzdata && apt clean && rm -rf /var/lib/apt/lists/*
run cnpm i -g npm cnpm --registry=https://registry.npmmirror.com

CMD ["node","/root/.npm/_npx/3f19108e4acac271/node_modules/@amap/amap-maps-mcp-server/build/streamable-http.js"]


run yarn install --force --registry https://registry.npmmirror.com