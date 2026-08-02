local GlobalAddonName, E = ...
local L = E.L
----------------------------------------------------------------
-- https://warcraft.wiki.gg/wiki/DifficultyID
----------------------------------------------------------------
E.OctoTable_Difficulties = {
	-- 1. Looking For Raid / Story
	[151] = {prior = 1, abbr = "LFR", }, -- Looking For Raid (Timewalking)
	[17] = {prior = 2, abbr = "LFR", color = E.COLOR_GREEN}, -- Looking For Raid
	[7] = {prior = 3, abbr = "LFR", }, -- Looking For Raid (Legacy)
	[220] = {prior = 4, abbr = "Solo", }, -- Story (solo) raid
	-- 2. Normal
	[1] = {prior = 5, abbr = "N", }, -- Normal (party)
	[150] = {prior = 6, abbr = "N", }, -- Normal (party)
	[14] = {prior = 7, abbr = "N", color = E.COLOR_BLUE}, -- Normal (raid)
	[3] = {prior = 8, abbr = "10N", }, -- 10 Player (Normal)
	[4] = {prior = 9, abbr = "25N", }, -- 25 Player (Normal)
	[9] = {prior = 10, abbr = "40N", }, -- 40 Player (Normal)
	[12] = {prior = 11, abbr = "NS", }, -- Normal Scenario
	[38] = {prior = 12, abbr = "NS", }, -- Normal Scenario
	[147] = {prior = 13, abbr = "N", }, -- Normal (Warfronts)
	-- 3. Heroic
	[2] = {prior = 14, abbr = "H", }, -- Heroic (party)
	[15] = {prior = 15, abbr = "H", color = E.COLOR_PURPLE}, -- Heroic (raid)
	[5] = {prior = 16, abbr = "10H", }, -- 10 Player (Heroic)
	[6] = {prior = 17, abbr = "25H", }, -- 25 Player (Heroic)
	[11] = {prior = 18, abbr = "HS", }, -- Heroic Scenario
	[39] = {prior = 19, abbr = "HS", }, -- Heroic Scenario
	[149] = {prior = 20, abbr = "H", }, -- Heroic (Warfronts)
	[230] = {prior = 21, abbr = "H", }, -- Heroic (none)
	-- 4. Mythic
	[23] = {prior = 22, abbr = "M", }, -- Mythic (party)
	[16] = {prior = 23, abbr = "M", color = E.COLOR_ORANGE}, -- Mythic (raid)
	[40] = {prior = 24, abbr = "MS", }, -- Mythic Scenario
	[233] = {prior = 25, abbr = "MF", color = E.COLOR_ORANGE}, -- MythFlex
	-- 5. Mythic Keystone
	[8] = {prior = 26, abbr = "M+", }, -- Mythic Keystone
	-- 6. Timewalking
	[24] = {prior = 27, abbr = "TW", }, -- Timewalking (party)
	[33] = {prior = 28, abbr = "TW", }, -- Timewalking (raid)
	-- 7. PvP / PvEvP
	[34] = {prior = 29, abbr = "PvP", }, -- PvP
	[45] = {prior = 30, abbr = "PvP", }, -- PvP Scenario
	[25] = {prior = 31, abbr = "PvEvP", }, -- PvEvP Scenario
	[29] = {prior = 49, abbr = "PvEvP", }, -- "PvEvP Scenario" (pvp)
	[32] = {prior = 32, abbr = "WPvP", }, -- World PvP Scenario
	-- 8. Event / Scenario / Story
	[20] = {prior = 33, abbr = "ES", }, -- Event Scenario
	[30] = {prior = 34, abbr = "E", }, -- Event (scenario)
	[18] = {prior = 35, abbr = "E", }, -- Event (raid)
	[19] = {prior = 36, abbr = "E", }, -- Event (party)
	-- 9. Other scenarios / dungeons
	[152] = {prior = 37, abbr = "VoN", }, -- Visions of N'Zoth
	[153] = {prior = 38, abbr = "TI", }, -- Teeming Island
	[167] = {prior = 39, abbr = "Torg", }, -- Torghast
	[168] = {prior = 40, abbr = "PoA:C", }, -- Path of Ascension: Courage
	[169] = {prior = 41, abbr = "PoA:L", }, -- Path of Ascension: Loyalty
	[170] = {prior = 42, abbr = "PoA:W", }, -- Path of Ascension: Wisdom
	[171] = {prior = 43, abbr = "PoA:H", }, -- Path of Ascension: Humility
	[208] = {prior = 44, abbr = "D", }, -- Delves
	[172] = {prior = 45, abbr = "WB", }, -- World Boss
	[192] = {prior = 46, abbr = "CL1", }, -- Challenge Level 1
	[205] = {prior = 47, abbr = "F", }, -- Follower
	[216] = {prior = 48, abbr = "Q", }, -- Quest

	[254] = {prior = 50, abbr = "Naigtal", }, -- "Naigtal" (scenario)
	[247] = {prior = 51, abbr = "DD", }, -- "Decor Duel" (scenario)
	[253] = {prior = 52, abbr = "DD", }, -- "Decor Duel" (scenario)
	[251] = {prior = 53, abbr = "DD", }, -- "Decor Duel" (scenario)
	[245] = {prior = 54, abbr = "DD", }, -- "Decor Duel" (scenario)
	[248] = {prior = 55, abbr = "RENAME", }, -- "RENAME Event" (scenario)

	[236] = {prior = 56, abbr = "L", }, -- "Lorewalking" (party)
	[241] = {prior = 57, abbr = "L", }, -- "Lorewalking" (raid)
	[257] = {prior = 58, abbr = "L", }, -- "Timewalking" (raid)
	[250] = {prior = 59, abbr = "W", }, -- "World" (raid)
	[232] = {prior = 60, abbr = "E", }, -- "Event" (party)
}


    -- [9] = "|cffFF661ANO ID|r 29",
    -- [10] = "|cffFF661ANO ID|r 232",
    -- [11] = "|cffFF661ANO ID|r 236",
    -- [12] = "|cffFF661ANO ID|r 241",
    -- [13] = "|cffFF661ANO ID|r 245",
    -- [14] = "|cffFF661ANO ID|r 247",
    -- [15] = "|cffFF661ANO ID|r 248",
    -- [16] = "|cffFF661ANO ID|r 251",
    -- [17] = "|cffFF661ANO ID|r 253",
    -- [18] = "|cffFF661ANO ID|r 254",
    -- [19] = "|cffFF661ANO ID|r 257",



-- function E.function_diffTEST()
-- 	local tbl = {}
-- 	for id = 1, 1000 do
-- 		local name, groupType, isHeroic, isChallengeMode, displayHeroic, displayMythic, toggleDifficultyID = GetDifficultyInfo(id) -- E.func_GetName("difficulty", id)
-- 		if name and name ~= "" then
-- 			if not E.OctoTable_Difficulties[id] then
-- 				tbl[id] = tbl[id] or {}
-- 				tbl[id].name = name
-- 				tbl[id].groupType = groupType
-- 				tbl[id].isHeroic = isHeroic
-- 				tbl[id].isChallengeMode = isChallengeMode
-- 				tbl[id].displayHeroic = displayHeroic
-- 				tbl[id].displayMythic = displayMythic
-- 				tbl[id].toggleDifficultyID = toggleDifficultyID
-- 				print (E.COLOR_ORANGE .. "NO ID|r", id)
-- 			end
-- 		end
-- 	end
-- 	opde(tbl)
-- end

-- /run OctoEngine.function_diffTEST()