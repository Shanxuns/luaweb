# template 目录（html模版）

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>{{.Title}}</title>
</head>
<body>
<h1>LuaWeb服务</h1>
{{.Body}}
</body>
</html>
```
>#### 使用{{.}}来标记，Title为变量
#### 实例：[index.html](index.html)