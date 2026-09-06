local GlobalAddonName, E = ...
local L = E.L
----------------------------------------------------------------
local enable = true
if not enable then return end
----------------------------------------------------------------
local categoryKey = 96
----------------------------------------------------------------
E.Components[categoryKey] = function()
	if not Octo_ToDo_DB_Variables.DATACOLLECTION.MYTHICPLUS then return end

	local OctoTables_DataOtrisovka = {}
	local OctoTables_Vibor = {}
	OctoTables_DataOtrisovka[categoryKey] = {}
	OctoTables_Vibor[categoryKey] = {}
	OctoTables_Vibor[categoryKey].defs = true
	OctoTables_Vibor[categoryKey].icon = E.ICON_EMPTY
	local fullDifficultyName = true
	OctoTables_Vibor[categoryKey].name = E.func_GetName("difficulty", E.ID_MYTHIC, nil, fullDifficultyName) .. "+"
	OctoTables_Vibor[categoryKey].color = E.COLOR_BLACK
	----------------------------------------------------------------
	OctoTables_DataOtrisovka[categoryKey].AdditionallyTOP = {
		{id = "CurrentKey", defS = true,},
		{id = "GreatVault", defS = true,},
	}

	for i = 1, 3 do
		table.insert(OctoTables_DataOtrisovka[categoryKey].AdditionallyTOP, {id = "GreatVault"..i, defS = false,})
	end
	----------------------------------------------------------------
	return OctoTables_Vibor, OctoTables_DataOtrisovka
end