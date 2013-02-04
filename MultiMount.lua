
function giddyup()

  UNDERWATER_MOUNT="Subdued Seahorse"
  BOBBING_IN_WATER_MOUNT="Sandstone Drake"
  FLYING_MOUNT="Bronze Drake Mount"
  GROUND_MOUNT="Pinto"

  local mounts = {}
  local i 
  
  for i=1,GetNumCompanions("MOUNT") do
    local _,creatureName,_,_,_,_= GetCompanionInfo("MOUNT", i)
    mounts[creatureName] = i
  end
  
  if IsMounted() or IsFlying() or IsIndoors() then
    return 1 
  end
  
  if IsFalling() then
    -- Hope it's not too far. Either way, you can't
    -- summon a mount. Your best bet is a parachute
    -- or goblin glider.
    return -1 
  end
  
  if IsSwimming() then
    local i
    for i=1,3 do
      if ( getglobal("MirrorTimer"..i):IsVisible() ) then
        if ( getglobal("MirrorTimer"..i.."Text"):GetText() == BREATH_LABEL ) then
          -- The breath bar is up, inferring that you are under water
          CallCompanion("MOUNT", mounts[UNDERWATER_MOUNT])
          return 0 
        end
      end
    end
    -- We're swimming, but no breath bar, so we must be on the surface
    -- Some of my flying mounts automatically dismount me when I contact
    -- water, sandstone drake doesn't. So, I got used to using him
    -- as the mount I used to get out of the water.
    CallCompanion("MOUNT", mounts[BOBBING_IN_WATER_MOUNT])
    return 0
  else
    -- We're not swimming
    if IsFlyableArea() then
      -- We can fly
      CallCompanion("MOUNT", mounts[FLYING_MOUNT])
      return 0
    else
      -- Since we've made it this far, we know that we're
      --   * not mounted
      --   * not indoors
      --   * not under water
      --   * not bobbing in the water
      --   * not falling
      --   * not in a zone we can fly in
      -- 
      -- So default to the Pinto. 
      CallCompanion("MOUNT", mounts[GROUND_MOUNT])  
      return 0
    end
  end
end

SLASH_MULTIMOUNT1, SLASH_MULTIMOUNT2 = '/mm', '/multimount'
function SlashCmdList.MULTIMOUNT(msg)
    msg = SecureCmdOptionParse(msg)
    if msg then
        giddyup();
    end
end

