# modules 目录（lua自定义模块）

```lua
function music_config()
    local ini = require("ini")
    if ini.open("config.ini") then
        return require("mysql").open(
                ini.get("mysql","user"),
                ini.get("mysql","password"),
                ini.get("mysql","ip"),
                ini.get("mysql","port"),
                ini.get("mysql","database")
        )
    end
end
return {
    music_config = music_config
}
```
>#### 使用require函数调用mysql_config为文件名
```lua
local mysql_config = require("./mysql_config")
```
#### 实例：[music_config.lua](music_config.lua)