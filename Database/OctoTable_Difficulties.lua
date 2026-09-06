local GlobalAddonName, E = ...
local L = E.L
----------------------------------------------------------------
-- https://warcraft.wiki.gg/wiki/DifficultyID
----------------------------------------------------------------
-- Локальный массив: { difficultyID, abbreviation, color? }
local difficultiesData = {
	-- 1. Looking For Raid / Story
	{151, "LFR"},                                  -- Looking For Raid (Timewalking)
	{17,  "LFR", E.COLOR_GREEN},                   -- Looking For Raid
	{250, "W",   E.COLOR_GREEN},                   -- "World" (raid)
	{7,   "LFR"},                                  -- Looking For Raid (Legacy)
	{220, "Solo"},                                 -- Story (solo) raid

	-- 2. Normal
	{1,   "N"},                                    -- Normal (party)
	{150, "N"},                                    -- Normal (party)
	{14,  "N",   E.COLOR_BLUE},                    -- Normal (raid)
	{3,   "10N"},                                  -- 10 Player (Normal)
	{4,   "25N"},                                  -- 25 Player (Normal)
	{9,   "40N"},                                  -- 40 Player (Normal)
	{12,  "NS"},                                   -- Normal Scenario
	{38,  "NS"},                                   -- Normal Scenario
	{147, "N"},                                    -- Normal (Warfronts)

	-- 3. Heroic
	{2,   "H"},                                    -- Heroic (party)
	{15,  "H",   E.COLOR_PURPLE},                  -- Heroic (raid)
	{5,   "10H"},                                  -- 10 Player (Heroic)
	{6,   "25H"},                                  -- 25 Player (Heroic)
	{11,  "HS"},                                   -- Heroic Scenario
	{39,  "HS"},                                   -- Heroic Scenario
	{149, "H"},                                    -- Heroic (Warfronts)
	{230, "H"},                                    -- Heroic (none)

	-- 4. Mythic
	{23,  "M"},                                    -- Mythic (party)
	{16,  "M",   E.COLOR_ORANGE},                  -- Mythic (raid)
	{233, "MF",  E.COLOR_ORANGE},                  -- MythFlex
	{40,  "MS"},                                   -- Mythic Scenario

	-- 5. Mythic Keystone
	{8,   "M+"},                                   -- Mythic Keystone

	-- 6. Timewalking
	{24,  "TW"},                                   -- Timewalking (party)
	{33,  "TW"},                                   -- Timewalking (raid)

	-- 7. PvP / PvEvP
	{34,  "PvP"},                                  -- PvP
	{45,  "PvP"},                                  -- PvP Scenario
	{25,  "PvEvP"},                                -- PvEvP Scenario
	{29,  "PvEvP"},                                -- "PvEvP Scenario" (pvp)
	{32,  "WPvP"},                                 -- World PvP Scenario

	-- 8. Event / Scenario / Story
	{20,  "ES"},                                   -- Event Scenario
	{30,  "E"},                                    -- Event (scenario)
	{18,  "E"},                                    -- Event (raid)
	{19,  "E"},                                    -- Event (party)

	-- 9. Other scenarios / dungeons
	{152, "VoN"},                                  -- Visions of N'Zoth
	{153, "TI"},                                   -- Teeming Island
	{167, "Torg"},                                 -- Torghast
	{168, "PoA:C"},                                -- Path of Ascension: Courage
	{169, "PoA:L"},                                -- Path of Ascension: Loyalty
	{170, "PoA:W"},                                -- Path of Ascension: Wisdom
	{171, "PoA:H"},                                -- Path of Ascension: Humility
	{208, "D"},                                    -- Delves
	{172, "WB"},                                   -- World Boss
	{192, "CL1"},                                  -- Challenge Level 1
	{205, "F"},                                    -- Follower
	{216, "Q"},                                    -- Quest

	{254, "Naigtal"},                              -- "Naigtal" (scenario)
	{247, "DD"},                                   -- "Decor Duel" (scenario)
	{253, "DD"},                                   -- "Decor Duel" (scenario)
	{251, "DD"},                                   -- "Decor Duel" (scenario)
	{245, "DD"},                                   -- "Decor Duel" (scenario)
	{248, "RENAME"},                               -- "RENAME Event" (scenario)

	{236, "L"},                                    -- "Lorewalking" (party)
	{241, "L"},                                    -- "Lorewalking" (raid)
	{257, "L"},                                    -- "Timewalking" (raid)
	{232, "E"},                                    -- "Event" (party)
}

for i, data in ipairs(difficultiesData) do
	local entry = { prior = i, abbr = data[2] }
	if data[3] then entry.color = data[3] end
	E.OctoTable_Difficulties[data[1]] = entry
end


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