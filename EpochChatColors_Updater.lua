local ADDON_NAME   = "EpochChatColors"
local MSG_PREFIX   = "ecc"
local GITHUB_URL   = "https://github.com/Bennylavaa/EpochChatColors"

local loginchannels = { "BATTLEGROUND", "RAID", "GUILD", "PARTY" }
local groupchannels = { "BATTLEGROUND", "RAID", "PARTY" }
local alreadyshown  = false

local function splitver(str)
    local fields = {}
    string.gsub(tostring(str), "([^%.]+)", function(c)
        fields[table.getn(fields) + 1] = c
    end)
    return unpack(fields)
end

local function packver(major, minor, fix)
    return tonumber((major or 0) * 10000 + (minor or 0) * 100 + (fix or 0))
end

local function fmtver(v)
    local major = math.floor(v / 10000)
    local minor = math.floor((v % 10000) / 100)
    local fix   = v % 100
    return major .. "." .. minor .. "." .. fix
end

local rawver       = GetAddOnMetadata(ADDON_NAME, "Version") or "1.0.0"
local ma, mi, fx   = splitver(rawver)
local localversion = packver(ma, mi, fx)

RegisterAddonMessagePrefix(MSG_PREFIX)

local updater = CreateFrame("Frame")
updater:RegisterEvent("CHAT_MSG_ADDON")
updater:RegisterEvent("PLAYER_ENTERING_WORLD")
updater:RegisterEvent("PARTY_MEMBERS_CHANGED")
updater:SetScript("OnEvent", function(self, event, ...)
    if event == "CHAT_MSG_ADDON" then
        local prefix, msg, channel, sender = ...
        if prefix ~= MSG_PREFIX then return end

        local cmd, val = msg:match("^([^:]+):?(.*)")
        if cmd == "VERSION" then
            local remoteversion = tonumber(val)
            if remoteversion and remoteversion > localversion and not alreadyshown then
                alreadyshown = true
                DEFAULT_CHAT_FRAME:AddMessage("|cff33ffccEpochChatColors|r New version available!")
                DEFAULT_CHAT_FRAME:AddMessage("Current: |cff66ccff" .. fmtver(localversion) .. "|r -> Available: |cff66ccff" .. fmtver(remoteversion) .. "|r")
                DEFAULT_CHAT_FRAME:AddMessage("|cff66ccff" .. GITHUB_URL .. "|r")
            end
        elseif cmd == "PING?" then
            SendAddonMessage(MSG_PREFIX, "PONG!:" .. rawver, "WHISPER", sender)
        end

    elseif event == "PARTY_MEMBERS_CHANGED" then
        local groupsize = GetNumRaidMembers() > 0 and GetNumRaidMembers()
                       or GetNumPartyMembers() > 0 and GetNumPartyMembers()
                       or 0
        if (self.group or 0) < groupsize then
            for _, chan in ipairs(groupchannels) do
                SendAddonMessage(MSG_PREFIX, "VERSION:" .. localversion, chan)
            end
        end
        self.group = groupsize

    elseif event == "PLAYER_ENTERING_WORLD" then
        for _, chan in ipairs(loginchannels) do
            SendAddonMessage(MSG_PREFIX, "VERSION:" .. localversion, chan)
        end
    end
end)
