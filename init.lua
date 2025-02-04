-- Constants
---------------------------------------------------------------------

RuntimeContext = IsDuplicityVersion() and "server" or "client"
CurrentResourceName = GetCurrentResourceName()

-- Integrity check
---------------------------------------------------------------------
if not _VERSION:find('5.4') then
    error('Lua 5.4 must be enabled in the resource manifest!', 2)
end

if plib and plib.name == CurrentResourceName then
    error('Pleb-lib is already loaded! Remove any duplicate entries in the fxmanifest.lua', 2)
end

if GetResourceState(CurrentResourceName) ~= 'started' then
    error('^1Pleb-lib must be started before this resource.^0', 0)
end


-- Functions
---------------------------------------------------------------------


---noop is a no-operation function that does nothing.
---It can be used as a placeholder or default function.
function noop() end

-- Library
---------------------------------------------------------------------

--- @class plib
--- @field name string
--- @field _netPrefixes table<string>
--- @field addNetPrefix fun(prefix: string)
--- @field setNetPrefixes fun(prefixes: table<string>)
--- @field getNetPrefixes fun(): table<string>
--- @field registerPrefixedNetEvent fun(eventNames: string|table, eventFunction: function)
--- @field _debug boolean
--- @field setDebug fun(enabled: boolean)
--- @field debugPrint fun(message: string)
--- @field debugTable fun(tbl: table, indent: integer)
--- @field _loadedPackages table<string, any>
--- @field registerPackage fun(name: string, packageObject: any)
--- @field importPackage fun(name: string): any
--- @field getPackages fun(): table<string, any>
plib = {}

-- For now we will just load all modules into memory but we will probably change this behavior in the future.
local modules = {
    "debug",
    "packages",
    "network",
}

for _, module in ipairs(modules) do
    local chunk = LoadResourceFile("pleb-lib", "modules/" .. module .. ".lua")
    if chunk then
        load(chunk)()
    else
        error("Failed to load module " .. module)
    end
end