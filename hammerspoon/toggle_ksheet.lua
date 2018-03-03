local ksheet = hs.loadSpoon("KSheet")

return function()
  if ksheet.sheetView:hswindow() then
    ksheet:hide()
  else
    ksheet:show()
  end
end
