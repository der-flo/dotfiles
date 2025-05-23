-- TODO: Rework completely

-- TODO: http://www.hammerspoon.org/Spoons/
-- TODO: https://github.com/trishume/dotfiles/blob/master/hammerspoon/hammerspoon.symlink/init.lua
-- TODO: https://github.com/tombruijn/dotfiles/tree/master/hammerspoon
-- TODO: https://github.com/Hammerspoon/hammerspoon/issues/3224,
--       https://github.com/Hammerspoon/hammerspoon/issues/3224#issuecomment-2484394380
--       - welches Problem hatte ich?

-- TODO: https://www.alfredapp.com ?
-- TODO: https://www.reddit.com/r/hammerspoon/
-- TODO: https://github.com/mystery-z/awesome-hammerspoon/tree/main/src
-- TODO: https://www.reddit.com/r/hammerspoon/comments/wuqp2u/does_anyone_haves_a_config_for_hammerspoon/
-- TODO: yabai, skhd
-- * https://github.com/koekeishiya/yabai?tab=readme-ov-file
-- * https://github.com/koekeishiya/skhd
-- * https://www.danielcorin.com/til/yabai/replicating-hammerspoon-window-management/
-- * https://github.com/rtauziac/Hammerspoon-Yabai
-- * https://www.joshmedeski.com/posts/customizing-yabai-with-lua/

-- Debugging:
-- * https://github.com/Hammerspoon/hammerspoon/issues/1268
-- * hs.logger.d(data)
-- * hs.showError(body)

--------------------------------------------------------------------------------
-- Präfix für die meisten bzw. restlichen Hammerspoon-Kommandos
-- Per Karabiner auf rechtes ⌘ gebunden
local hyper = { "⌘", "⌥", "⌃" }

-- Präfix für alle Fenster-bezogenen Kommandos
-- Per Karabiner auf rechtes ⌥ gebunden
local hyper2 = { "⌘", "⌃", "⇧" }

--------------------------------------------------------------------------------

hs.loadSpoon("ReloadConfiguration")
spoon.ReloadConfiguration:bindHotkeys({ reloadConfiguration = { hyper, "r" } })
spoon.ReloadConfiguration:start()

-- TODO: Replace with chezmoi tricks?
local isPrivateHost = hs.fnutils.find(hs.host.names(), function(name)
  return name:find("^flo%-air") ~= nil
end) ~= nil

local new_browser_window = isPrivateHost and "new_safari_window" or "new_chrome_window"
hs.hotkey.bind(hyper, "c", "open new browser window", require(new_browser_window))

-- TODO: configured directly in Ghostty
-- hs.hotkey.bind(hyper, "t", require "new_alacritty_window")

-- TODO: Used?
hs.hotkey.bind(hyper, "i", "toogle KSheet", require "toggle_ksheet")
hs.hotkey.showHotkeys(hyper, "o")

-- TODO: Diese 3 Funktionen testen und robuster machen
local openEditor = require "open_editor"
local finder = require "finder"
hs.hotkey.bind(hyper, "d", "open editor in opened dir", function()
  openEditor(finder.opened_dir())
end)
hs.hotkey.bind(hyper, "f", function()
  -- TODO: Add again with other keycode
  -- openEditor(finder.selected_path())

  finder.open()
end)
hs.hotkey.bind(hyper, "h", "open finder location in terminal", require "open_finder_location_in_terminal")
hs.hotkey.bind(hyper, "v", "open new editor window", function()
  openEditor("--new-window")
end)

-- Karabiner Elements setzt aktuell leider "⌃-eject" außer Kraft.
-- https://github.com/tekezo/Karabiner-Elements/issues/89
hs.hotkey.bind(hyper, "s", "sleep", hs.caffeinate.systemSleep)
hs.hotkey.bind(hyper, "l", "lock computer", hs.caffeinate.lockScreen)

require "seal_cfg"
hs.hotkey.bind(hyper, "space", "toggle Seal", function()
  spoon.Seal:toggle()
end)
--------------------------------------------------------------------------------
-- Fenster-bezogene Kommandos

-- Die Animationen sind laggy, also schalten wir sie ab.
hs.window.animationDuration = 0

-- TODO: Used?
hs.hotkey.bind(hyper2, "f", "arrange coding windows", function()
  hs.mjomatic.go({
    "iiiCCCCC",
    "iiiCCCCC",
    "",
    "i iTerm2",
    "C Code"
  })
end)

hs.hotkey.bind(hyper2, "g", "arrange coding windows (2)", function()
  hs.mjomatic.go({
    "iivvvvvv",
    "iivvvvvv",
    "",
    "i iTerm2",
    "v MacVim"
  })
end)

-- TODO: hs.grid.show?

-- http://www.hammerspoon.org/Spoons/WindowHalfsAndThirds.html
hs.loadSpoon("WindowHalfsAndThirds")
-- Alternative:
-- http://www.hammerspoon.org/docs/hs.layout.html
-- https://github.com/miromannino/miro-windows-manager
-- http://www.hammerspoon.org/Spoons/
local windowHotkeys = {
  left_half = { hyper2, "a", message = "window left half" },
  right_half = { hyper2, "d", message = "window right half" },
  undo = { hyper2, "r", message = "window undo" },
  center = { hyper2, "s", message = "window center" },
  max_toggle = { hyper2, "w", message = "window max-toggle" },
  larger = { hyper2, "+", message = "window larger" },
  smaller = { hyper2, "-", message = "window smaller" }
}
-- TODO: 40/60 interessant? 30/70? Auf welche Tasten?
-- TODO: max + undo statt max_toggle?
spoon.WindowHalfsAndThirds:bindHotkeys(windowHotkeys)

-- http://www.hammerspoon.org/Spoons/WindowScreenLeftAndRight.html
hs.loadSpoon("WindowScreenLeftAndRight")
local moveHotkeys = {
  screen_left = { hyper2, "q", message = "move window to left screen" },
  screen_right = { hyper2, "e", message = "move window to right screen" },
}
spoon.WindowScreenLeftAndRight:bindHotkeys(moveHotkeys)

--------------------------------------------------------------------------------
-- hs.alert.show("Config loaded")
hs.notify.new({ title = "Hammerspoon", informativeText = "Config loaded" }):send()
