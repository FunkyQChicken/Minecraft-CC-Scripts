-- This can be copy pasted, then run again to update 
-- whatever script was chosen.

script_name = "test.lua"

local s = http.get(
  "https://raw.githubusercontent.com/FunkyQChicken/Minecraft-CC-Scripts/main/"
  .. script_name
).readAll()

local f = fs.open("./script.lua", "w")
f.write(s)
f.close()

shell.run("./script.lua")

