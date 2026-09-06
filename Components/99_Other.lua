local GlobalAddonName, E = ...
local L = E.L
----------------------------------------------------------------
local enable = true
if not enable then return end
----------------------------------------------------------------
local categoryKey = 99
----------------------------------------------------------------
E.Components[categoryKey] = function()
	local OctoTables_DataOtrisovka = {}
	local OctoTables_Vibor = {}
	OctoTables_DataOtrisovka[categoryKey] = {}
	OctoTables_Vibor[categoryKey] = {}
	OctoTables_Vibor[categoryKey].defs = true
	OctoTables_Vibor[categoryKey].icon = E.ICON_EMPTY
	OctoTables_Vibor[categoryKey].name = L["OTHER"]
	OctoTables_Vibor[categoryKey].color = E.COLOR_BLACK
	----------------------------------------------------------------
	if Octo_ToDo_DB_Variables.DATACOLLECTION.CURRENCY then
		OctoTables_DataOtrisovka[categoryKey].Currencies = {
			{id = 1166, defS = false,},
			{id = 2032, defS = false,},
			{id = 1191, defS = false,},
		}
	end
	----------------------------------------------------------------
	OctoTables_DataOtrisovka[categoryKey].AdditionallyBOTTOM = {}

	if Octo_ToDo_DB_Variables.DATACOLLECTION.RAIDSORDUNGEONS then
		table.insert(OctoTables_DataOtrisovka[categoryKey].AdditionallyBOTTOM, {id = "MythicZero", defS = false,})
		table.insert(OctoTables_DataOtrisovka[categoryKey].AdditionallyBOTTOM, {id = "LFGInstance", defS = true,})
	end

	if Octo_ToDo_DB_Variables.DATACOLLECTION.QUESTS then
		table.insert(OctoTables_DataOtrisovka[categoryKey].AdditionallyBOTTOM, {id = "ListOfQuests", defS = false,})
	end

	if Octo_ToDo_DB_Variables.DATACOLLECTION.ITEMS then
		table.insert(OctoTables_DataOtrisovka[categoryKey].AdditionallyBOTTOM, {id = "AllItems", defS = false,})
		table.insert(OctoTables_DataOtrisovka[categoryKey].AdditionallyBOTTOM, {id = "ItemLevel", defS = true,})
	end

	if Octo_ToDo_DB_Variables.DATACOLLECTION.PROFESSIONS then
		table.insert(OctoTables_DataOtrisovka[categoryKey].AdditionallyBOTTOM, {id = "Professions", defS = false,})
	end

	table.insert(OctoTables_DataOtrisovka[categoryKey].AdditionallyBOTTOM, {id = "Money", defS = true,})
	table.insert(OctoTables_DataOtrisovka[categoryKey].AdditionallyBOTTOM, {id = "LastOnline", defS = true,})
	----------------------------------------------------------------
	return OctoTables_Vibor, OctoTables_DataOtrisovka
end