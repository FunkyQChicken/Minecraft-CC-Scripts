t = turtle

function err(message)
  print("ERROR: " .. message)
  os.exit()
end

function notable(block)
  return string.find(block.name, "ore")  == nil
end

function vein_mine()
  for i = 0,3,1 do
    print(i)
    t.turnLeft()
    local exists, data = t.inspect()
    if exists and notable(data) then
      print("ore!")
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
    print("forward!")
    vein_mine()
    mine()
    t.forward()
  until false
end

mine()

