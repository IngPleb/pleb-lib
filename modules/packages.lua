if not plib then return end

-- Packages
--
-- This system is here to "mimic" the require behavior from Lua and ox_lib
-- Due to escrow scripts being unable to take advantage of the require function.
-- This system might introduce some structured clarity!
---------------------------------------------------------------------

--- Table to store loaded packages.
plib._loadedPackages = {}


--- Registers a package with a specified name.
--- @param name string The name of the package.
--- @param packageObject any The package object to register.
plib.registerPackage = function(name, packageObject)
    if plib._loadedPackages[name] then
        error("Package with name " .. name .. " already exists!")
    end

    if type(name) ~= "string" then
        error("Package name must be a string!")
    end

    plib._loadedPackages[name] = packageObject
end

--- Imports a package with a specified name.
--- @param name string The name of the package to import.
--- @return any # The package object.
plib.importPackage = function(name)
    return plib._loadedPackages[name]
end

--- Gets the list of loaded packages.
--- @return table # A table containing the loaded packages.
plib.getPackages = function()
    return plib._loadedPackages
end