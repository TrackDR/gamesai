MRADIUS=35
CENTERX=128
CENTERY=96
DEADZONE=0.1
RELEASE_TIMEOUT=5
ENGAGE_TIMEOUT=10
 
function on_load(game)
end
 
function on_unload()
end
 
debounce = false
enable = false
release = 0
engage = 0
 
function on_frame_update()
 
    local buttons = drastic.get_buttons()
 
    if ( ( buttons & drastic.C.BUTTON_L ) ~= 0 and ( buttons & drastic.C.BUTTON_R ) ~= 0) then
        debounce = true
    end
 
    if ( debounce and ( buttons & drastic.C.BUTTON_L ) == 0 and ( buttons & drastic.C.BUTTON_R ) == 0) then
        debounce = false
        enable = not enable
    end
 
    if (enable) then
        local lx = android.get_axis_lx()
        local ly = android.get_axis_ly()
        if ( ( buttons & drastic.C.BUTTON_Y ) ~= 0) then
            buttons = buttons | drastic.C.BUTTON_A
            buttons = buttons & (~drastic.C.BUTTON_Y)
        end
       
        if( ( buttons & drastic.C.BUTTON_TOUCH) == 0) then
            if (math.abs(lx)>DEADZONE) or (math.abs(ly)>DEADZONE) then
                if (engage >= ENGAGE_TIMEOUT) then
					local x = (MRADIUS)*lx
					local y = (MRADIUS)*ly
					local radius = math.min(math.sqrt(x*x+y*y),MRADIUS)
					local angle = math.atan2(x,y)
                    drastic.set_touch(math.floor(math.sin(angle)*radius)+CENTERX,math.floor(math.cos(angle)*radius)+CENTERY)    
                else
                    drastic.set_touch(CENTERX, CENTERY)
                    engage = engage + 1
                end
                buttons = buttons | drastic.C.BUTTON_TOUCH
                release = 0
            else
                if (release < RELEASE_TIMEOUT) then
                    drastic.set_touch(CENTERX, CENTERY)
                    buttons = buttons | drastic.C.BUTTON_TOUCH
                    release = release + 1
                end
                engage = 0
            end
        end
       
        drastic.set_buttons(buttons)
    end
end
