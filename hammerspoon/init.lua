-- TODO: http://www.hammerspoon.org/Spoons/
-- TODO: https://github.com/trishume/dotfiles/blob/master/hammerspoon/hammerspoon.symlink/init.lua
-- TODO: https://github.com/tombruijn/dotfiles/tree/master/hammerspoon

-- Debugging:
-- * https://github.com/Hammerspoon/hammerspoon/issues/1268
-- * hs.logger.d(data)
-- * hs.showError(body)

hs.loadSpoon("ReloadConfiguration")
spoon.ReloadConfiguration:start()

--------------------------------------------------------------------------------
-- Präfix für die meisten bzw. restlichen Hammerspoon-Kommandos
-- Per Karabiner auf rechtes ⌘ gebunden
local hyper = {"⌘", "⌥", "⌃"}

-- Präfix für alle Fenster-bezogenen Kommandos
-- Per Karabiner auf rechtes ⌥ gebunden
local hyper2 = {"⌘", "⌃", "⇧"}

--------------------------------------------------------------------------------
local isPrivateHost = hs.fnutils.find(hs.host.names(), function(name)
  return name:find("^flo%-mini") ~= nil
end) ~= nil

local new_browser_window = isPrivateHost and "new_safari_window" or "new_chrome_window"
hs.hotkey.bind(hyper, "c", require(new_browser_window))

local new_terminal_window = isPrivateHost and "new_iterm_window" or "new_terminal_window"
hs.hotkey.bind(hyper, "t", require(new_terminal_window))

hs.hotkey.bind(hyper, "i", require "toggle_ksheet")

-- TODO: Diese 3 Funktionen testen und robuster machen
local openEditor = require "open_editor"
local finder = require "finder"
hs.hotkey.bind(hyper, "d", function()
  openEditor(finder.opened_dir())
end)
hs.hotkey.bind(hyper, "f", function()
  openEditor(finder.selected_path())
end)
hs.hotkey.bind(hyper, "h", require "open_finder_location_in_terminal")
hs.hotkey.bind(hyper, "v", function()
  openEditor("--new-window")
end)

-- Karabiner Elements setzt aktuell leider "⌃-eject" außer Kraft.
-- https://github.com/tekezo/Karabiner-Elements/issues/89
hs.hotkey.bind(hyper, "s", hs.caffeinate.systemSleep)
hs.hotkey.bind(hyper, "l", hs.caffeinate.lockScreen)

require "seal_cfg"
hs.hotkey.bind(hyper, "space", function()
  spoon.Seal:toggle()
end)
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
    "iivvvvvv",
    "iivvvvvv",
    "",
    "i iTerm2",
    "v MacVim"
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
