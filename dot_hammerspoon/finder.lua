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

function finder.open()
  hs.osascript.applescript([[
    tell application "Finder" to make new Finder window
  ]])
end

return finder
