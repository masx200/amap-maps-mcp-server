# AMap Map MCP Server

MCP Server for the AMap Map API.

## Setup

### API Key

Get a AMap Maps API key：
https://lbs.amap.com/api/webservice/create-project-and-key.

### NPX

```json
{
  "mcpServers": {
    "amap-maps": {
      "command": "npx",
      "args": ["-y", "@masx200/amap-maps-mcp-server"],
      "env": {
        "AMAP_MAPS_API_KEY": "您在高德官网上申请的key"
      }
    }
  }
}
```

### 环境变量

可配置的环境变量：

- `AMAP_MAPS_API_KEY`: 高德地图API密钥（必需）
- `HTTP_API_TOKEN`: HTTP API访问令牌（可选）
- `HTTP_API_PORT`: HTTP服务器端口号（可选，默认为3000）

### Streamable-HTTP协议服务器

除了作为MCP服务器运行外，本项目还支持启动独立的streamable-http协议服务器：

#### 直接启动

```bash
node ./build/streamable-http.js
```

#### 使用环境变量配置

```bash
# 设置端口（默认3000）
export HTTP_API_PORT=3000

# 设置访问令牌（可选）
export HTTP_API_TOKEN=your-secret-token

# 设置高德地图API密钥
export AMAP_MAPS_API_KEY=your-amap-api-key

# 启动服务器
node ./build/streamable-http.js
```

#### 使用示例

启动后，服务器将在 `http://localhost:3000` 运行，支持以下端点：

- `POST /mcp` - MCP协议通信端点
- 支持streamable-http协议的实时数据流

如果设置了 `HTTP_API_TOKEN`，请在请求头中添加：

```
Authorization: Bearer your-secret-token
```

## Overview

### What is Amap Maps?

Amap Maps is a server that supports any MCP protocol client, allowing users to
easily utilize the Amap Maps MCP server for various location-based services.

### How to use Amap Maps?

To use Amap Maps, configure it in a compatible client like Cursor by copying
your API key and setting up the server command as specified in the
documentation.

### Key features of Amap Maps?

Supports multiple location services including geocoding, weather, and distance
measurement. Provides APIs for various transportation modes including walking,
driving, and public transit. Allows for detailed searches of points of interest
(POIs) based on keywords or location.

### Use cases of Amap Maps?

Converting geographic coordinates to administrative addresses. Planning routes
for cycling, walking, or driving. Searching for nearby points of interest based
on user-defined criteria.

### FAQ from Amap Maps?

#### What types of location services does Amap Maps provide?

Amap Maps provides geocoding, weather information, distance measurement, and
route planning for various transportation modes.

#### Is there a limit to the number of requests I can make?

The usage limits depend on the API key and the specific service being used.
Please refer to the Amap documentation for details.

#### How do I obtain an API key?

You can obtain an API key by creating a project on the Amap developer platform.

# Content

支持任意 MCP 协议的客户端（如：Cursor、Claude、Cline）可方便使用高德地图 MCP
server。如下以 Cursor 平台为例

## 在 Cursor 中配置

建议使用最新版本的 Cursor 客户端

## 接入配置

复制 key

https://lbs.amap.com/api/mcp-server/create-project-and-key

```json
{
  "mcpServers": {
    "amap-maps": {
      "command": "npx",
      "args": ["-y", "@masx200/amap-maps-mcp-server"],
      "env": {
        "AMAP_MAPS_API_KEY": "您在高德官网上申请的key"
      }
    }
  }
}
```
