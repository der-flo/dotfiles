-- TODO: Skip Alacritty in favor of Ghostty?
return function()
  os.execute("/opt/homebrew/bin/alacritty msg create-window || open /Applications/Alacritty.app")

  -- Alternativ?
  -- if hs.application.find("org.alacritty") then
  --   os.execute("/opt/homebrew/bin/alacritty msg create-window")
  --   hs.application.get("Alacritty"):activate()
  -- else
  --   hs.application.launchOrFocusByBundleID("org.alacritty")
  -- end
end
