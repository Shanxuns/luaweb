# LuaWeb
>#### 使用golang开发的lua解释器，以及web服务的实现，初心是为了学习和像php一样简单搭建与编写web服务

### 启动命令
```shell
linux: ./linux_amd64_LuaWeb ./config.ini

windows: ./windows_amd64_LuaWeb.exe ./config.ini

macOS: ./macOS_amd64_LuaWeb ./config.ini
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
