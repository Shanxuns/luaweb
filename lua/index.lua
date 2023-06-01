function main(request)
    -- 我们没有配置mysql 数据库所以注释掉了
    -- local mysql = require("./mysql_config")
    Is,Value = request.Query("body")
    if not Is then
        Value = "没有参数"
    end
    request.Template("index.html",{
        Title="LuaWeb",
        Body = Value,
    })
end