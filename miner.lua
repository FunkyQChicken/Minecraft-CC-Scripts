t = turtle

function err(message)
  print("ERROR: " .. message)
  os.exit()
end

function notable(block)
  print(data)
  return true
end

function vein_mine()
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
end


function mine()
  repeat 
    vein_mine()
    t.mine()
    t.forward()
  until false
end

mine()

