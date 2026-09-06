local GlobalAddonName, E = ...
local L = E.L
----------------------------------------------------------------
if not E.DEBUG then return end
----------------------------------------------------------------
local categoryKey = 55
----------------------------------------------------------------
E.Components[categoryKey] = function()
	if not Octo_ToDo_DB_Variables.DATACOLLECTION.QUESTS then return end

	local OctoTables_Vibor = {}
	OctoTables_Vibor[categoryKey] = {}
	OctoTables_Vibor[categoryKey].defs = false
	OctoTables_Vibor[categoryKey].icon = E.ICON_DEBUG
	OctoTables_Vibor[categoryKey].name = CALENDAR_FILTER_HOLIDAYS
	OctoTables_Vibor[categoryKey].color = E.COLOR_RED
	----------------------------------------------------------------
	local Currencies = {
		-- {id = 1166, defS = true,}, -- Timewarped Badge (local joinable, timewalkDungeonName = E.func_GetTimewalkingDungeon())
		-- {id = 3309, defS = true,}, -- Hellstone Shard
		-- {id = 2588, defS = true,}, -- Riders of Azeroth Badge
	}
	----------------------------------------------------------------
	local Items = {
		{id = 44791, defS = true,}, -- Event: Noblegarden
		{id = 45072, defS = true,}, -- Event: Noblegarden
		{id = 23247, defS = true,}, -- Event: Midsummer Fire Festival
	}
	----------------------------------------------------------------
	local UniversalQuests = {
		-- {
		-- 	sorted = false,
		-- 	showTooltip = true,
		-- 	TextLeft = function()
		-- 		return "SummerFestival"
		-- 	end,
		-- 	name_save = "SummerFestival",
		-- 	defS = true,
		-- 	reset = "Monthly",
		-- 	desc = categoryKey,
		-- 	quests = {
		--		HandyNotes_SummerFestival
		-- 	},
		-- 	-- forcedMaxQuest = 1,
		-- },
		{
			sorted = true,
			showTooltip = true,
			TextLeft = function()
				return E.func_GetName("event", 141)
			end,
			name_save = "FeastofWinterVeil",
			defS = true,
			reset = "Monthly",
			desc = categoryKey,
			quests = {
				{8744, addText = {mapID = 85}, FactionOrClass = {Horde = true,}},
				{8768, addText = {mapID = 85}, FactionOrClass = {Horde = true,}},
				{8769, addText = {mapID = 85}, FactionOrClass = {Horde = true,}},
				{8803, addText = {mapID = 85}, FactionOrClass = {Horde = true,}},
				{91041, addText = {mapID = 85}, FactionOrClass = {Horde = true,}},
				{91042, addText = {mapID = 85}, FactionOrClass = {Horde = true,}},
				{8744, addText = {mapID = 87}, FactionOrClass = {Alliance = true,}},
				{8768, addText = {mapID = 87}, FactionOrClass = {Alliance = true,}},
				{8769, addText = {mapID = 87}, FactionOrClass = {Alliance = true,}},
				{8803, addText = {mapID = 87}, FactionOrClass = {Alliance = true,}},
				{91041, addText = {mapID = 87}, FactionOrClass = {Alliance = true,}},
				{91042, addText = {mapID = 87}, FactionOrClass = {Alliance = true,}},
			},
		},
		{
			sorted = true,
			showTooltip = true,
			TextLeft = function()
				return E.func_GetName("event", 141).. " "..GARRISON_LOCATION_TOOLTIP
			end,
			name_save = "FeastofWinterVeil_DRAENOR",
			defS = true,
			reset = "Monthly",
			desc = categoryKey,
			quests = {
				{39651},
				{39668},
				{39648},
				{39649},
			},
		},
		{
			sorted = true,
			showTooltip = true,
			TextLeft = function()
				return "Тыквовин"
			end,
			name_save = "HallowsEnd_DRAENOR",
			defS = true,
			reset = "Monthly",
			desc = categoryKey,
			quests = {
				{39716},
				{39719},
				{39720},
				{39721},
			},
		},
		{
			sorted = false,
			showTooltip = true,
			TextLeft = function()
				return E.func_GetName("quest", 13503, false) .. " ("..E.func_GetName("event", 181)..")"
			end,
			name_save = "ATisketaTasketaNoblegardenBasket",
			defS = true,
			reset = "Monthly",
			desc = categoryKey,
			quests = {
				{13503},
			},
		},
		{
			TextLeft = function()
				return E.func_GetName("quest", 79575, false) .. " ("..E.func_GetName("event", 181)..")"
			end,
			showTooltip = true,
			name_save = "WhattheDuck",
			defS = true,
			reset = "Monthly",
			desc = categoryKey,
			quests = {
				{79575},
			},
		},
		{
			TextLeft = function()
				return E.func_GetName("quest", 13479, false) .. " ("..E.func_GetName("event", 181)..")"
			end,
			showTooltip = true,
			name_save = "TheGreatEggHunt",
			defS = true,
			reset = "Daily",
			desc = categoryKey,
			quests = {
				{13479},
			},
		},
		{
			TextLeft = function()
				return E.func_GetName("quest", 79576, false) .. " ("..E.func_GetName("event", 181)..")"
			end,
			showTooltip = true,
			name_save = "AFowlConcoction",
			defS = true,
			reset = "Monthly",
			desc = categoryKey,
			quests = {
				{79576},
			},
		},
		{
			TextLeft = function()
				return E.func_GetName("quest", 79577, false) .. " ("..E.func_GetName("event", 181)..")"
			end,
			showTooltip = true,
			name_save = "DuckTales",
			defS = true,
			reset = "Monthly",
			desc = categoryKey,
			quests = {
				{79577},
			},
		},
		{
			TextLeft = function()
				return E.func_GetName("quest", 79578, false) .. " ("..E.func_GetName("event", 181)..")"
			end,
			showTooltip = true,
			name_save = "JustaWaddleAway",
			defS = true,
			reset = "Monthly",
			desc = categoryKey,
			quests = {
				{79578, faction = "Horde",},
				{79331, faction = "Alliance"},
			},
		},
		{
			TextLeft = function()
				return E.func_GetName("quest", 79558, false) .. " ("..E.func_GetName("event", 181)..")"
			end,
			showTooltip = true,
			name_save = "FeatheredFiend",
			defS = true,
			reset = "Daily",
			desc = categoryKey,
			quests = {
				{79558, faction = "Horde",},
				{73192, faction = "Alliance"},
			},
		},
		{
			TextLeft = function()
				return E.func_GetName("quest", 79135, false) .. " ("..E.func_GetName("event", 181)..")"
			end,
			showTooltip = true,
			name_save = "QuackingDown",
			defS = true,
			reset = "Daily",
			desc = categoryKey,
			quests = {
				{79135},
			},
		},
		{
			TextLeft = function()
				return E.func_GetName("map", 85) .."/"..E.func_GetName("map", 84).. " ("..E.func_GetName("event", 201)..")"
			end,
			showTooltip = true,
			name_save = "orgrimmarStormwind",
			defS = true,
			reset = "Monthly",
			desc = categoryKey,
			quests = {
				{172, faction = "Horde",},
				{29146, faction = "Horde",},
				{29176, faction = "Horde",},
				{54146, faction = "Horde",},
				{29190, faction = "Horde",},
				{29191, faction = "Horde",},
				{5502, faction = "Horde",},
				----
				{1468, faction = "Alliance"},
				{29093, faction = "Alliance"},
				{29106, faction = "Alliance"},
				{54130, faction = "Alliance"},
				-- {29117, faction = "Alliance"}, -- ДУБЛЬ
				-- {29119, faction = "Alliance"}, -- ДУБЛЬ
				{171, faction = "Alliance"},
			},
		},
		----------------------------------------------------------------
		{
			TextLeft = function()
				return "Shattrath" .. " ("..E.func_GetName("event", 201)..")"
			end,
			showTooltip = true,
			name_save = "Shattrath",
			defS = true,
			reset = "Monthly",
			desc = categoryKey,
			quests = {
				{10942, faction = "Horde",},
				{10953, faction = "Horde",},
				{10951, faction = "Horde",},
				{10945, faction = "Horde",},
				{11975, faction = "Horde",},
				{10963, faction = "Horde",},
				{10967, faction = "Horde",},
				----
				{10943, faction = "Alliance"},
				{10950, faction = "Alliance"},
				{10952, faction = "Alliance"},
				{10954, faction = "Alliance"},
				-- {10962, faction = "Alliance"}, -- ДУБЛЬ
				{10956, faction = "Alliance"},
				-- {10966, faction = "Alliance"}, -- ЛИШНЕЕ?
				-- {10968, faction = "Alliance"}, -- ЛИШНЕЕ?
				{10966, faction = "Alliance"},
			},
		},
		----------------------------------------------------------------
		{
			TextLeft = function()
				return L["Daily quests"] .. " ("..E.func_GetName("event", 181)..")"
			end,
			showTooltip = true,
			name_save = "orgrimmarStormwindDAILY",
			defS = true,
			reset = "Daily",
			desc = categoryKey,
			quests = {
				{82109, faction = "Horde",},
				{11925, faction = "Horde",},
				{82080, faction = "Alliance"},
				{11924, faction = "Alliance"},
			},
		},
		----------------------------------------------------------------
		----------------------------------------------------------------
		----------------------------------------------------------------
		{
			TextLeft = function()
				return RAIDS..select(2, E.func_GetTimewalkingDungeon())
			end,
			showTooltip = true,
			name_save = "Raid",
			defS = true,
			reset = "Weekly",
			desc = categoryKey,
			quests = {
				{57637},
				{50316},
				{47523},
				{82817},
			},
		},
		{
			sorted = false,
			TextLeft = function()
				return L["DUNGEONS"]..select(2, E.func_GetTimewalkingDungeon())
			end,
			showTooltip = true,
			name_save = "Dungeons",
			defS = true,
			reset = "Weekly",
			desc = categoryKey,
			quests = {
				{nil, addText = {IconVignette = "VignetteKillElite"}, forcedText = {text = "Bonus Event Holiday Quests"},},
				{86731, addText = {expansionText = E.func_FormatExpansion(1, "LEFT")}}, -- 1 CLASSIC (An Original Path Through Time)
				{83363, addText = {expansionText = E.func_FormatExpansion(2, "LEFT")}}, -- 2 TBC (A Burning Path Through Time)
				{83365, addText = {expansionText = E.func_FormatExpansion(3, "LEFT")}}, -- 3 WOTLK (A Frozen Path Through Time)
				{83359, addText = {expansionText = E.func_FormatExpansion(4, "LEFT")}}, -- 4 Cataclysm (A Shattered Path Through Time)
				{83362, addText = {expansionText = E.func_FormatExpansion(5, "LEFT")}}, -- 5 PANDA (A Shrouded Path Through Time)
				{83364, addText = {expansionText = E.func_FormatExpansion(6, "LEFT")}}, -- 6 DRAENOR (A Savage Path Through Time)
				{83360, addText = {expansionText = E.func_FormatExpansion(7, "LEFT")}}, -- 7 LEGION (A Fel Path Through Time)
				{88805, addText = {expansionText = E.func_FormatExpansion(8, "LEFT")}}, -- 8 BFA (A Scarred Path Through Time)
				{92649, addText = {expansionText = E.func_FormatExpansion(9, "LEFT")}}, -- 9 SL (Темный путь сквозь время)
				{nil},
				{nil, addText = {IconVignette = "VignetteKillElite"}, forcedText = {text = L["Weekend Event"]},},
				-- NORMAL TIMEWALK
				{85947, addText = {expansionText = E.func_FormatExpansion(1, "LEFT")}}, -- 1 CLASSIC
				{85948, addText = {expansionText = E.func_FormatExpansion(2, "LEFT")}}, -- 2 TBC
				{85949, addText = {expansionText = E.func_FormatExpansion(3, "LEFT")}}, -- 3 WOTLK
				{86556, addText = {expansionText = E.func_FormatExpansion(4, "LEFT")}}, -- 4 Cataclysm
				{86560, addText = {expansionText = E.func_FormatExpansion(5, "LEFT")}}, -- 5 PANDA
				{86563, addText = {expansionText = E.func_FormatExpansion(6, "LEFT")}}, -- 6 DRAENOR
				{86564, addText = {expansionText = E.func_FormatExpansion(7, "LEFT")}}, -- 7 LEGION
				{88808, addText = {expansionText = E.func_FormatExpansion(8, "LEFT")}}, -- 8 BFA
				{92647, addText = {expansionText = E.func_FormatExpansion(9, "LEFT")}}, -- 9 SL
			},
			forcedMaxQuest = 1,
		},
		{
			TextLeft = function()
				return "Profession Monthlies" .. " ("..E.func_GetName("event", 479)..")"
			end,
			showTooltip = true,
			name_save = "ProfessionMonthlies",
			defS = true,
			reset = "Monthly",
			desc = categoryKey,
			quests = {
				{29506},
				{29507},
				{29508},
				{29509},
				{29510},
				{29511},
				{29513},
				{29514},
				{29515},
				{29516},
				{29517},
				{29518},
				{29519},
				{29520},
			},
		},
		{
			TextLeft = function()
				return "Monthly Quests" .. " ("..E.func_GetName("event", 479)..")"
			end,
			showTooltip = true,
			name_save = "MonthlyQuests",
			defS = true,
			reset = "Monthly",
			desc = categoryKey,
			quests = {
				{33354},
				{29443},
			},
		},
		{
			TextLeft = function()
				return "Acount-wide Dailies" .. " ("..E.func_GetName("event", 479)..")"
			end,
			showTooltip = true,
			name_save = "AcountwideDailies",
			defS = true,
			reset = "Daily",
			desc = categoryKey,
			quests = {
				{32175},
				{36471},
			},
		},
		{
			TextLeft = function()
				return "item turns ins" .. " ("..E.func_GetName("event", 479)..")"
			end,
			showTooltip = true,
			name_save = "itemturnsins",
			defS = true,
			reset = "Daily",
			desc = categoryKey,
			quests = {
				{29458},
				{29456},
				{29457},
				{29443},
				{29444},
				{29445},
				{29446},
				{29464},
				{29451},
			},
		},
		{
			TextLeft = function()
				return E.func_GetName("item", 93724) .. " ("..E.func_GetName("event", 479)..")"
			end,
			showTooltip = true,
			name_save = "DarkmoonFaire",
			defS = true,
			reset = "Daily",
			desc = categoryKey,
			quests = {
				{37911},
				{29438},
				{36481},
				{29463},
				{29436},
				{29434},
				{37910},
				{29455},
				{64783},
			},
		},
		{
			TextLeft = function()
				return E.func_GetName("item", 92441) .. " (Warlock)"
			end,
			showTooltip = true,
			name_save = "GreenFire",
			defS = true,
			reset = "Normal",
			desc = categoryKey,
			quests = {
				{32295},
				{32307},
				{32309},
				{32310},
				{32317},
				{32324},
				{32325},
			},
		},
	}
	----------------------------------------------------------------
	local OctoTables_DataOtrisovka = {}
	OctoTables_DataOtrisovka[categoryKey] = {}
	OctoTables_DataOtrisovka[categoryKey].Currencies = E.FilterByVersion(Currencies)
	OctoTables_DataOtrisovka[categoryKey].Items = E.FilterByVersion(Items)
	OctoTables_DataOtrisovka[categoryKey].UniversalQuests = E.FilterByVersion(UniversalQuests, true)
	----------------------------------------------------------------
	return OctoTables_Vibor, OctoTables_DataOtrisovka
end