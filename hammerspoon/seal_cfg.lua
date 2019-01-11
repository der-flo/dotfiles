-- TODO Prio 2: Dash, Chat starten
-- TODO Prio 2: http://devdocs.io/#q={query} benötigt?

function startVimInPath(path)
  -- https://github.com/Hammerspoon/hammerspoon/issues/841
  os.execute("sh -c 'cd " .. path .. " && /usr/local/bin/mvim'")
end

function runTrack(command)
  local output = hs.execute("zsh -c 'source $HOME/.zshrc && chruby 2.4.1 && " ..
                            "track " .. command .. "'")
  hs.notify.new({
    title = "track",
    informativeText = output
  }):send()
end

hs.loadSpoon("Seal")
spoon.Seal:loadPlugins({"apps", "calc", "useractions", "rubygems"})
-- TODO: Google search, maybe as default action?
spoon.Seal.plugins.useractions.actions = {
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
    fn = function(param) startVimInPath("~/Documents") end,
    icon = "favicon",
    keyword = "docs"
  },
  ["Start editor under ~/Seafile/Meine Bibliothek"] = {
    fn = function(param) startVimInPath("~/Seafile/Meine\\ Bibliothek") end,
    icon = "favicon",
    keyword = "seafiles"
  },
  ["Start editor under ~/dotfiles"] = {
    fn = function(param) startVimInPath("~/dotfiles") end,
    icon = "favicon",
    keyword = "dotfiles"
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

