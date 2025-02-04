if not plib then return end

-- Debugging
---------------------------------------------------------------------

--- Whether debugging is enabled.
plib._debug = false

--- Enables or disables debugging.
--- @param enabled boolean Whether to enable or disable debugging.
function plib.setDebug(enabled)
    plib._debug = enabled
end

--- Prints a debug message if debugging is enabled in the configuration.
--- @param message string The message to print if debugging is enabled.
--- @usage
--- DebugPrint("This is a debug message")
function plib.debugPrint(message)
    if plib._debug then
        print(string.format("^1[DEBUG][%s] ^7%s", CurrentResourceName, message))
    end
end

--- Recursively prints the contents of a table with indentation.
--- @param tbl table The table to print.
--- @param indent integer The current indentation level (optional, default is 0).
--- @usage
--- local myTable = { key1 = "value1", key2 = { subkey1 = "subvalue1" } }
--- PrintTable(myTable)
function plib.debugTable(tbl, indent)
    if not plib._debug then return end
    indent = indent or 0
    local padding = string.rep(" ", indent)

    for key, value in pairs(tbl) do
        if type(value) == "table" then
            print(string.format("%s%s:", padding, key))
            plib.debugTable(value, indent + 4) -- Recursive call with increased indentation
        else
            print(string.format("%s%s: %s", padding, key, tostring(value)))
        end
    end
end