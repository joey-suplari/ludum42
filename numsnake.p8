pico-8 cartridge // http://www.pico-8.com
version 16
__lua__

-- constants

-- sprites
grid=1

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


function _init()
    cls()



    for x=0,16 do
        for y=0,16 do
            spr(1,x*8,y*8)
        end
    end

    for i=(minnum+1),numspace do
        numarr[i] = i-1
    end



    shuffle(numarr)

    local count = 1
    for x=0,15 do
        for y=0,15 do
            local num = numarr[count]

            if count < numspace and num < maxnum then
                if num < 10 then
                    print(num,x*8+3,y*8+1,9)
                else
                    print(num,x*8+1,y*8+1,9)
                end
            end

            count=count+1
        end
    end

end


__gfx__
00000000dddddddd3333330033333333000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000d000000d333b333033b333b3000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700d000000d3b333aa3b333b333000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000d000000d333b333333b333b3000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000d000000d3b333333b333b333000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700d000000d333b3aa333b333b3000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000d000000d3b333330b333b333000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000dddddddd3333330033333333000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
