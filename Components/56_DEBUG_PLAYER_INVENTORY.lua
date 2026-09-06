local GlobalAddonName, E = ...
local L = E.L
----------------------------------------------------------------
if not E.DEBUG then return end
----------------------------------------------------------------
local categoryKey = 56
----------------------------------------------------------------
E.Components[categoryKey] = function()
	if not Octo_ToDo_DB_Variables.DATACOLLECTION.ITEMS then return end

	local OctoTables_DataOtrisovka = {}
	local OctoTables_Vibor = {}
	OctoTables_DataOtrisovka[categoryKey] = {}
	OctoTables_Vibor[categoryKey] = {}
	OctoTables_Vibor[categoryKey].defs = false
	OctoTables_Vibor[categoryKey].icon = E.ICON_DEBUG
	OctoTables_Vibor[categoryKey].name = "PLAYER_INVENTORY"
	OctoTables_Vibor[categoryKey].color = E.COLOR_RED
	----------------------------------------------------------------
	if Octo_ToDo_DB_Variables.DATACOLLECTION.ITEMS then
		OctoTables_DataOtrisovka[categoryKey].AdditionallyTOP = {
			{id = "PlayerInventory", defS = true,},
			{id = "PlayerBANK", defS = true,},
		}
	end
	----------------------------------------------------------------
	return OctoTables_Vibor, OctoTables_DataOtrisovka
end