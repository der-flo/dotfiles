-- TODO: Zusammenfassbar?
-- TODO: Dokumentation
-- TODO: Fenster auf volle Höhe, x Pixel breit und zentrieren

return function()
  if hs.application.find("com.google.Chrome") then
    hs.osascript.applescript([[
      tell application "Google Chrome"
        make new window
        activate
      end tell
    ]])
  else
    hs.application.launchOrFocusByBundleID("com.google.Chrome")
  end
end
