pico-8 cartridge // http://www.pico-8.com
version 16
__lua__

-- constants

-- sprites
grid=1
-- snake head horizontal
sheadh=2
-- snake head vertical
sheadv=4
-- snake body
sbody=3
-- snake width and height
sdim=1

-- snake position x and y
spx=0
spy=0
-- snake direction  1 is up, 2 is right 3 is down 4 is left
sdir='r'

minnum=0
maxnum=99
numspace=256

-- board width
bwid=16

-- button direction reference (all for player 0)
bl=0
br=1
bu=2
bd=3

-- how many frames it takes to move
frames=15
-- current frame count
fct=0

numarr = {}

-- where the snake has been
traveled = {}
travx={}
travy={}
-- by convention lua tables are 1 indexed
travi=0





function shuffle(tbl)
    local size = #tbl
    for i = size, 1, -1 do
        local rand = flr(rnd(size)) + 1
        tbl[i], tbl[rand] = tbl[rand], tbl[i]
    end
    return tbl
end


function _update()
        if btn(bl) then
            sdir='l'
        elseif btn(br) then
            sdir='r'
        elseif btn(bu) then
            sdir='u'
        elseif btn(bd) then
            sdir='d'
        end
    if fct == 15 then
        travi=travi+1

        travx[travi]=spx
        travy[travi]=spy


        -- change direction based on arrows

        fct=0

        if sdir=='l' then
            spx=spx-8
        elseif sdir=='r' then
            spx=spx+8
        elseif sdir=='u' then
            spy=spy-8
        elseif sdir=='d' then
            spy=spy+8
        end
    end


    fct=fct+1

end

function _draw()
    for i = 1,travi do
        local x=travx[travi]
        local y=travy[travi]
        spr(sbody,x,y)
    end


    --draw snake
    local flipx=false
    local flipy=false
    local snakeSpr=sheadh
    if sdir == 'r' then
        --nothing
    elseif sdir == 'l' then
        flipx=true
    elseif sdir == 'u' then
        snakeSpr=sheadv
    elseif sdir == 'd' then
        snakeSpr=sheadv
        flipy=true
    end
    spr(snakeSpr,spx,spy,sdim,sdim,flipx,flipy)
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
00000000dddddddd3333330033333333003333000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000d333b333033b333b303a33a300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
007007000000000d3b333aa3b333b33333a33a330000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000770000000000d333b333333b333b3333333330000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000770000000000d3b333333b333b3333b3b3b330000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
007007000000000d333b3aa333b333b3333333330000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000d3b333330b333b33333b3b3b30000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000d3333330033333333333333330000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
