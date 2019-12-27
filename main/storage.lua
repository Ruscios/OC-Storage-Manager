--Component Definitions--
local com = require("component")
local rs = com.block_refinedstorage_interface
local event = require("event")

--Variable--
local aDiff
local item
local taskDamage
local taskName

--Stock Tables--
stock = {
--  {"minecraft:iron_ingot", 0.0, 8}
--  {"minecraft:torch", 0.0, 8}
}

--Task Conflict Check--
function conflictCheck (itemName, itemDamage)
  local checkConflict = 1.0
  for j, w in ipairs(rs.getTasks()) do
    taskName = w.stack.item.name
    taskDamage = w.stack.item.damage
    if taskName == itemName then
      if taskDamage == itemDamage then
        checkConflict = nil
      end
    end
  return checkConflict
end

--Main--
while 1 do
    
event.listen(key_down(),os.exit())
for i, v in pairs(stock) do
  if rs.getItem({name=v[1], damage=v[2]}) then
    item = rs.getItem({name=v[1], damage=v[2]})
    aDiff = v[3] - item.size
    if aDiff>0 then
      if conflictCheck(v[1], v[2]) then
        rs.scheduleTask({name=v[1], damage=v[2]}, aDiff)
      end
    end
  end
end

end
