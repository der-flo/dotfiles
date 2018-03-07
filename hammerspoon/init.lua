-- TODO: http://www.hammerspoon.org/Spoons/
-- TODO: https://github.com/trishume/dotfiles/blob/master/hammerspoon/hammerspoon.symlink/init.lua
-- TODO: https://github.com/tombruijn/dotfiles/tree/master/hammerspoon

hs.loadSpoon("ReloadConfiguration")
spoon.ReloadConfiguration:start()

--------------------------------------------------------------------------------
-- Präfix für die meisten bzw. restlichen Hammerspoon-Kommandos
-- Per Karabiner auf rechtes ⌘ gebunden
local hyper = {"⌘", "⌥", "⌃"}

-- Präfix für alle Fenster-bezogenen Kommandos
-- Per Karabiner auf rechtes ⌥ gebunden
local hyper2 = {"⌘", "⌥", "⌃", "⇧"}

--------------------------------------------------------------------------------
hs.hotkey.bind(hyper, "c", require "new_chrome_window")
hs.hotkey.bind(hyper, "t", require "new_iterm_window")
hs.hotkey.bind(hyper, "i", require "toggle_ksheet")

-- Karabiner Elements setzt aktuell leider "⌃-eject" außer Kraft.
-- https://github.com/tekezo/Karabiner-Elements/issues/89
hs.hotkey.bind(hyper, "s", hs.caffeinate.systemSleep)

--------------------------------------------------------------------------------
-- Fenster-bezogene Kommandos

-- Die Animationen sind laggy, also schalten wir sie ab.
hs.window.animationDuration = 0

hs.hotkey.bind(hyper2, "f", function()
  hs.mjomatic.go({
    "iiiCCCCC",
    "iiiCCCCC",
    "",
    "i iTerm2",
    "C Google Chrome"
  })
end)

hs.hotkey.bind(hyper2, "g", function()
  hs.mjomatic.go({
    "iiiaaaaa",
    "iiiaaaaa",
    "",
    "i iTerm2",
    "a Atom"
  })
end)

-- TODO: hs.grid.show?

hs.loadSpoon("WindowHalfsAndThirds")
-- Alternative:
-- http://www.hammerspoon.org/docs/hs.layout.html
-- https://github.com/miromannino/miro-windows-manager
-- http://www.hammerspoon.org/Spoons/
local windowHotkeys = {
  left_half = { hyper2, "a" },
  right_half = { hyper2, "d" },
  undo = { hyper2, "r" },
  center = { hyper2, "s" },
  max_toggle = { hyper2, "w" },
  larger = { hyper2, "+" },
  smaller = { hyper2, "-" }
}
-- TODO: 40/60 interessant? 30/70? Auf welche Tasten?
-- TODO: max + undo statt max_toggle?
spoon.WindowHalfsAndThirds:bindHotkeys(windowHotkeys)

--------------------------------------------------------------------------------
-- hs.alert.show("Config loaded")
hs.notify.new({title="Hammerspoon", informativeText="Config loaded"}):send()
