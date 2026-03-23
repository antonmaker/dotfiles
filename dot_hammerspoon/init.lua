local hyper = {"cmd", "alt", "ctrl", "shift"}

local function launch(app)
  return function() hs.application.launchOrFocus(app) end
end

local function withWin(fn)
  return function()
    local win = hs.window.focusedWindow()
    if win then fn(win) end
  end
end

-- Apps
hs.hotkey.bind(hyper, "C", launch("Google Chrome"))
hs.hotkey.bind(hyper, "A", launch("Arc"))
hs.hotkey.bind(hyper, "T", launch("kitty"))
hs.hotkey.bind(hyper, "V", launch("Visual Studio Code"))

-- Windows
hs.hotkey.bind(hyper, "M", withWin(function(win) win:maximize() end))
hs.hotkey.bind(hyper, "N", withWin(function(win) win:moveToUnit({0, 0, 0.42, 1}) end))
hs.hotkey.bind(hyper, "E", withWin(function(win) win:moveToUnit({0.42, 0, 0.58, 1}) end))
hs.hotkey.bind(hyper, "I", withWin(function(win) win:moveToScreen(win:screen():next()) end))

-- System
hs.hotkey.bind(hyper, "L", function() hs.caffeinate.lockScreen() end)
hs.hotkey.bind(hyper, "R", function() hs.reload() end)

hs.alert.show("Config loaded")
