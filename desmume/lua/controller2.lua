-- http://forums.desmume.org/viewtopic.php?id=11715

dpad = {"up", "down", "left", "right"}
sticks = {"x", "y", "z", "r", "u", "v"}

ButtonNames = {	"A",
		"B",
		"X",
		"Y",
		"Up",
		"Down",
		"Left",
		"Right"}

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
                    xoffs = xoffs + string.len(name)*6 + 4
                end
            end
            for idx, name in ipairs(sticks) do
                col = "#606060"
                if cont[name] ~= nil then
                    if math.abs(cont[name]) > 0.25 then col = "#FF0000" end
                    gui.text(xoffs, (18*i)-yoff+9, name, col)
                    xoffs = xoffs + string.len(name)*6 + 2
                end
            end
        end
    end
end
gui.register(showControllers)

