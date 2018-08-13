pico-8 cartridge // http://www.pico-8.com
version 16
__lua__

-- constants

-- sprites
grid=1
-- snake head
shead=2
-- snake body
sbody=3

-- snake position x and y
spx=0
spy=0

minnum=0
maxnum=99
numspace=256





numarr = {}






function shuffle(tbl)
  local size = #tbl
  for i = size, 1, -1 do
    local rand = flr(rnd(size)) + 1
    tbl[i], tbl[rand] = tbl[rand], tbl[i]
  end
  return tbl
end


function _update()

end

function _draw()
    --draw snake
    spr(shead,spx,spy)
end


function _init()
    cls()



    for x=0,16 do
        for y=0,16 do
            spr(grid,x*8,y*8)
        end
    end

    for i=(minnum+1),numspace do
        numarr[i] = i-1
    end



    shuffle(numarr)

    -- find first snake position
    local idx=1
    local tmparr={}
    for foo,val in pairs(numarr) do
        if val > maxnum then
            tmparr[idx]=val
            idx=idx+1
        end
    end

    local r = flr(rnd(#tmparr))
    local snakeIdx = tmparr[r]


    local snakePlaced=false
    local count = 1
    for x=0,15 do
        for y=0,15 do
            local num = numarr[count]

            if count == snakeIdx then
                spx=x*8
                spy=y*8
            end

            -- only display 1 and 2 digit numbers for now
            if num < maxnum then
                if num < 10 then
                    print(num,x*8+2,y*8+2,9)
                else
                    print(num,x*8,y*8+2,9)
                end
            end

            count=count+1
        end
    end

end


__gfx__
00000000dddddddd3333330033333333000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000d333b333033b333b3000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
007007000000000d3b333aa3b333b333000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000770000000000d333b333333b333b3000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000770000000000d3b333333b333b333000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
007007000000000d333b3aa333b333b3000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000d3b333330b333b333000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000d3333330033333333000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
