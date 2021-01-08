local Addon = select(2, ...)

local Debug = {}
Addon.Debug = Debug

local private = {}

function Debug.Log(msg, ...)
  local chatFrame = private.GetDebugChatFrame()
  if chatFrame then
    Addon:Printf(chatFrame, msg, ...)
  end
end

function Debug.TableToString ( t )
  local print_r_cache={}
  local function sub_print_r(t,indent)
      if (print_r_cache[tostring(t)]) then
          Addon.Debug.Log(indent.."*"..tostring(t))
      else
          print_r_cache[tostring(t)]=true
          if (type(t)=="table") then
              for pos,val in pairs(t) do
                  if (type(val)=="table") then
                      Addon.Debug.Log(indent.."["..pos.."] => "..tostring(t).." {")
                      sub_print_r(val,indent..string.rep(" ",string.len(pos)+8))
                      Addon.Debug.Log(indent..string.rep(" ",string.len(pos)+6).."}")
                  elseif (type(val)=="string") then
                      Addon.Debug.Log(indent.."["..pos..'] => "'..val..'"')
                  else
                      Addon.Debug.Log(indent.."["..pos.."] => "..tostring(val))
                  end
              end
          else
              Addon.Debug.Log(indent..tostring(t))
          end
      end
  end
  if (type(t)=="table") then
      Addon.Debug.Log(tostring(t).." {")
      sub_print_r(t,"  ")
      Addon.Debug.Log("}")
  else
      sub_print_r(t,"  ")
  end
  Addon.Debug.Log("")
end

function private.GetDebugChatFrame() -- private
  local tab = -1
  for i = 1, 10 do
    if GetChatWindowInfo(i)=="BADebug" then
      tab = i
      break
    end
  end

  if(tab ~= -1) then
    return _G["ChatFrame"..tab]
  end
end
