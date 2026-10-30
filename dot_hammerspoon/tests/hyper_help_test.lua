-- Run from the repository root: lua dot_hammerspoon/tests/hyper_help_test.lua
local shown
local styledHeading
hs = {
  hotkey = { getHotkeys = function()
    return {
      { idx = "hyperZ", msg = "hyperZ: last" },
      { idx = "hyperB", msg = "hyperB: browser" },
      { idx = "otherF", msg = "otherF: unrelated" },
    }
  end },
  styledtext = { new = function(text)
    return { setStyle = function(_, style, first, last)
      assert(style.font.name == "Menlo-Bold" and style.font.size == 30)
      styledHeading = text:sub(first, last)
      return text
    end }
  end },
  alert = { show = function(text) shown = text; return 1 end },
  timer = { doAfter = function(_, callback) callback(); return {} end },
  eventtap = {
    event = { types = { flagsChanged = 1, keyDown = 2 } },
    new = function(_, callback)
      return { start = function() return callback end }
    end,
  },
}

local install = dofile("dot_hammerspoon/hyper_help.lua")
for _, case in ipairs({
  { expected = "Hyper\n\nB: browser\nZ: last" },
  { extra = {}, expected = "Hyper\n\nB: browser\nZ: last" },
  {
    extra = { "T: terminal", "C: Codex" },
    expected = "Hyper\n\nB: browser\nC: Codex ↗\nT: terminal ↗\nZ: last",
  },
  { heading = "Fenstersteuerung", expected = "Fenstersteuerung\nHyper\n\nB: browser\nZ: last" },
}) do
  local callback = install({
    { mods = {}, prefix = "hyper", title = "Hyper", heading = case.heading, extraShortcuts = case.extra },
  })
  assert(callback({
    getFlags = function() return { containExactly = function() return true end } end,
    getType = function() return hs.eventtap.event.types.flagsChanged end,
  }) == false, "The preview must leave keyboard input untouched")
  assert(shown == case.expected, shown)
  assert(styledHeading == (case.heading or "Hyper"), styledHeading)
end
print("hyper_help: sorted shortcuts, display-only entries and headings passed")
