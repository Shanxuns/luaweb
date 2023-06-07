# LuaWeb
>#### 使用golang开发的lua解释器，以及web服务的实现，初心是为了学习和像php一样简单搭建与编写web服务

### 启动命令
```shell
linux: 
./linux_amd64_LuaWeb ./config.ini

windows: 
./windows_amd64_LuaWeb.exe ./config.ini

macOS: 
./macOS_amd64_LuaWeb ./config.ini
```

### 目前使用的免费frp服务，来自 [freefrp](https://freefrp.net)的服务

### 配置文件
```ini
// web服务端口
port = 8080
// 是否开启HTTPS
TLS = false
// 证书
certFile = certFile.pem
keyFile = keyFile.pem
// 是否开启内网穿透
frp = true
[FRP]
// 服务域名或ip
ServerAddr = frp.basicoa.net
// 服务端口
ServerPort = 7000
// 服务Token
Token = freefrp.net
// 服务名（自定义）
Name = cs
// 域名（解析ServerAddr的域名或ip）
Host = luaweb.basicoa.net
```

#### 也可以直接启动不要配置文件默认http协议80端口

### 标准库
|   库名    | 简介                   |
|:-------:|:---------------------|
|  http   | http请求，get、post、put等 |
|  json   | json解析、编码            |
|  mysql  | mysql数据库             |
| sqlite  | sqlite数据库            |
| strings | strings截取等           |
|   ini   | ini配置文件              |

### 入口函数
>#### 例如：index.lua
```lua
-- request 是一个 Table
function main(request)
    -- 代码
end
```
### 使用 request
>#### 例如：request.lua
```lua
-- request 是一个 Table
function main(request)
    -- 获取请求方法：GET、POST等
    local Method = request.Method
    -- 获取Host
    local Host = request.Host
    -- 获取URL
    local URL = request.URL
    -- 获取Cookie
    local Cookie = request.Cookie
    -- 设置Cookie
    request.SetCookie("名称","值")
    -- 获取Query
    Is,Value = request.Query("名称")
    -- 获取PostForm
    Is,Value = request.PostFormValue("名称")
    -- 设置Header
    request.Header("名称","值")
    -- 设置web响应代码例如：200
    request.StatusCode(200)
    -- 设置web响应体
    request.Write("字符串")
    -- 获取web响应体
    Is,Value = request.Body()
    -- 判断接收响应体大小例如大10mb小与50mb
    Is = request.FileSize(10,50)
    -- 获取并创建上传文件
    Is = request.FileUpdate("名称","路径")
    -- 获取文件信息 Table = { FileName,CDF,Size} 文件名、文件扩展名、文件大小
    Is,Table= request.FileName("名称")
    -- 设置html模版
    request.Template("index.html",{
        Title="LuaWeb",
        Version=version,
    })
    -- 响应体下载文件
    Is = request.DownFile("文件路径")
end
```


### http
```lua
local http = require("http")
response, error_message = http.request("GET", "http://example.com", {
    query="page=1",
    timeout="30s",
    headers={
        Accept="*/*"
    }
})
```

### http.delete(url [, options])

**Attributes**

| Name    | Type   | Description |
| ------- | ------ | ----------- |
| url     | String | URL of the resource to load |
| options | Table  | Additional options |

**Options**

| Name    | Type   | Description |
| ------- | ------ | ----------- |
| query   | String | URL encoded query params |
| cookies | Table  | Additional cookies to send with the request |
| headers | Table  | Additional headers to send with the request |
| timeout | Number/String | Request timeout. Number of seconds or String such as "1h" |
| auth    | Table  | Username and password for HTTP basic auth. Table keys are *user* for username, *pass* for passwod. `auth={user="user", pass="pass"}` |

**Returns**

[http.response](#httpresponse) or (nil, error message)

### http.get(url [, options])

**Attributes**

| Name    | Type   | Description |
| ------- | ------ | ----------- |
| url     | String | URL of the resource to load |
| options | Table  | Additional options |

**Options**

| Name    | Type   | Description |
| ------- | ------ | ----------- |
| query   | String | URL encoded query params |
| cookies | Table  | Additional cookies to send with the request |
| headers | Table  | Additional headers to send with the request |
| timeout | Number/String | Request timeout. Number of seconds or String such as "1h" |
| auth    | Table  | Username and password for HTTP basic auth. Table keys are *user* for username, *pass* for passwod. `auth={user="user", pass="pass"}` |

**Returns**

[http.response](#httpresponse) or (nil, error message)

### http.head(url [, options])

**Attributes**

| Name    | Type   | Description |
| ------- | ------ | ----------- |
| url     | String | URL of the resource to load |
| options | Table  | Additional options |

**Options**

| Name    | Type   | Description |
| ------- | ------ | ----------- |
| query   | String | URL encoded query params |
| cookies | Table  | Additional cookies to send with the request |
| headers | Table  | Additional headers to send with the request |
| timeout | Number/String | Request timeout. Number of seconds or String such as "1h" |
| auth    | Table  | Username and password for HTTP basic auth. Table keys are *user* for username, *pass* for passwod. `auth={user="user", pass="pass"}` |

**Returns**

[http.response](#httpresponse) or (nil, error message)

### http.patch(url [, options])

**Attributes**

| Name    | Type   | Description |
| ------- | ------ | ----------- |
| url     | String | URL of the resource to load |
| options | Table  | Additional options |

**Options**

| Name    | Type   | Description |
| ------- | ------ | ----------- |
| query   | String | URL encoded query params |
| cookies | Table  | Additional cookies to send with the request |
| body    | String | Request body. |
| form    | String | Deprecated. URL encoded request body. This will also set the `Content-Type` header to `application/x-www-form-urlencoded` |
| headers | Table  | Additional headers to send with the request |
| timeout | Number/String | Request timeout. Number of seconds or String such as "1h" |
| auth    | Table  | Username and password for HTTP basic auth. Table keys are *user* for username, *pass* for passwod. `auth={user="user", pass="pass"}` |

**Returns**

[http.response](#httpresponse) or (nil, error message)

### http.post(url [, options])

**Attributes**

| Name    | Type   | Description |
| ------- | ------ | ----------- |
| url     | String | URL of the resource to load |
| options | Table  | Additional options |

**Options**

| Name    | Type   | Description |
| ------- | ------ | ----------- |
| query   | String | URL encoded query params |
| cookies | Table  | Additional cookies to send with the request |
| body    | String | Request body. |
| form    | String | Deprecated. URL encoded request body. This will also set the `Content-Type` header to `application/x-www-form-urlencoded` |
| headers | Table  | Additional headers to send with the request |
| timeout | Number/String | Request timeout. Number of seconds or String such as "1h" |
| auth    | Table  | Username and password for HTTP basic auth. Table keys are *user* for username, *pass* for passwod. `auth={user="user", pass="pass"}` |

**Returns**

[http.response](#httpresponse) or (nil, error message)

### http.put(url [, options])

**Attributes**

| Name    | Type   | Description |
| ------- | ------ | ----------- |
| url     | String | URL of the resource to load |
| options | Table  | Additional options |

**Options**

| Name    | Type   | Description |
| ------- | ------ | ----------- |
| query   | String | URL encoded query params |
| cookies | Table  | Additional cookies to send with the request |
| body    | String | Request body. |
| form    | String | Deprecated. URL encoded request body. This will also set the `Content-Type` header to `application/x-www-form-urlencoded` |
| headers | Table  | Additional headers to send with the request |
| timeout | Number/String | Request timeout. Number of seconds or String such as "1h" |
| auth    | Table  | Username and password for HTTP basic auth. Table keys are *user* for username, *pass* for passwod. `auth={user="user", pass="pass"}` |

**Returns**

[http.response](#httpresponse) or (nil, error message)

### http.request(method, url [, options])

**Attributes**

| Name    | Type   | Description |
| ------- | ------ | ----------- |
| method  | String | The HTTP request method |
| url     | String | URL of the resource to load |
| options | Table  | Additional options |

**Options**

| Name    | Type   | Description |
| ------- | ------ | ----------- |
| query   | String | URL encoded query params |
| cookies | Table  | Additional cookies to send with the request |
| body    | String | Request body. |
| form    | String | Deprecated. URL encoded request body. This will also set the `Content-Type` header to `application/x-www-form-urlencoded` |
| headers | Table  | Additional headers to send with the request |
| timeout | Number/String | Request timeout. Number of seconds or String such as "1h" |
| auth    | Table  | Username and password for HTTP basic auth. Table keys are *user* for username, *pass* for passwod. `auth={user="user", pass="pass"}` |

**Returns**

[http.response](#httpresponse) or (nil, error message)

### http.request_batch(requests)

**Attributes**

| Name     | Type  | Description |
| -------- | ----- | ----------- |
| requests | Table | A table of requests to send. Each request item is by itself a table containing [http.request](#httprequestmethod-url--options) parameters for the request |

**Returns**

[[http.response](#httpresponse)] or ([[http.response](#httpresponse)], [error message])

### http.response

The `http.response` table contains information about a completed HTTP request.

**Attributes**

| Name        | Type   | Description |
| ----------- | ------ | ----------- |
| body        | String | The HTTP response body |
| body_size   | Number | The size of the HTTP reponse body in bytes |
| headers     | Table  | The HTTP response headers |
| cookies     | Table  | The cookies sent by the server in the HTTP response |
| status_code | Number | The HTTP response status code |
| url         | String | The final URL the request ended pointing to after redirects |