local GlobalAddonName, E = ...
local L = E.L
----------------------------------------------------------------
local enable = true
if not enable then return end
----------------------------------------------------------------
local categoryKey = 97
----------------------------------------------------------------
E.Components[categoryKey] = function()
	if not Octo_ToDo_DB_Variables.DATACOLLECTION.PVP then return end

	local OctoTables_DataOtrisovka = {}
	local OctoTables_Vibor = {}
	OctoTables_DataOtrisovka[categoryKey] = {}
	OctoTables_Vibor[categoryKey] = {}
	OctoTables_Vibor[categoryKey].defs = false
	OctoTables_Vibor[categoryKey].icon = E.ICON_EMPTY
	OctoTables_Vibor[categoryKey].name = L["PVP"]
	OctoTables_Vibor[categoryKey].color = E.COLOR_BLACK
	----------------------------------------------------------------
	if Octo_ToDo_DB_Variables.DATACOLLECTION.CURRENCY then
		OctoTables_DataOtrisovka[categoryKey].Currencies = {
			{id = 2123, defS = true,}, -- Bloody Tokens
			{id = 1602, defS = true,}, -- Conquest
			{id = 1792, defS = true,}, -- Honor
			{id = 391, defS = false,}, -- Tol Barad Commendation
			{id = 2797, defS = false,}, -- Trophy of Strife
		}
	end
	----------------------------------------------------------------
	if Octo_ToDo_DB_Variables.DATACOLLECTION.ITEMS then
		OctoTables_DataOtrisovka[categoryKey].Items = {
			{id = 219934, defS = true,}, -- Sparks of War
			{id = 137642, defS = true,}, -- Mark of Honor
			{id = 253307, defS = true,}, -- Vicious Bloodstone
			{id = 215236, defS = false,}, -- Vicious Bloodstone
		}
	end
	----------------------------------------------------------------
	if Octo_ToDo_DB_Variables.DATACOLLECTION.QUESTS then
		OctoTables_DataOtrisovka[categoryKey].UniversalQuests = {
			----------------------------------------------------------------
			-- Slayer's Duellum --------------------------------------------
			----------------------------------------------------------------
			{
				sorted = true,
				showTooltip = true,
				TextLeft = function()
					return E.func_GetName("reputation", 2770)..": "..E.func_GetName("quest", 89354)
				end,
				name_save = "PreparingforBattle",
				defS = false,
				reset = "Weekly",
				desc = categoryKey,
				quests = {
					{89354},
				},
				rewards = {
					{rewID = 1792, rewTYPE = "currency", rewSIZE = 500,}, -- Honor
					{rewID = 2123, rewTYPE = "currency", rewSIZE = 150,}, -- Bloody Tokens
					{rewID = 3410, rewTYPE = "currency", rewSIZE = 1000,}, -- Slayer's Duellum
				},
				forcedMaxQuest = 1,
			},
			----------------------------------------------------------------
			{
				sorted = true,
				showTooltip = true,
				TextLeft = function()
					return E.func_GetName("item", 219934)
				end,
				name_save = "SparksofWar",
				defS = true,
				reset = "Weekly",
				desc = categoryKey,
				quests = {
					{93423}, -- Sparks of War: Eversong Woods
					{93424}, -- Sparks of War: Zul'Aman
					{93425}, -- Sparks of War: Harandar
					{93426}, -- Sparks of War: Voidstorm
				},
				rewards = {
					{rewID = 232875, rewTYPE = "item", rewSIZE = 1 }, -- Spark of Radiance
					{rewID = 2123, rewTYPE = "currency", rewSIZE = 1000,}, -- Bloody Tokens
					{rewID = 1792, rewTYPE = "currency", rewSIZE = 500,}, -- Honor
					{rewID = 1602, rewTYPE = "currency", rewSIZE = 50,}, -- Conquest
					{rewID = 3365, rewTYPE = "currency", rewSIZE = 250,}, -- Silvermoon Court
				},
				forcedMaxQuest = 1,
			},
			----------------------------------------------------------------
			{
				sorted = true,
				showTooltip = true,
				TextLeft = function()
					return E.func_GetName("quest", 93865)
				end,
				name_save = "CarveYourWay",
				defS = true,
				reset = "Daily",
				desc = categoryKey,
				quests = {
					{93865},
				},
				rewards = {
					{rewID = 2123, rewTYPE = "currency", rewSIZE = 50,}, -- Bloody Tokens
					{rewID = 1792, rewTYPE = "currency", rewSIZE = 50,}, -- Honor
					{rewID = 3410, rewTYPE = "currency", rewSIZE = 100,}, -- Slayer's Duellum
				},
				forcedMaxQuest = 1,
			},
		}
	end
	----------------------------------------------------------------
	return OctoTables_Vibor, OctoTables_DataOtrisovka
end