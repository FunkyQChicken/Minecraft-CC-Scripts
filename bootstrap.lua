-- This can be copy pasted, then run again to update 
-- whatever script was chosen.

script_name = "test.lua"

local s = http.get(
  "https://raw.githubusercontent.com/FunkyQChicken/Minecraft-CC-Scripts/main/"
  .. script_name
).readAll()

fs.open("./script.lua", "w").write(s)


