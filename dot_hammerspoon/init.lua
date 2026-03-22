local hyper = {"cmd", "alt", "ctrl", "shift"}

hs.hotkey.bind(hyper, "R", function()
  hs.reload()
end)

hs.hotkey.bind(hyper, "C", function()
  hs.application.launchOrFocus("Google Chrome")
end)

hs.hotkey.bind(hyper, "A", function()
  hs.application.launchOrFocus("Arc")
end)

hs.hotkey.bind(hyper, "T", function()
  hs.application.launchOrFocus("kitty")
end)

local function move(unit, label)
  return function()
    local win = hs.window.focusedWindow()
    if not win then
      hs.alert.show("No focused window")
      return
    end
    win:moveToUnit(unit)
    hs.alert.show(label)
  end
end

hs.hotkey.bind(hyper, "M", move({0,   0, 0.6, 1}, "Left 3/5"))
hs.hotkey.bind(hyper, "I", move({0.6, 0, 0.4, 1}, "Right 2/5"))
hs.hotkey.bind(hyper, "N", move({0,   0, 0.4, 1}, "Left 2/5"))
hs.hotkey.bind(hyper, "E", move({0.4, 0, 0.6, 1}, "Right 3/5"))

hs.alert.show("Config loaded")
