local function hcstrsplit(delimiter, subject)
  if not subject then return nil end
  local delimiter, fields = delimiter or ":", {}
  local pattern = string.format("([^%s]+)", delimiter)
  string.gsub(subject, pattern, function(c) fields[table.getn(fields)+1] = c end)
  return unpack(fields)
end

local function formatVersion(versionNum)
  local major = math.floor(versionNum / 10000)
  local minor = math.floor((versionNum % 10000) / 100)
  local fix = versionNum % 100
  return major .. "." .. minor .. "." .. fix
end

local major, minor, fix = hcstrsplit(".", tostring(GetAddOnMetadata("EpochChatColors", "Version")))
fix = fix or 0
local alreadyshown = false
local localversion = tonumber(major*10000 + minor*100 + fix)
local loginchannels = { "BATTLEGROUND", "RAID", "GUILD", "PARTY" }
local groupchannels = { "BATTLEGROUND", "RAID", "PARTY" }

local eccupdater = CreateFrame("Frame")
eccupdater:RegisterEvent("CHAT_MSG_ADDON")
eccupdater:RegisterEvent("PLAYER_ENTERING_WORLD")
eccupdater:RegisterEvent("PARTY_MEMBERS_CHANGED")
eccupdater:SetScript("OnEvent", function(_, event, ...)
    if event == "CHAT_MSG_ADDON" then
        local arg1, arg2, arg3, arg4 = ...
        if arg1 == "ecc" then
            local v, remoteversion = hcstrsplit(":", arg2)
            remoteversion = tonumber(remoteversion)
            if v == "VERSION" and remoteversion then
                if remoteversion > localversion and not alreadyshown then
                    local currentVer = formatVersion(localversion)
                    local availableVer = formatVersion(remoteversion)
                    DEFAULT_CHAT_FRAME:AddMessage("|cff33ffccEpochChatColors|r New version available!")
                    DEFAULT_CHAT_FRAME:AddMessage("Current: |cff66ccff" .. currentVer .. "|r -> Available: |cff66ccff" .. availableVer .. "|r")
                    DEFAULT_CHAT_FRAME:AddMessage("|cff66ccffhttps://github.com/Bennylavaa/EpochChatColors/releases|r")
                    alreadyshown = true
                end
            end
            if v == "PING?" then
                if arg3 == "WHISPER" then
                    SendAddonMessage("ecc", "PONG!:"..GetAddOnMetadata("EpochChatColors", "Version"), "WHISPER", arg4)
                else
                    for _, chan in ipairs(loginchannels) do
                        SendAddonMessage("ecc", "PONG!:"..GetAddOnMetadata("EpochChatColors", "Version"), chan)
                    end
                end
            end
        end
    elseif event == "PARTY_MEMBERS_CHANGED" then
        local groupsize = GetNumRaidMembers() > 0 and GetNumRaidMembers() or GetNumPartyMembers() > 0 and GetNumPartyMembers() or 0
        if (eccupdater.group or 0) < groupsize then
            for _, chan in ipairs(groupchannels) do
                SendAddonMessage("ecc", "VERSION:" .. localversion, chan)
            end
        end
        eccupdater.group = groupsize
    elseif event == "PLAYER_ENTERING_WORLD" then
        for _, chan in ipairs(loginchannels) do
            SendAddonMessage("ecc", "VERSION:" .. localversion, chan)
        end
    end
end)
