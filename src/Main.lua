-- Main.lua

local FileDir = require("FileDir")

local Main = {}
Main.__index = Main

function Main.new (args)
    local self = setmetatable(args or {}, Main)

    self.fileDir = FileDir.new{}

    --print([[TDM-GCC not found! TDM-GCC is required for this program to work. Please install TDM-GCC from the
    --following git: https://github.com/jmeubank/tdm-gcc before reattempting.]])

end

Main.new{}
