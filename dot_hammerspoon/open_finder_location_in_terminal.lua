-- TODO: Alacritty

finder = require "finder"
return function()
  local path = finder.opened_dir()
  hs.osascript.applescript([[
    tell application "Terminal"
      # TODO: Das passiert nicht durch die TMUX-Session
      do script "cd ]] .. path .. [["
      activate
    end tell
  ]])
end
