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
