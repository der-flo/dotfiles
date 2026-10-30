-- Show active shortcuts and display-only entries while a Hyper prefix is held on its own.
return function(profiles)
  local heldProfile
  local dismissed = false
  local alertId
  local showTimer
  local showDelay = 0.5

  local function hide()
    if showTimer then
      showTimer:stop()
      showTimer = nil
    end
    if alertId then
      hs.alert.closeSpecific(alertId, 0)
      alertId = nil
    end
  end

  local function show(profile)
    local lines = { profile.title, "" }
    if profile.heading then
      table.insert(lines, 1, profile.heading)
    end
    local shortcuts = {}
    for _, hotkey in ipairs(hs.hotkey.getHotkeys()) do
      if hotkey.idx:sub(1, #profile.prefix) == profile.prefix then
        shortcuts[#shortcuts + 1] = hotkey.msg:sub(#profile.prefix + 1)
      end
    end
    for _, shortcut in ipairs(profile.extraShortcuts or {}) do
      shortcuts[#shortcuts + 1] = shortcut .. " ↗"
    end
    table.sort(shortcuts)
    for _, shortcut in ipairs(shortcuts) do
      lines[#lines + 1] = shortcut
    end
    local text = hs.styledtext.new(table.concat(lines, "\n"), {
      font = { name = "Menlo", size = 24 },
      color = { white = 1 },
      paragraphStyle = { paragraphSpacing = 6 },
    }):setStyle({
      font = { name = "Menlo-Bold", size = 30 },
      color = { red = 0.55, green = 0.8, blue = 1 },
    }, 1, #(profile.heading or profile.title))

    alertId = hs.alert.show(text, {
      padding = 24,
      textSize = 24,
      textFont = "Menlo",
      fadeInDuration = 0,
      fadeOutDuration = 0,
    }, "indefinite")
  end

  local types = hs.eventtap.event.types
  return hs.eventtap.new({ types.flagsChanged, types.keyDown }, function(event)
    local flags = event:getFlags()

    if heldProfile and not flags:contain(heldProfile.mods) then
      hide()
      heldProfile = nil
      dismissed = false
    end

    if event:getType() == types.keyDown then
      hide()
      if heldProfile then dismissed = true end
      return false
    end

    if not heldProfile then
      for _, profile in ipairs(profiles) do
        if flags:containExactly(profile.mods) then
          heldProfile = profile
          break
        end
      end
    end

    if heldProfile then
      if not flags:containExactly(heldProfile.mods) then
        hide()
        dismissed = true
      elseif not dismissed and not alertId and not showTimer then
        showTimer = hs.timer.doAfter(showDelay, function()
          showTimer = nil
          show(heldProfile)
        end)
      end
    end

    -- Observe only: leave shortcuts and normal keyboard input untouched.
    return false
  end):start()
end
