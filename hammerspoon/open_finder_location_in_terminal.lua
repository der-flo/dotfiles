finder = require "finder"
return function()
  local path = finder.opened_dir()
  hs.osascript.applescript([[
    tell application "Terminal"
      do script "cd ]] .. path .. [["
      activate
    end tell
  ]])
end
