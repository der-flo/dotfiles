local layouts = {}

-- Relative to each monitor's usable area (excluding menu bar and Dock).
-- Bundle IDs also work when an application's display name changes.
layouts.coding = {
  ["com.mitchellh.ghostty"] = { screen = "left", x = 0, y = 0, w = 1, h = 1 },
  ["com.openai.chat"] = { screen = "right", x = 0, y = 0, w = 0.8, h = 1 },
  ["com.openai.codex"] = { screen = "right", x = 0, y = 0, w = 0.8, h = 1 },
  ["com.microsoft.VSCode"] = { screen = "right", x = 0.3, y = 0, w = 0.7, h = 1 },
}

function layouts.apply(layout)
  local screens = hs.screen.allScreens()
  table.sort(screens, function(a, b)
    return a:fullFrame().x < b:fullFrame().x
  end)

  if #screens < 2 or screens[1]:fullFrame().x == screens[#screens]:fullFrame().x then
    hs.alert.show("Coding-Layout benötigt einen linken und einen rechten Monitor")
    return
  end

  -- With more than two monitors, use the leftmost and rightmost monitors.
  local targets = { left = screens[1], right = screens[#screens] }
  local count = 0

  -- Query on demand: only windows in the currently visible Space(s).
  -- Covered windows are included; hidden apps and minimized windows are not.
  -- Capture the list before moving windows, and never focus or raise them.
  for _, window in ipairs(hs.window.visibleWindows()) do
    local app = window:application()
    local rule = app and layout[app:bundleID()]
    if rule and window:isStandard() and not window:isFullScreen() then
      local frame = targets[rule.screen]:frame()
      window:setFrame({
        x = frame.x + frame.w * rule.x,
        y = frame.y + frame.h * rule.y,
        w = frame.w * rule.w,
        h = frame.h * rule.h,
      }, 0)
      count = count + 1
    end
  end

  if count == 0 then
    hs.alert.show("Keine passenden Fenster im aktuellen Space")
  end
end

return layouts
