-- TODO
-- create window with profile "With TMUX"

return function()
  if hs.application.find("com.googlecode.iterm2") then
    hs.osascript.applescript([[
      tell application "iTerm"
        create window with profile "Default"
        activate
      end tell
    ]])
  else
    hs.application.launchOrFocusByBundleID("com.googlecode.iterm2")
  end
end
