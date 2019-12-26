--Component Definitions--
local com = require("component")
local rs = com.block_refinedstorage_interface
local event = require("event")

--Variable--
local aDiff
local noConflict
local item
local taskDamage
local taskName

--Stock Tables--
stock = {
--  {"minecraft:iron_ingot", 0.0, 8}
--  {"minecraft:torch", 0.0, 8}
}

--Main--

while 1 do

for i, v in pairs(stock) do
  if rs.getItem({name=v[1], damage=v[2]}) then
    item = rs.getItem({name=v[1], damage=v[2]})
    aDiff = v[3] - item.size
    if aDiff>0 then
      noConflict = 1.0
      for j, w in ipairs(rs.getTasks()) do
        taskName = w.stack.item.name
        taskDamage = w.stack.item.damage
        if taskName == v[1] then
          if taskDamage == v[2] then
            noConflict = nil
          end
        end
      end
      if noConflict then
        rs.scheduleTask({name=v[1], damage=v[2]}, aDiff)
      end
    end
  end
end
if event.pull(1,"touch") then
  os.exit()
end

end
