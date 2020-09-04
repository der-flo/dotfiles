local finder = {}

-- TODO: Weiter DRYen
function finder.selected_path()
  local _, path = hs.osascript.applescript([[
    tell application "Finder"
      return POSIX path of (selection as alias)
    end tell
  ]])
  return path
end

function finder.opened_dir()
  local _, path = hs.osascript.applescript([[
    tell application "Finder"
      return POSIX path of (insertion location as alias)
    end tell
  ]])
  return path
end

return finder
