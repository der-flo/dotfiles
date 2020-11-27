-- https://github.com/Hammerspoon/hammerspoon/issues/841
-- TODO: Escaping?
return function(path)
  os.execute("/usr/local/bin/code " .. path)
end