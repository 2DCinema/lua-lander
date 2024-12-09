-- FileDir.lua
-- Yeah, I don't remember what I was using LuaFileSystem for...
local lfs = require("lfs")


local FileDir = {}
FileDir.__index = FileDir

function FileDir.new (args)
    local self = setmetatable(args or {}, FileDir)

    print([[Please specify the directory to the downloaded Lua files.
    The folder should be named something like \"lua-x.x.x\" and may contain folders named \"doc\" and \"src\" as
    well as files named \"Makefile\" and \"README\".]])

    self.path = args.path or io.read()

    -- Gets the current version number.
    local fullPath = {}
    local pathPattern = string.format("([^%s]+)", "\\")
    local folderPattern = string.format("([^%s]+)", "-")

    for match in string.gmatch(self.path, pathPattern) do
        table.insert(fullPath, match)

    end

    local lastFolder = {}

    for match in string.gmatch(fullPath[#fullPath], folderPattern) do
        table.insert(lastFolder, match)

    end

    local versionNumber = lastFolder[#lastFolder]

    os.execute(string.format("build.bat \"%s\" \"%s\"", versionNumber, string.match(self.path, "(.*)\\[^\\]*")))

end


return FileDir
