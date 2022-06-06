-- This example script will press D-Pad Left/Right depending on device rotation
-- https://drastic-ds.com/viewtopic.php?t=3269
-- https://drastic-ds.com/download/file.php?id=359
-- Threshold for rotation in degrees
ROTATION_THRESHOLD = 7

function on_load(game)
end

function on_unload()
end

function on_frame_update()

  local buttons = drastic.get_buttons()
  local rotation = android.get_rotation()
  
  if (rotation >= ROTATION_THRESHOLD) or (rotation <= -ROTATION_THRESHOLD) then
    if (rotation < 0) then
      buttons = buttons | drastic.C.BUTTON_LEFT
    else
      buttons = buttons | drastic.C.BUTTON_RIGHT
    end
  end
  
  drastic.set_buttons(buttons)
  
end
