hl.bind("SUPER + SHIFT + ALT + Q", hl.dsp.exit())
hl.bind("SUPER + SHIFT + ALT + L", hl.dsp.exec_cmd("hyprlock"))
hl.bind("SUPER + SHIFT + ALT + P", hl.dsp.exec_cmd("hyprshutdown -t 'Shutting down...' --post-cmd 'shutdown -P 0'"))
hl.bind("SUPER + SHIFT + ALT + R", hl.dsp.exec_cmd("hyprshutdown -t 'Shutting down...' --post-cmd 'reboot'"))

hl.bind("SUPER + G", hl.dsp.exec_cmd("kitty -e zellij attach --create main"))
hl.bind("SUPER + SHIFT + U", hl.dsp.exec_cmd("kitty -e ssh justhost -t tmux new-session -A -s main"))
hl.bind("SUPER + SHIFT + S", hl.dsp.exec_cmd("kitty -e ssh tiwi -t tmux new-session -A -s main"))
hl.bind("SUPER + SHIFT + G", hl.dsp.exec_cmd("kitty"))

hl.bind("SUPER + F", hl.dsp.exec_cmd("nautilus"))
hl.bind("SUPER + S", hl.dsp.exec_cmd("fuzzel"))
hl.bind("SUPER + V", hl.dsp.exec_cmd("kitty --class clipse -e 'clipse' && focusewindow clipse"))
hl.bind("SUPER + ALT + V", hl.dsp.exec_cmd("bemoji -c -n"))

hl.bind("SUPER + SHIFT + ALT + G", hl.dsp.exec_cmd("kitty -e zellij attach --create ssh"))

hl.bind("SUPER + SHIFT + X", hl.dsp.window.close())
hl.bind("SUPER + SHIFT + ALT + X", hl.dsp.window.kill())
hl.bind("SUPER + Z", hl.dsp.window.fullscreen({ mode = "fullscreen" }))
hl.bind("SUPER + X", hl.dsp.window.float())
hl.bind("SUPER + P", hl.dsp.window.pin())

hl.bind("SUPER + H", hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + L", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + J", hl.dsp.focus({ direction = "down" }))
hl.bind("SUPER + K", hl.dsp.focus({ direction = "up" }))

local fit_method = 1

hl.bind("SUPER + C", function()
  local workspace = hl.get_active_special_workspace() or hl.get_active_workspace()
  local window = hl.get_active_window()

  if not workspace or not window then return end

  if window.floating then
    hl.dispatch(hl.dsp.window.center())
  end

  if (workspace.tiled_layout == "scrolling") then
    fit_method = (fit_method + 1) % 2

    hl.config({ scrolling = { focus_fit_method = fit_method } })
    hl.dsp.layout("fit_into_view")
  end
end)

hl.bind("SUPER + SHIFT + H", hl.dsp.window.move({ direction = "left" }))
hl.bind("SUPER + SHIFT + L", hl.dsp.window.move({ direction = "right" }))
hl.bind("SUPER + SHIFT + J", hl.dsp.window.move({ direction = "down" }))
hl.bind("SUPER + SHIFT + K", hl.dsp.window.move({ direction = "up" }))

local function merge(t1, t2)
  for k, v in pairs(t2) do t1[k] = v end
  return t1
end

local function resize(direction)
  local resize_map_dwindle = {
    u = { x = 0, y = -10 },
    r = { x = -10, y = 0 },
    d = { x = 0, y = 10 },
    l = { x = 10, y = 0 },
  }
  local resize_map_scrolling = {
    u = '+conf',
    r = '-conf',
    d = '-conf',
    l = '+conf',
  }

  return function()
    local workspace = hl.get_active_special_workspace() or hl.get_active_workspace()
    local window = hl.get_active_window()

    if not workspace or not window then return end

    if not resize_map_dwindle[direction] then return end

    if window.floating or workspace.tiled_layout ~= "scrolling" then
      hl.dispatch(hl.dsp.window.resize(merge(resize_map_dwindle[direction], { relative = true })))
    end

    if (workspace.tiled_layout == "scrolling") then
      hl.dispatch(hl.dsp.layout("colresize " .. resize_map_scrolling[direction]))
    end
  end
end

hl.bind("SUPER + ALT + H", resize('r'), { repeating = true })
hl.bind("SUPER + ALT + L", resize('l'), { repeating = true })
hl.bind("SUPER + ALT + J", resize('d'), { repeating = true })
hl.bind("SUPER + ALT + K", resize('u'), { repeating = true })

hl.bind("SUPER + CTRL + H", hl.dsp.window.move({ x = -10, y = 0, relative = true }), { repeating = true })
hl.bind("SUPER + CTRL + L", hl.dsp.window.move({ x = 10, y = 0, relative = true }), { repeating = true })
hl.bind("SUPER + CTRL + J", hl.dsp.window.move({ x = 0, y = 10, relative = true }), { repeating = true })
hl.bind("SUPER + CTRL + K", hl.dsp.window.move({ x = 0, y = -10, relative = true }), { repeating = true })

hl.bind("SUPER + tab", hl.dsp.focus({ last = true }))

hl.bind("SUPER + 1", hl.dsp.focus({ workspace = 1 }))
hl.bind("SUPER + 2", hl.dsp.focus({ workspace = 2 }))
hl.bind("SUPER + 3", hl.dsp.focus({ workspace = 3 }))
hl.bind("SUPER + 4", hl.dsp.focus({ workspace = 4 }))
hl.bind("SUPER + 5", hl.dsp.focus({ workspace = 5 }))
hl.bind("SUPER + f1", hl.dsp.focus({ workspace = 6 }))
hl.bind("SUPER + f2", hl.dsp.focus({ workspace = 7 }))
hl.bind("SUPER + f3", hl.dsp.focus({ workspace = 8 }))
hl.bind("SUPER + f4", hl.dsp.focus({ workspace = 9 }))
hl.bind("SUPER + f5", hl.dsp.focus({ workspace = 10 }))
hl.bind("SUPER + D", hl.dsp.workspace.swap_monitors({ monitor1 = "DP-1", monitor2 = "DP-2" }))

hl.bind("SUPER + SHIFT + 1", hl.dsp.window.move({ workspace = 1 }))
hl.bind("SUPER + SHIFT + 2", hl.dsp.window.move({ workspace = 2 }))
hl.bind("SUPER + SHIFT + 3", hl.dsp.window.move({ workspace = 3 }))
hl.bind("SUPER + SHIFT + 4", hl.dsp.window.move({ workspace = 4 }))
hl.bind("SUPER + SHIFT + 5", hl.dsp.window.move({ workspace = 5 }))
hl.bind("SUPER + SHIFT + f1", hl.dsp.window.move({ workspace = 6 }))
hl.bind("SUPER + SHIFT + f2", hl.dsp.window.move({ workspace = 7 }))
hl.bind("SUPER + SHIFT + f3", hl.dsp.window.move({ workspace = 8 }))
hl.bind("SUPER + SHIFT + f4", hl.dsp.window.move({ workspace = 9 }))
hl.bind("SUPER + SHIFT + f5", hl.dsp.window.move({ workspace = 10 }))

hl.bind("SUPER + SHIFT + T", function()
  local layouts   = { "scrolling", "dwindle" }
  local workspace = hl.get_active_workspace()

  if hl.get_active_special_workspace() then
    workspace = hl.get_active_special_workspace()
  end

  if not workspace then return end

  for i = 1, #layouts do
    if layouts[i] == workspace.tiled_layout then
      local next_layout_idx = (i % #layouts) + 1
      next_layout = layouts[next_layout_idx]
      break
    end
  end

  if workspace.special then
    hl.workspace_rule({ workspace = tostring(workspace.name), layout = next_layout })
  else
    hl.workspace_rule({ workspace = tostring(workspace.id), layout = next_layout })
  end
end)

hl.bind("PRINT", hl.dsp.exec_cmd("grimblast --freeze copy area"), { locked = true })

hl.bind("SUPER + slash", hl.dsp.exec_cmd("hyprpicker -ard -f hex"), { locked = true })

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"),
  { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
  { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
  { locked = true, repeating = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set +5%"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 5%-4"), { locked = true, repeating = true })

hl.bind("SUPER + apostrophe", hl.dsp.workspace.toggle_special("magic"))
hl.bind("SUPER + SHIFT + apostrophe", hl.dsp.window.move({ workspace = "special:magic" }))
hl.bind("SUPER + semicolon", hl.dsp.workspace.toggle_special("terminal"))
hl.bind("SUPER + SHIFT + semicolon", hl.dsp.window.move({ workspace = "special:terminal" }))

hl.bind("SUPER + mouse:272", hl.dsp.window.drag())
hl.bind("SUPER + SHIFT + mouse:272", hl.dsp.window.resize())

-- app specific binds

hl.bind("SUPER + grave", hl.dsp.send_shortcut({ window = "class:^(com\\.obsproject\\.Studio)$", mods = "CTRL", key = "grave" }))
