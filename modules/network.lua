if not plib then return end

-- Network
-- Util functions for networked entities.
---------------------------------------------------------------------


--- Table to store prefixes under which the net events will be registered.
plib._netPrefixes = {CurrentResourceName}

--- Adds a network prefix to the list of prefixes.
--- @param prefix string The network prefix to add.
plib.addNetPrefix = function(prefix)
    table.insert(plib._netPrefixes, prefix)
end

--- Sets the list of network prefixes.
--- @param prefixes table A table containing the network prefixes.
plib.setNetPrefixes = function(prefixes)
    plib._netPrefixes = prefixes
end

--- Gets the list of network prefixes.
--- @return table A table containing the network prefixes.
plib.getNetPrefixes = function()
    return plib._netPrefixes
end

--- Registers network events with a specified prefix for both client and server sides.
--- @param eventNames string|table A single event name or a table of event names to register.
--- @param eventFunction function The function to be called when the event is triggered.
--- @usage
--- local eventNames = {"event1", "event2"}
--- local function eventHandler()
---     -- handle event
--- end
--- RegisterEvents(eventNames, eventHandler)
function plib.registerPrefixedNetEvent(eventNames, eventFunction)
    if #plib._netPrefixes == 0 then
        error("[" .. CurrentResourceName .. "] No prefixes set in plib. Use setNetPrefixes({\"yourPrefix\"}) before registering events.")
    end

    if type(eventNames) == "table" then
        for _, eventName in ipairs(eventNames) do
            for _, prefix in ipairs(plib._netPrefixes) do
                RegisterNetEvent(prefix .. ":" ..  eventName, eventFunction)
            end
        end
    else
        local eventName = eventNames
        for _, prefix in ipairs(plib._netPrefixes) do
            RegisterNetEvent(prefix .. ":" .. eventName, eventFunction)
        end
    end
end