-- TODO: Zusammenfassbar?
-- TODO: Dokumentation
-- TODO: Fenster auf volle Höhe, x Pixel breit und zentrieren

return function()
  if hs.application.find("com.apple.Safari") then
    hs.osascript.applescript([[
      tell application "Safari"
        make new document
        activate
      end tell
    ]])
  else
    hs.application.launchOrFocusByBundleID("com.apple.Safari")
  end
end
