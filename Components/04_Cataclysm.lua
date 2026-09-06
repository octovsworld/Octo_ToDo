local GlobalAddonName, E = ...
----------------------------------------------------------------
local enable = true
if not enable then return end
----------------------------------------------------------------
if not E.Is_Cata_available then return end
----------------------------------------------------------------
local L = E.L
----------------------------------------------------------------
local categoryKey = 4
----------------------------------------------------------------
E.Components[categoryKey] = function()
	if not Octo_ToDo_DB_Variables.DATACOLLECTION[categoryKey] then return end

	local OctoTables_DataOtrisovka = {}
	local OctoTables_Vibor = {}
	OctoTables_DataOtrisovka[categoryKey] = {}
	OctoTables_Vibor[categoryKey] = {}
	OctoTables_Vibor[categoryKey].defs = false
	OctoTables_Vibor[categoryKey].icon = E.OctoTable_Expansions[categoryKey].icon
	OctoTables_Vibor[categoryKey].name = E.OctoTable_Expansions[categoryKey].color..E.OctoTable_Expansions[categoryKey].nameBlizzard
	OctoTables_Vibor[categoryKey].color = E.OctoTable_Expansions[categoryKey] and E.OctoTable_Expansions[categoryKey].color or E.COLOR_BLACK
	----------------------------------------------------------------
	if Octo_ToDo_DB_Variables.DATACOLLECTION.CURRENCY then
		OctoTables_DataOtrisovka[categoryKey].Currencies = E.FilterByVersion({
			{id = 361, defS = true,},
			{id = 416, defS = true,}, -- Mark of the World Tree
			{id = 614, defS = true,},
			{id = 615, defS = true,},
			-- {id = 391, defS = true,}, -- Tol Barad Commendation
		})
	end
	----------------------------------------------------------------
	if Octo_ToDo_DB_Variables.DATACOLLECTION.RAIDSORDUNGEONS then
		OctoTables_DataOtrisovka[categoryKey].RaidsOrDungeons = E.FilterByVersion({
			-- Raid
			{id = 967, defS = true,}, -- Dragon Soul
			{id = 720, defS = true,}, -- Firelands
			{id = 754, defS = true,}, -- Throne of the Four Winds
			{id = 671, defS = true,}, -- The Bastion of Twilight
			{id = 669, defS = true,}, -- Blackwing Descent
			{id = 757, defS = true,}, -- Baradin Hold
			-- Dungeon
			-- {id = 938, defS = true,}, -- End Time
			-- {id = 33, defS = true,}, -- Shadowfang Keep
			-- {id = 657, defS = true,}, -- The Vortex Pinnacle
			-- {id = 644, defS = true,}, -- Halls of Origination
			-- {id = 755, defS = true,}, -- Lost City of the Tol'vir
			-- {id = 725, defS = true,}, -- The Stonecore
			-- {id = 939, defS = true,}, -- Well of Eternity
			-- {id = 568, defS = true,}, -- Zul'Aman
			-- {id = 36, defS = true,}, -- Deadmines
			-- {id = 645, defS = true,}, -- Blackrock Caverns
			-- {id = 643, defS = true,}, -- Throne of the Tides
			-- {id = 859, defS = true,}, -- Zul'Gurub
			-- {id = 670, defS = true,}, -- Grim Batol
			-- {id = 940, defS = true,}, -- Hour of Twilight
		})
	end
	----------------------------------------------------------------
	if Octo_ToDo_DB_Variables.DATACOLLECTION.REPUTATION then
		OctoTables_DataOtrisovka[categoryKey].Reputations = E.FilterByVersion({
			{id = 1204, defS = true,}, --name = "Хиджальские мстители", side = "-", category = "Cataclysm", }, --[faction=1204]
			{id = 1173, defS = true,}, --name = "Рамкахены", side = "-", category = "Cataclysm", }, --[faction=1173]
			{id = 1171, defS = true,}, --name = "Теразан", side = "-", category = "Cataclysm", }, --[faction=1171]
			{id = 1158, defS = true,}, --name = "Стражи Хиджала", side = "-", category = "Cataclysm", }, --[faction=1158]
			{id = 1135, defS = true,}, --name = "Служители Земли", side = "-", category = "Cataclysm", }, --[faction=1135]
			----------------------------------------------------------------
			{id = 1178, defS = false,}, --name = "Батальон Адского Крика", side = "Horde", category = "Cataclysm", }, --[faction=1178]
			{id = 1172, defS = false,}, --name = "Клан Драконьей Пасти", side = "Horde", category = "Cataclysm", }, --[faction=1172]
			----------------------------------------------------------------
			{id = 1177, defS = false,}, --name = "Защитники Тол Барада", side = "Alliance", category = "Cataclysm", }, --[faction=1177]
			{id = 1174, defS = false,}, --name = "Клан Громового Молота", side = "Alliance", category = "Cataclysm", }, --[faction=1174]
		})
	end
	----------------------------------------------------------------
	return OctoTables_Vibor, OctoTables_DataOtrisovka
end