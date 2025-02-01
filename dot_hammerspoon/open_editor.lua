-- https://github.com/Hammerspoon/hammerspoon/issues/841
-- TODO: Escaping?
return function(path)
  os.execute("/opt/homebrew/bin/zed " .. path)
end
