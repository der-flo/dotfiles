-- TODO: Rework completely
-- TODO Prio 2: Dash, Chat starten
-- TODO: Google search as default action?

local openEditor = require "open_editor"

function runTrack(command)
  local output = hs.execute("/usr/local/bin/track " .. command)
  hs.notify.new({
    title = "track",
    informativeText = output
  }):send()
end

hs.loadSpoon("Seal")

-- TODO: Check out filesearch plugin

spoon.Seal:loadPlugins({ "apps", "calc", "useractions", "rubygems" })
spoon.Seal.plugins.useractions.actions = {
  ["Google-Suche nach"] = {
    url = "https://www.google.com/search?q=${query}",
    icon = "favicon",
    keyword = "g"
  },
  ["DevDocs-Suche nach"] = {
    url = "http://devdocs.io/#q=${query}",
    icon = "favicon",
    keyword = "dd"
  },
  ["LEO-Suche nach"] = {
    url = "https://dict.leo.org/englisch-deutsch/${query}",
    icon = "favicon",
    keyword = "leo"
  },
  ["Duden-Suche nach"] = {
    url = "https://www.duden.de/suchen/dudenonline/${query}",
    icon = "favicon",
    keyword = "duden"
  },
  ["Planio-Ticket"] = {
    url = "https://adigi.planio.de/issues/${query}",
    icon = "favicon",
    keyword = "#"
  },
  ["Planio-Wikisuche"] = {
    url = "https://adigi.planio.de/search?q=${query}" ..
        "&scope=all&all_words=1&titles_only=1&wiki_pages=1&submit=OK",
    icon = "favicon",
    keyword = "wiki"
  },
  ["Planio-Suche"] = {
    url = "https://adigi.planio.de/search?q=${query}" ..
        "&scope=all&all_words=1&submit=OK",
    icon = "favicon",
    keyword = "ps"
  },
  ["Planio-Zeitbuchung"] = {
    fn = function(param)
      local id, time = param:match("^(%d+) (.+)$")
      local url = "https://adigi.planio.de/issues/" .. id ..
          "/time_entries/new?time_entry[hours]=" .. time
      hs.execute(string.format("/usr/bin/open '%s'", url))
    end,
    icon = "favicon",
    keyword = "#z"
  },
  ["Start editor under ~/Documents"] = {
    fn = function(param) openEditor("~/Documents") end,
    icon = "favicon",
    keyword = "docs"
  },
  -- TODO: Diese Actions sind doppelt im Ergebnis, wenn man nach "seafiles"
  --       sucht.
  ["Start editor under ~/Cloud"] = {
    fn = function(param) openEditor("~/Cloud") end,
    icon = "favicon",
    keyword = "cloud"
  },
  -- TODO: Diese Actions sind doppelt im Ergebnis, wenn man nach "dotfiles"
  --       sucht.
  ["Start editor under ~/dotfiles"] = {
    fn = function(param) openEditor("~/dotfiles") end,
    icon = "favicon",
    keyword = "dotfiles"
  },
  ["Start editor under ~/Konzeption"] = {
    fn = function(param) openEditor("~/Konzeption") end,
    icon = "favicon",
    keyword = "konzeption"
  },
  ["track start"] = {
    fn = function(param) runTrack("start " .. param) end,
    keyword = "ts"
  },
  ["track"] = {
    fn = function(param) runTrack(param) end,
    keyword = "track"
  }
}
