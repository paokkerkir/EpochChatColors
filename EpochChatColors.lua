local tccGuildBrackets = 1
local CLORANGE  = "|cFFEEDD55"
local CDYELLOW  = "|cFFC9CC00"
local CGUILD    = "|cFF3CE13F"
local CYELLOW   = "|cFFFFFF00"
local CGREEN    = "|cFF00FF00"
local CDGREEN   = "|cFF00BB00"
local CBLUE     = "|cFF7070FF"
local CWHITE    = "|cFFFFFFFF"
local CORANGE   = "|cFFFF8000"
local CBROWN    = "|cFFFFB080"
local CPURPLE   = "|cFFD060D0"
local CPINK     = "|cFFFF80FF"
local CRED      = "|cFFFF0000"
local CLRED     = "|cFFFF8080"
local CLLRED    = "|cFFFFA8A8"
local CLGREEN   = "|cFF80FF80"
local CLLGREEN  = "|cFFDDFF88"
local CLGRAY    = "|cFFC0C0C0"
local CBGRAY    = "|cFFC0E0E0"
local CGRAY     = "|cFF888888"
local CDGRAY    = "|cFF707070"
local CLBLUE    = "|cFF40FFFF"
local CEND      = "|r"
local CMYCOLOR  = "|cFFFF8060"
local CSTART    = CBLUE.."-"..CYELLOW.."-"..CBLUE.."- "
local EpochChatColorsHooked = false
local EpochChatColors_Names = {}
local EpochChatColors_Level = {}
local GSnum = 0
local CSV = ""


CSV = "zulgurub=Zul'Gurub,loch modan=LochModan,scarlet monastery=ScarletMonastery"
CSV = CSV..",blackwing lair=BlackwingLair,wailing cavern=WailingCavern,molten core=MoltenCore,dire maul=DireMaul"
CSV = CSV..",dm east=DM:East,dm north=DM:North,dm west=DM:West,sunken temple=SunkenTemple"
CSV = CSV..",zul farrak=Zul'Farrak,zul farak=Zul'Farrak,zul'farak=Zul'Farrak,brd princess=BRD:princess"
CSV = CSV..",black morass=BlackMorass,blackfathom deep=BlackfathomDeep,razorfen downs=RazorfenDowns,razorfen kraul=RazorfenKraul"
CSV = CSV..",ragefire chasm=RagefireChasm,shadowfang keep=ShadowfangKeep,maraudon princess=Maraudon:princess,mara princess=Mara:princess"
CSV = CSV..",full run=Full-run,q run=Quest-run,quest run=Quest-run,arm cath=Cath-Arms"
CSV = CSV..",xp farm=XP-farm,xp run=XP-run,exp run=XP-run,elite quest=Elite-quest,aoe run=AoE-run,aoe farming=AoE-farming,aoe farm=AoE-farm"
CSV = CSV..",last spot=last-spot,emp run=Emp-run,emperor run=Emperor-run,jail break=JailBreak"
CSV = CSV..",main tank=MainTank,alterac valley=AlteracValley,warsong gulch=WarsongGulch,need mt=Need:MT,need ot=Need:OT"
CSV = CSV..",project epoch=project:Epoch,project ascension=project:Ascension"
CSV = CSV..",pvp=PvP,pve=PvE,wpvp=wPvP,darkmoon faire=DarkmoonFaire"
CSV = CSV..",strat undead=Strat:UD,strath undead=Strat:UD,strat live=Strat:Live,strath live=Strat:Live,strat living=Strat:Live"
CSV = CSV..",sm arm=SM:Arm,rep run=Repu-run,repu run=Repu-run"
CSV = CSV..",ranged dps=ranged-DPS,melee dps=melee-DPS,dmwest=DM:West,dmeast=DM:East,dmnorth=DM:North"
CSV = CSV..",cath/arms=Cath-Arms,arathi basin=ArathiBasin,first aid=FirstAid"
CSV = CSV..",feral druid=FeralDruid,resto druid=RestoDruid,combat log=CombatLog,arms sm=SM:Arm"
CSV = CSV..",booty bay=BootyBay,flight path=FlightPath,princess run=princess-run"
CSV = CSV..",leveling guild=leveling-Guild,escort quest=escort-quest,guild leader=GuildLeader,guild invite=Guild-invite"
CSV = CSV..",guild charter=Guild-charter,raid times=raid-times,honorable kill=HonorableKill"
CSV = CSV..",burning crusade=BurningCrusade,classic wow=ClassicWoW,world pvp=world-PvP"
CSV = CSV..",server first=ServerFirst,corpse camp=corpse-camp,ninja loot=ninjaloot,tarren mill=TarrenMill,arms warrior=arms-warrior"
local cPos, chReplace1, chReplace2, cp1, cp2 = nil, {}, {}
for part in string.gmatch(CSV, "([^,]+)") do
    cPos = strfind(part, "=")
    if cPos then
        cp1 = strsub(part, 1, cPos - 1)
        cp2 = strsub(part, cPos + 1)
        if cp1 ~= "" and cp2 ~= "" then
            table.insert(chReplace1, strsub(part, 1, cPos - 1))
            table.insert(chReplace2, strsub(part, cPos + 1))
        end
    end
end

CSV = "lf,lfm,lfg,lf1m,lf2m,lf3m,lf4m,wtb,buying,wts,selling,wtt,brd,lbrs,ubrs,bwl,zg,zf,dmw,dme,dmn,epl,wpl,stv,sm,aq,aq20,aq40,mc,dmf,dps,rdps,f,sw,bs,av,wsg,ab"
local chatUP = {}
for part in string.gmatch(CSV, "([^,]+)") do
    if part ~= "" then table.insert(chatUP, part) end
end

CSV = "ES,BB,BM,FARM,QUEST,ARM,AH,IF,SS,TM,UC,TB,ORG,SW,FP,GS"
local chLocBig = {}
for part in string.gmatch(CSV, "([^,]+)") do
    if part ~= "" then table.insert(chLocBig, part) end
end

CSV = "elites,elite,lochmodan,redridge,wetlands,wetland,westfall,arathi,mulgore,hogger,dragonmawretreat,karacrypt"
CSV = CSV..",sw,stormwind,ironforge,darnassus,darna,darn,undercity,uc,thunderbluff,tb,orgrimmar,orgri,org,ogri"
CSV = CSV..",goldshire,southshore,tarrenmill,jintha'alor,barrens,theramore,northshire"
CSV = CSV..",silithus,duskwood,westfall,bootybay,ratchet,everlook,gadgetzan,desolace,elwynn,ashenvale"
CSV = CSV..",darkshore,darkshire,lakeshire,tanaris,un'goro,winterspring,stocks,strat:live,azshara,stonard,hammerfall"
CSV = CSV..",deadmines,deathmines,deathmine,deadmine,dm,vc,wailingcaverns,wailingcavern,wc,stockades,stockade"
CSV = CSV..",gnomeregan,gnomer,ragefirechasm,rfc,sm:armory,hinterlands,hinterland"
CSV = CSV..",blackfathomdeeps,blackfathomdeep,blackfathom,bfd,razorfendowns,razorfen,rfd,razorfenkraul,rfk"
CSV = CSV..",shadowfangkeep,sfk,stranglethorn,princess-runs,maraudon:princess-runs,atal'hakkar,atal'hakar"
CSV = CSV..",scarletmonastery,sm,graveyard,graveyards,gy,library,lib,cathedral,cath,armory,cath-arms,sm:arms,sm:arm"
CSV = CSV..",sunkentemple,st,uldaman,ulda,uld,zul'farrak,zulfarrak,zulfarak,zf,maraudon,mara,maraudon:princess,mara:princess"
CSV = CSV..",scholomance,scholo,sholo,stratholme,strath,strat,ud,strat:ud,live,brm,brd,arena,brd:princess,lbrs,ubrs,rend"
CSV = CSV..",diremaul,dm,dme,dm:e,dmn,dm:n,dmw,dm:w,dm:east,dm:north,dm:west,tribute,trib"
CSV = CSV..",karazhan,kara,kara5,kara10,kara20,kara40,zulgurub,zul'gurub,zg,onyxia,kazzak,ony,nefarian,nefa"
CSV = CSV..",moltencore,mc,blackwinglair,bwl,ahn'qiraj,ahnqiraj,aq,aq20,aq40,naxxramas,naxramas,naxx,nax"
local chLocation = {}
for part in string.gmatch(CSV, "([^,]+)") do
    if part ~= "" then table.insert(chLocation, part) end
end
local CLOCATION = "|cFFEEFFAA"

CSV = "tank,tanks,dps,dd,rdps,mt,ot,offtank,maintank,1heal,1healer,1tank,1dps,2dps,3dps,escort"
CSV = CSV..",healer,healers,heal,healz,heals,fullrun,full-run,last-spot,qs,questrun,quest-run,xp-farm,xp-run"
CSV = CSV..",quest-runs,xp-runs,wanted:,elite-quest,elite-quests,aoe-runs,aoe-run,aoe,aoe-farm,aoe-farming"
CSV = CSV..",emp-run,emperor,repu-run,repu-runs,lotus,eels,petri,middleman,middle-man,7d,emp,xp,experience"
CSV = CSV..",jailbreak,gm,gm's,need:all,caster,congrats,congratz,gratz,grats,grat"
CSV = CSV..",enchanter,enchanting,enchants,ench,tailor,blacksmith,bs,alch,alchemist,crafter,questline"
CSV = CSV..",lockboxes,lockbox,need:mt,need:ot,transmute,jc,jewelcrafter,jcer,escort-quest"
CSV = CSV..",engineer,engi,leatherworker,lw,seller,pug,ranged-dps,melee-dps"
local chGreen = {}
for part in string.gmatch(CSV, "([^,]+)") do
    if part ~= "" then table.insert(chGreen, part) end
end
local CROLEGREEN = "|cFFB8E800"

CSV = "lava,lava-run,lava-runs,hc,hcs,hardcore,hardcores,inferno,immortal,rip,f,wtf,pvp,wpvp"
CSV = CSV..",showtooltip,afk,dnd,oom,<AFK>,mailbox,pm,pst,w,retail,dkp,dkps,epgp,addons,addon,cooking"
CSV = CSV..",bg,battleground,battlegrounds,alteracvalley,av,wsg,ab,arathibasin,warsonggulch,warsong"
CSV = CSV..",twink,twinks,battlemasters,battlemaster,horde,combatlog,oops,nvm,hk,honorablekill,rppvp,sv"
CSV = CSV..",spam,spamming,reported,ignore,ignoring,bot,bots,lunatic,lunatics,gank,ganker,gankers,ganking,ganked"
CSV = CSV..",lag,lags,lagging,disconnect,disconnecting,disconnects,cod,nerfed,bugged,invite,inv"
CSV = CSV..",scam,scammer,scamming,world-pvp,dmg,corpse-camp,camping,corpse,devilsaur,ninjaloot,ninjalooter"
CSV = CSV..",ninjad,unseen,mods,offline,toxic,def,defense,hr"
local chRed = {}
for part in string.gmatch(CSV, "([^,]+)") do
    if part ~= "" then table.insert(chRed, part) end
end
local CLIGHTRED = "|cFFFF9999"

CSV = "lf,lfg,lfm,lf1,lf2,lf3,lf4,lf1m,lf2m,lf3m,lf4m,lf5m,lf6m,lf7m,lf8m,lf9m,lfw,eu,na,en"
CSV = CSV..",group,que,queue,opening,alliance,selling,port,portal,bigwigs,bigwig,trainer,trainers"
CSV = CSV..",server,servers,serverfirst,summon,summons,sum,summ,summoning,recruiting,jed"
CSV = CSV..",project:ascension,ascension,epoch,project:epoch,devs,grp,party,dungeon,dung,dungeons"
CSV = CSV..",inviting,blizzard,blizz,fishing"
local chBlue = {}
for part in string.gmatch(CSV, "([^,]+)") do
    if part ~= "" then table.insert(chBlue, part) end
end
local CLFMBLUE = "|cFF66DDFF"

CSV = "wts,wtb,wtt,guild,guildleader,github,guild-invite,leveling-guild,leveling-guilds,vendor,vendors"
CSV = CSV..",bijou,bijous,raid,raids,raiding,raiders,gardening,rmt,guild-charter,raid-times,fp,flightpath,flightpaths"
CSV = CSV..",rp,roleplay,roleplaying,roleplayer,rppve,tbc,burningcrusade,bc,vanilla,classicwow,repairbot,online,reputation,repu,rep"
CSV = CSV..",achievement,attune,attunement,attuned,attu,bloodlust"
local chLGreen = {}
for part in string.gmatch(CSV, "([^,]+)") do
    if part ~= "" then table.insert(chLGreen, part) end
end
local CWTSGREEN = "|cFF77FF77"


local function DCFmsg(txt) if txt then DEFAULT_CHAT_FRAME:AddMessage(txt) end end
local function gkiir(txt) if txt then DEFAULT_CHAT_FRAME:AddMessage(CSTART..CMYCOLOR..txt..CEND) end end
local function CharChain(c, n) local s = "" if c and n then for i = 1, n do s = s..c end end return s end

local TCCcount = #chReplace1 + #chatUP + #chLocBig + #chLocation + #chGreen + #chRed + #chBlue + #chLGreen + 10
DCFmsg(CROLEGREEN.."EpochChatColors loaded "..CYELLOW..TCCcount..CROLEGREEN.." highlight words!")


function IsIn(iitxt, iichr)
    if strlen(iichr) > 0 and strlen(iitxt) > 0 then
        for iif = 1, strlen(iitxt) do
            if strsub(iitxt, iif, iif) == strsub(iichr, 1, 1) then return true end
        end
    end
    return false
end


function ECCHighlightStrs(message)
    if not message or message == "" then return message end

    if string.upper(strsub(message, -2)) == ":(" then
        message = strsub(message, 1, -3)..CLRED..":("
    elseif string.upper(message) == "GZ" or string.upper(message) == "GZ!" then
        message = CWTSGREEN..message
    end

    local lmessage = strlower(message)
    local s, e
    for tcf = 1, #chReplace1 do
        s, e = strfind(lmessage, chReplace1[tcf])
        if s and e then
            message = strsub(message, 1, s - 1)..chReplace2[tcf]..strsub(message, e + 1)
            s, e = strfind(strlower(message), chReplace1[tcf])
            if s and e then message = strsub(message, 1, s - 1)..chReplace2[tcf]..strsub(message, e + 1) end
        end
    end

    local num = 0
    local seps = " .,?!;/()+=@&#*"
    local stxt, wtxt = {}, {}
    local sep, word, chr = "", "", ""
    for i = 1, strlen(message) do
        chr = strsub(message, i, i)
        if IsIn(seps, chr) then
            if strlen(word) > 0 then
                wtxt[num] = word
                num = num + 1
                word = ""
                sep = ""
            end
            sep = sep..chr
        else
            if strlen(sep) > 0 or i == 1 then
                if i == 1 then num = num + 1 end
                stxt[num] = sep
                sep = ""
                word = ""
            end
            word = word..chr
        end
    end
    if strlen(sep) > 0 then stxt[num] = sep; num = num - 1
    elseif strlen(word) > 0 then wtxt[num] = word; stxt[num + 1] = "" end

    for wrd = 1, num do
        local lword = strlower(wtxt[wrd])
        for tcf = 1, #chatUP do
            if lword == chatUP[tcf] then wtxt[wrd] = strupper(wtxt[wrd]) end
        end
        for tcf = 1, #chLocBig do
            if wtxt[wrd] == chLocBig[tcf] then wtxt[wrd] = CLOCATION..wtxt[wrd].."|r"; lword = "" end
        end
        for tcf = 1, #chLocation do
            if lword == chLocation[tcf] then wtxt[wrd] = CLOCATION..wtxt[wrd].."|r" end
        end
        for tcf = 1, #chGreen do
            if lword == chGreen[tcf] then wtxt[wrd] = CROLEGREEN..wtxt[wrd].."|r" end
        end
        for tcf = 1, #chRed do
            if lword == chRed[tcf] then wtxt[wrd] = CLIGHTRED..wtxt[wrd].."|r" end
        end
        for tcf = 1, #chBlue do
            if lword == chBlue[tcf] then wtxt[wrd] = CLFMBLUE..wtxt[wrd].."|r" end
        end
        for tcf = 1, #chLGreen do
            if lword == chLGreen[tcf] then wtxt[wrd] = CWTSGREEN..wtxt[wrd].."|r" end
        end
        if lword == "mage" or lword == "mages" or lword == "frostmage" or lword == "firemage" then
            wtxt[wrd] = "|cff69ccf0"..wtxt[wrd].."|r"
        elseif lword == "warlock" or lword == "warlocks" or lword == "locks" or wtxt[wrd] == "lock" then
            wtxt[wrd] = "|cff9482c9"..wtxt[wrd].."|r"
        elseif lword == "priest" or lword == "priests" or lword == "holypriests" then
            wtxt[wrd] = "|cffffffff"..wtxt[wrd].."|r"
        elseif lword == "druid" or lword == "druids" or lword == "restodruid" or lword == "feraldruid"
            or lword == "drood" or lword == "droods" or lword == "boomkin" or lword == "moonkin" then
            wtxt[wrd] = "|cffff7d0a"..wtxt[wrd].."|r"
        elseif lword == "shaman" or lword == "shamans" then
            wtxt[wrd] = "|cff0070de"..wtxt[wrd].."|r"
        elseif lword == "paladin" or lword == "paladins" or lword == "retri" or lword == "retpal"
            or lword == "retpala" or lword == "pala" or lword == "palas" or lword == "holy" or lword == "prot" then
            wtxt[wrd] = "|cfff58cba"..wtxt[wrd].."|r"
        elseif lword == "rogue" or lword == "rogues" or lword == "rouge" then
            wtxt[wrd] = "|cfffff569"..wtxt[wrd].."|r"
        elseif lword == "hunter" or lword == "hunters" or lword == "huntard" or lword == "hunt" then
            wtxt[wrd] = "|cffabd473"..wtxt[wrd].."|r"
        elseif lword == "warrior" or lword == "warriors" or lword == "warrs" or lword == "fury"
            or lword == "arms-warrior" then
            wtxt[wrd] = "|cffc79c6e"..wtxt[wrd].."|r"
        end
    end

    if wtxt[1] and strlen(wtxt[1]) > 3 then
        local pre3 = strlower(strsub(wtxt[1], 1, 3))
        if (pre3 == "wts" or pre3 == "wtb") and strsub(strlower(wtxt[1]), 4, 4) ~= " " then
            wtxt[1] = CWTSGREEN..strupper(strsub(wtxt[1], 1, 3)).."|r "..strsub(wtxt[1], 4)
        end
    end

    message = ""
    for i = 1, num do message = message..stxt[i]..wtxt[i] end
    message = message..stxt[num + 1]
    message = string.gsub(message, "%+%-", "\194\177")
    message = string.gsub(message, "%-%+", "\194\177")
    message = string.gsub(message, ":%(",  CLRED..":%(|r")
    message = string.gsub(message, "<AFK>", CLRED.."<AFK>|r")
    return message
end


function EpochChangeGuildChat(message)
    local umsg = string.upper(message)
    if umsg == "F :(" or umsg == "RIP" or umsg == "F" or umsg == "FF" then
        message = CLRED..umsg
    elseif string.upper(strsub(message, -2)) == " F" then
        message = strsub(message, 1, -2)..CLRED.."F"
    elseif string.upper(strsub(message, -4)) == " RIP" then
        message = strsub(message, 1, -4)..CLRED..strsub(message, -3)
    elseif string.upper(strsub(message, -5)) == " F :(" then
        message = strsub(message, 1, -5)..CLRED.."F :("
    end

    if strsub(message, 1, 1) == "+" then
        message = CLOCATION.."+|r"..strsub(message, 2)
    end

    local a, b = string.find(message, "%[")
    local c, d = string.find(message, "%]")
    local e, f = string.find(message, "@")
    local g, h = string.find(message, " ")
    if ((a and c and a < 3 and b < c) or (e and g and e < 3 and f < g))
        and not string.find(message, "cleanchat")
    then
        local hName, gname, i
        if a and c and a < 3 and b < c then
            hName = strsub(message, b + 1, c - 1)
        else
            hName = strsub(message, f + 1, g - 1)
        end
        gname = hName
        gReadRoster()
        i = string.find(gname, " ");  if i then gname = strsub(gname, 1, i - 1) end
        i = string.find(gname, "%("); if i then gname = strsub(gname, 1, i - 1) end
        i = string.find(gname, "/");  if i then gname = strsub(gname, 1, i - 1) end
        gname = string.upper(strsub(gname, 1, 1))..string.lower(strsub(gname, 2))
        local level, hClass = GetECCGuildMemberInfo(gname)
        local hColor = CLGRAY
        if level then
            hClass = hClass or ""
            hColor = EpochChatColors_GetClassColor(string.upper(hClass))
        end
        if a and c and a < 3 and b < c then
            message = "["..hColor..hName.."|r]"..strsub(message, d + 1)
        else
            message = "@"..hColor..hName.."|r"..strsub(message, h)
        end
    end

    return ECCHighlightStrs(message)
end


function EpochChangeSystem(message)
    if not message then return message end

    if strsub(message, 1, 15) == "Your auction of" and strsub(message, -5) == "sold." then
        local _, a = string.find(message, "auction of")
        local b, _  = string.find(message, "sold.")
        if a and b then
            local hName = strsub(message, a + 2, b - 2)
            message = "   "..CYELLOW..strsub(message, 1, a + 1)..CGREEN.."*"..CWHITE..hName..CGREEN.."*"..CYELLOW..strsub(message, b - 1)
            PlaySound("AuctionWindowClose")
        end
        return message
    end

    if strsub(message, 1, 7) == "XP gain" then
        local _, a = string.find(message, " gain is")
        if a then
            if strsub(message, -3) == "OFF" then
                message = strsub(message, 1, a)..": "..CLRED.."OFF"
            else
                message = strsub(message, 1, a)..": "..CGREEN.."ON"
            end
            message = CYELLOW..message
        end
        return message
    end

    if string.find(message, "player") and strsub(message, -5) == "total" then return nil end
    if string.find(message, "%[") and string.find(message, " Level") and string.find(message, " - ") then return nil end

    return CYELLOW..message
end


function showrested(sr)
    local p = "player"
    local x = UnitXP(p)
    local m = UnitXPMax(p)
    local r = GetXPExhaustion()
    local t
    if -1 == (r or -1) then
        t = CLRED.."You are not rested."
    else
        t = "|cFF9999FFRested: "..CWHITE..(math.floor((r * 1000) / (m * 1.5)) / 10)..CGRAY.."%"
    end
    if sr then
        t = t.."            "..CDGRAY.."macro:  "..CLGRAY.."/run showrested()"
    end
    DCFmsg(CSTART..t..CEND)
end


function gReadRoster()
    local numGuild = GetNumGuildMembers()
    for i = 1, numGuild do
        local name, _, _, level, _, _, _, _, _, _, classFileName = GetGuildRosterInfo(i)
        if classFileName and name then
            EpochChatColors_ClassData(name, classFileName, level)
        end
    end
end

function GetECCGuildMemberInfo(gname)
    local numGuild = GetNumGuildMembers()
    for i = 1, numGuild do
        -- WotLK: name(1), level(4), zone(6), publicNote(7), officerNote(8), isOnline(9), classFileName(11)
        local name, _, _, level, _, zone, nnote, onote, online, _, classFileName = GetGuildRosterInfo(i)
        if name == gname then
            if nnote == "" then nnote = nil end
            if onote == "" then onote = nil end
            return level, classFileName, zone, nnote, online, onote
        end
    end
    return nil
end


function searchguild(arg)
    GSnum = 0
    if not arg or arg == "" then
        gkiir(CLRED.."Usage: /gs <text>  — searches guild names and notes")
        return
    end
    gReadRoster()
    arg = string.lower(arg)
    local numGuild = GetNumGuildMembers()
    if numGuild == 0 then
        gkiir(CRED.."You are not in a guild!")
        return
    end
    DCFmsg(CYELLOW.."Searching for:  "..CWHITE..string.upper(arg)..CGRAY.." ...")
    for i = 1, numGuild do
        local name, _, _, _, _, _, nnote, onote, online = GetGuildRosterInfo(i)
        if name and not online then
            if string.find(string.lower(name), arg)
                or (nnote and nnote ~= "" and string.find(string.lower(nnote), arg))
                or (onote and onote ~= "" and string.find(string.lower(onote), arg))
            then
                GShowGNInfo(name)
            end
        end
    end
    for i = 1, numGuild do
        local name, _, _, _, _, _, nnote, onote, online = GetGuildRosterInfo(i)
        if name and online then
            if string.find(string.lower(name), arg)
                or (nnote and nnote ~= "" and string.find(string.lower(nnote), arg))
                or (onote and onote ~= "" and string.find(string.lower(onote), arg))
            then
                GShowGNInfo(name)
            end
        end
    end
    if GSnum > 0 then
        DCFmsg(CWHITE..GSnum..CGRAY.." member(s) listed — click a "..CLGRAY.."NAME"..CGRAY.." to whisper!")
    else
        gkiir(CRED.."No players found!")
    end
end


function GShowGNInfo(hName)
    if not hName then return end
    local hLevel, hClass, hZone, hNote, online, oNote = GetECCGuildMemberInfo(hName)
    if not hLevel then return end
    GSnum = GSnum + 1
    local hColor = EpochChatColors_GetClassColor(string.upper(hClass or ""))
    local hNameLink = "|Hplayer:"..hName.."|h"..string.upper(hName).."|h"
    local note = ""
    if hNote and oNote then note = CGRAY.." ("..hNote.."|r"..CLGRAY.." / "..CGRAY..oNote..")|r"
    elseif hNote then note = CGRAY.." ("..hNote..")|r"
    elseif oNote then note = CGRAY.." ("..oNote..")|r" end
    local onlineStr = online and (CGRAY.." ("..CWHITE.."Online"..CGRAY..")") or (CGRAY.." (Offline)")
    DCFmsg("   "..CBGRAY..hLevel.."|r "..hColor..hNameLink.."|r"..note..CLORANGE.." @ "..CGREEN..(hZone or "?")..onlineStr)
end


function ECC_SlashCommandHandler(arg)
    if arg and arg ~= "" then
        gkiir("/ecc command: '"..arg.."'")
    else
        gkiir("EpochChatColors /ecc commands:")
        gkiir("  /gs <text>  — search guild members and notes")
        gkiir("  /gsearch <text>  — same as /gs")
        gkiir("  /showrested  — show rested XP percentage")
    end
end

function GSRC_SlashCommandHandler(argu)
    searchguild(argu)
end


function EpochChatColors_OnLoad(self)
    self:RegisterEvent("GUILD_ROSTER_UPDATE")
    self:RegisterEvent("VARIABLES_LOADED")
    self:RegisterEvent("PLAYER_LOGIN")
    self:RegisterEvent("PLAYER_ENTERING_WORLD")
    SlashCmdList["ECC"]  = ECC_SlashCommandHandler
    SLASH_ECC1  = "/ecc"
    SLASH_ECC2  = "/epochchatcolors"
    SlashCmdList["GSRC"] = GSRC_SlashCommandHandler
    SLASH_GSRC1 = "/gsearch"
    SLASH_GSRC2 = "/searchguild"
    SLASH_GSRC3 = "/guildsearch"
    SLASH_GSRC4 = "/gsrc"
    SLASH_GSRC5 = "/gsrch"
    SLASH_GSRC6 = "/searchg"
    SLASH_GSRC7 = "/gs"
end

function EpochChatColors_OnEvent(self, event)
    if (event == "PLAYER_ENTERING_WORLD" or event == "PLAYER_LOGIN") and not EpochChatColorsHooked then
        EpochChatColorsHooked = true
        EpochChatColors_OrigChatFrame_OnEvent = ChatFrame_OnEvent
        ChatFrame_OnEvent = EpochChatColors_ChatFrame_OnEvent
    end
    if event == "VARIABLES_LOADED" then
        SetWhoToUI(0)
        GuildRoster()
    end
    if event == "GUILD_ROSTER_UPDATE" then gReadRoster() end
end

function EpochChatColors_ChatFrame_OnEvent(self, event, msg, ...)
    if event == "CHAT_MSG_SYSTEM" then
        local result = EpochChangeSystem(msg)
        if result == nil or result == "" then return end
        return EpochChatColors_OrigChatFrame_OnEvent(self, event, result, ...)

    elseif event == "CHAT_MSG_GUILD" then
        msg = EpochChangeGuildChat(msg)

    elseif event == "CHAT_MSG_CHANNEL" then
        local baseName = select(8, ...)
        if baseName then
            if baseName == "World"
                or strsub(baseName, 1, 5) == "Trade"
                or strsub(baseName, 1, 7) == "General"
                or strsub(baseName, 1, 7) == "Looking"
                or strsub(baseName, 1, 11) == "LocalDefense"
            then
                msg = ECCHighlightStrs(msg)
            end
        end
    end

    return EpochChatColors_OrigChatFrame_OnEvent(self, event, msg, ...)
end

function EpochChatColors_ClassData(arg2, class, level)
    if arg2 then arg2 = string.upper(arg2) end
    if class then class = string.upper(class) end
    if not EpochChatColors_Names then EpochChatColors_Names = {} end
    if not EpochChatColors_Level then EpochChatColors_Level = {} end
    if not arg2 then return "" end

    if not class then
        for name, color in pairs(EpochChatColors_Names) do
            if name == arg2 then
                return color, EpochChatColors_Level[arg2]
            end
        end
        return ""
    end

    local found
    for name, color in pairs(EpochChatColors_Names) do
        if name == arg2 and EpochChatColors_Level[name] == level then
            found = true
        end
    end
    if not found then
        EpochChatColors_Names[arg2] = EpochChatColors_GetClassColor(class)
        EpochChatColors_Level[arg2] = level or 0
    end
    return ""
end

function EpochChatColors_GetClassColor(class)
    local classcolor = CGUILD
    if     class == "MAGE"        then classcolor = "|cff69ccf0"
    elseif class == "WARLOCK"     then classcolor = "|cff9482c9"
    elseif class == "PRIEST"      then classcolor = "|cffffffff"
    elseif class == "DRUID"       then classcolor = "|cffff7d0a"
    elseif class == "SHAMAN"      then classcolor = "|cff0070de"
    elseif class == "PALADIN"     then classcolor = "|cfff58cba"
    elseif class == "ROGUE"       then classcolor = "|cfffff569"
    elseif class == "HUNTER"      then classcolor = "|cffabd473"
    elseif class == "WARRIOR"     then classcolor = "|cffc79c6e"
    end
    return classcolor
end
