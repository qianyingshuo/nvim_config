---@class PluginInfo
---@field config string[]
---@field loaded boolean
---@field path string
---@field url string

---@alias PluginLocation string
---@alias ConfigMethod fun(name: string, info:PluginInfo)
---@alias OneMore<T> T | T[]

---@class PluginSpec
---@field [1] PluginLocation
---@field disable boolean
---@field as string
---@field installer function
---@field updater function
---@field after OneMore<string>
---@field rtp string
---@field opt boolean
---@field branch string
---@field tag string
---@field commit string
---@field lock boolean
---@field run OneMore<string|function>
---@field requires OneMore<PluginLocation|PluginSpec>
---@field rocks OneMore<string>
---@field config string | ConfigMethod
---@field setup string | ConfigMethod
---@field cmd OneMore<string>
---@field ft OneMore<string>
---@field keys OneMore<string>
---@field event OneMore<string>
---@field fn OneMore<string>
---@field cond OneMore<string|function>
---@field module OneMore<string>
---@field module_pattern OneMore<string>

---@class PackerConfig
---@field ensure_dependencies boolean
---@field snapshot string
---@field snapshot_path string
---@field package_root string
---@field compile_path string
---@field plugin_package string
---@field max_jobs integer?
---@field auto_clean boolean
---@field compile_on_sync boolean
---@field disable_commands boolean
---@field opt_default boolean
---@field transitive_opt boolean
---@field transitive_disable boolean
---@field auto_reload_compiled boolean
---@field git {cmd: string}
---@field display {non_interactive: boolean, open_fn: function}
---@field luarocks {python_cmd: string}
---@field log {level: string}
---@field profile {enable: boolean, threshold: integer}
---@field autoremove boolean

---@class PackerSpec
---@field [1] fun(use: PackerUse, use_rocks: PackerUseRocks)
---@field config PackerConfig

---@alias PackerUse fun(plugin_spec: OneMore<PluginLocation>|PluginSpec)
---@alias PackerUseRocks fun(rock: OneMore<string>)
---@alias PackerInit fun(user_config: PackerConfig)
---@alias PackerStartup fun(spec: PackerSpec)
