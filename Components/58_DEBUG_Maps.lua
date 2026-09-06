local GlobalAddonName, E = ...
local L = E.L
----------------------------------------------------------------
if not E.DEBUG then return end
----------------------------------------------------------------
local categoryKey = 58
----------------------------------------------------------------
E.Components[categoryKey] = function()
	if not Octo_ToDo_DB_Variables.DATACOLLECTION.QUESTS then return end

	local OctoTables_DataOtrisovka = {}
	local OctoTables_Vibor = {}
	OctoTables_DataOtrisovka[categoryKey] = {}
	OctoTables_Vibor[categoryKey] = {}
	OctoTables_Vibor[categoryKey].defs = false
	OctoTables_Vibor[categoryKey].icon = E.ICON_DEBUG
	OctoTables_Vibor[categoryKey].name = "maps"
	OctoTables_Vibor[categoryKey].color = E.COLOR_RED
	----------------------------------------------------------------
	OctoTables_DataOtrisovka[categoryKey].Maps = {}
	----------------------------------------------------------------
	for id = 2649, 1, -1 do
		local name = E.func_GetName("map", id)
		local debugTEXT = E.debugInfo and E.debugInfo(id) or ""
		if name ~= E.TEXT_UNKNOWN .. debugTEXT then
			table.insert(OctoTables_DataOtrisovka[categoryKey].Maps, {id = id, defS = true,})
		end
	end
	----------------------------------------------------------------
	return OctoTables_Vibor, OctoTables_DataOtrisovka
end