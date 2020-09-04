local open_macvim = {}

-- https://github.com/Hammerspoon/hammerspoon/issues/841

-- TODO: Überprüfen, ob der Pfad eine Datei oder ein Verzeichnis ist, dann ließe
--   sich das zusammenführen
-- TODO: Escaping?

function open_macvim.dir(path)
  os.execute("/usr/local/bin/fish -c 'cd " .. path .. " && mvim'")
end

function open_macvim.file(path)
  os.execute("/usr/local/bin/fish -c 'mvim " .. path .. "'")
end

return open_macvim
