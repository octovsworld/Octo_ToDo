local GlobalAddonName, E = ...
local L = E.L
----------------------------------------------------------------
local enable = true
if not enable then return end
----------------------------------------------------------------
local categoryKey = 96
----------------------------------------------------------------
E.Components[categoryKey] = function()
	local OctoTables_DataOtrisovka = {}
	local OctoTables_Vibor = {}
	OctoTables_DataOtrisovka[categoryKey] = {}
	OctoTables_Vibor[categoryKey] = {}
	OctoTables_Vibor[categoryKey].defs = true
	OctoTables_Vibor[categoryKey].icon = E.ICON_EMPTY
	local fullDifficultyName = true
	OctoTables_Vibor[categoryKey].name = E.func_GetName("difficulty", E.ID_MYTHIC, nil, fullDifficultyName) .. "+"
	-- OctoTables_Vibor[categoryKey].name = L["WEEKLY_REWARDS_MYTHIC_KEYSTONE"] -- "MPLUS"
	OctoTables_Vibor[categoryKey].color = E.COLOR_BLACK
	----------------------------------------------------------------
	OctoTables_DataOtrisovka[categoryKey].Currencies = {
	}
	----------------------------------------------------------------
	OctoTables_DataOtrisovka[categoryKey].Items = {
	}
	----------------------------------------------------------------
	OctoTables_DataOtrisovka[categoryKey].RaidsOrDungeons = {
	}
	----------------------------------------------------------------
	OctoTables_DataOtrisovka[categoryKey].Reputations = {
	}
	----------------------------------------------------------------
	OctoTables_DataOtrisovka[categoryKey].UniversalQuests = {
	}
	----------------------------------------------------------------
	OctoTables_DataOtrisovka[categoryKey].AdditionallyTOP = {
		{id = "CurrentKey", defS = true,},
		{id = "GreatVault", defS = true,},
	}
	----------------------------------------------------------------
	OctoTables_DataOtrisovka[categoryKey].AdditionallyBOTTOM = {
	}

	for i = 1, 3 do -- for i = 1, #E.Enum_Activities_table do
		table.insert(OctoTables_DataOtrisovka[categoryKey].AdditionallyTOP, {id = "GreatVault"..i, defS = false,})
	end
	----------------------------------------------------------------
	return OctoTables_Vibor, OctoTables_DataOtrisovka
end