return function()
  hs.osascript.applescript([[
    if application "Terminal" is running then
      tell application "Terminal"
        do script ""
        activate
      end tell
    else
      tell application "Terminal"
        activate
      end tell
    end if
  ]])
end
