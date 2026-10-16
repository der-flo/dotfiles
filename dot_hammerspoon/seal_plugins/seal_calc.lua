-- Seal searches seal_plugins before its bundled plugins. Reuse the upstream
-- calculator and keep our decimal-comma support outside the Spoon directory.
local calc = dofile(hs.configdir .. "/Spoons/Seal.spoon/seal_calc.lua")
local upstreamBareCalc = calc.bareCalc

function calc.bareCalc(query)
  if query then
    query = query:gsub(",", ".")
  end
  return upstreamBareCalc(query)
end

return calc
