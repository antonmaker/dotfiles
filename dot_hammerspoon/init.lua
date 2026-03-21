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

hs.alert.show("Config loaded")
