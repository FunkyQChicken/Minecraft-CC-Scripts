t = turtle

function err(message)
  print("ERROR: " .. message)
  os.exit()
end

function notable(block)
  return string.find(block.name, "ore") ~= nil
end

function vein_mine()
  fuel()

  -- Check around
  for i = 0,3,1 do
    print(i)
    t.turnLeft()
    local exists, data = t.inspect()
    if exists and notable(data) then
      if not t.dig() then
        err("cannot break block")
      end
      t.forward()
      vein_mine()
      t.back()
    end
  end

  -- Check up
  local exists, data = t.inspectUp()
  if exists and notable(data) then
    if not t.digUp() then
      err("cannot break block")
    end
    t.up()
    vein_mine()
    t.down()
  end


  -- Check down
  local exists, data = t.inspectDown()
  if exists and notable(data) then
    if not t.digDown() then
      err("cannot break block")
    end
    t.down()
    vein_mine()
    t.up()
  end
end

function full()
  for i = 2, 16, 1 do 
    if t.getItemCount(i) == 0 then
      return false
    end
  end
  return true
end

function unload()
  for i = 2, 16, 1 do
    t.select(i)
    t.dropDown(i)
  end
end

function fuel()
  t.select(1)
  if t.getFuelLevel() <= t.getFuelLimit() - 80 then
    t.refuel(1)
  end
end

function mine()
  local shaft_number = 0
  repeat 
    local distance = 0

    -- Go to mineshaft location
    for i = 0,shaft_number * 7, 1 do
      t.dig()
      t.forward()
      fuel()
    end
    t.turnLeft()

    -- Mine until inventory full
    repeat 
      vein_mine()
      t.dig()
      t.forward()
      distance = distance + 1
    until full()

    -- Retreat from mineshaft
    for i = 1, distance, 1 do
      t.back()
      fuel()
    end

    -- Retreat to chest
    t.turnRight()
    for i = 0,shaft_number * 7, 1 do
      t.back()
      fuel()
    end
    
    shaft_number = shaft_number + 1

    -- Unload and Refuel
    unload()
  until false
end

mine()

