local ksheet = hs.loadSpoon("KSheet")

-- TODO: `toggle` directly available in the meantime, also `bindHotkeys`
return function()
  if ksheet.sheetView:hswindow() then
    ksheet:hide()
  else
    ksheet:show()
  end
end
