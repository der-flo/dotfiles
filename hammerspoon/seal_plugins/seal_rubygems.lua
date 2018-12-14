local obj = {}
obj.__index = obj
obj.__name = 'seal_rubygems'
obj.logger = hs.logger.new(obj.__name)
obj.icon =
  hs.image.imageFromPath(hs.configdir .. "/seal_plugins/rubygems_logo_red.png")


function obj:commands()
  return {}
end

function obj:bare()
  return self.askRubygemsOrg
end

function obj.askRubygemsOrg(query)

  local choices = {}
  if query == nil or query == "" then
    return choices
  end

  local match = string.match(query, "gem (.+)")
  if match ~= nil then

    local url = "https://rubygems.org/api/v1/search.json?query=" .. match
    local code, body, headers = hs.http.get(url)
    local data = hs.json.decode(body)

    for index, gem in pairs(data) do

      -- TODO: Multiple choices "source_code_uri", "documentation_uri",
      --       "homepage_uri"
      local choice = {
        text = gem.name,
        subText = "Version: " .. gem.version,
        image = obj.icon,
        plugin = obj.__name,
        url = gem.project_uri
      }
      table.insert(choices, choice)
    end

  end
  return choices
end

-- TODO: DRY up
function obj.completionCallback(rowInfo)
  hs.execute(string.format("/usr/bin/open '%s'", rowInfo.url))
end

return obj
