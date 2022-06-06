-- http://forums.desmume.org/viewtopic.php?id=11715
-- controller.get https://github.com/TASVideos/desmume/blob/42093b4929df4408ca2585c8d2d0ed3a812b3e2a/desmume/src/lua-engine.cpp#L4703
-- controller.get and .read call controller.get -- line 4812


dpad = {"up", "down", "left", "right"}
sticks = {"x", "y", "z", "r", "u", "v"}
plus  = "+"
minus = "-"

function showControllers()
    -- gui.box(0, 0, 256, 192, "#808080")
    -- gui.box(0, -192, 256, 0, "#808080")
    -- yoff = 143
    yoff = 50
    for i=0,15 do
        cont = controller.get(i)
        if type(next(cont)) ~= "nil" then
            gui.text(0, (18*i)-yoff, i)
            xoffs = 14
            for ii=0,32 do
                col = "#606060"
                tmp = tostring(ii)
                if cont[tmp] ~= nil then
                    if cont[tmp] == true then col = "#FF0000" end
                    gui.text(xoffs, (18*i)-yoff, tmp, col) --goes off screen if controller has more than ~20 buttons.
                    xoffs = xoffs + string.len(tmp)*6 + 2
                end
            end
            xoffs = 14
            for idx, name in ipairs(dpad) do
                col = "#606060"
                if cont[name] ~= nil then
                    if cont[name] == true then col = "#FF0000" end
                    gui.text(xoffs, (18*i)-yoff+9, name, col)
                    -- gui.text(xoffs, (18*i)-yoff+18, cont[name], col)
                    xoffs = xoffs + string.len(name)*6 + 4
                end
            end
            for idx, name in ipairs(sticks) do
                col = "#606060"
                if cont[name] ~= nil then
                    if math.abs(cont[name]) > 0.25 then col = "#FF0000" end
                    gui.text(xoffs, (18*i)-yoff+9, name, col)
                    if math.abs(cont[name]) > 0.25 then
                        if cont[name] < 0 then
                          gui.text(xoffs-5, (18*i)-yoff+18, minus, col)
                        else
                          gui.text(xoffs-5, (18*i)-yoff+18, plus, col)
                        end
                        gui.text(xoffs, (18*i)-yoff+18, name, col)
                    end
                    xoffs = xoffs + string.len(name)*6 + 2
                end
            end
        end
    end
end
gui.register(showControllers)

