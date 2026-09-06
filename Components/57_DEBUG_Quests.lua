local GlobalAddonName, E = ...
local L = E.L
----------------------------------------------------------------
if not E.DEBUG then return end
----------------------------------------------------------------
local categoryKey = 57
----------------------------------------------------------------
E.Components[categoryKey] = function()
	if not Octo_ToDo_DB_Variables.DATACOLLECTION.QUESTS then return end

	local OctoTables_DataOtrisovka = {}
	local OctoTables_Vibor = {}
	OctoTables_DataOtrisovka[categoryKey] = {}
	OctoTables_Vibor[categoryKey] = {}
	OctoTables_Vibor[categoryKey].defs = false
	OctoTables_Vibor[categoryKey].icon = E.ICON_DEBUG
	OctoTables_Vibor[categoryKey].name = L["QUESTS_LABEL"]
	OctoTables_Vibor[categoryKey].color = E.COLOR_RED

	for _, dataType in ipairs(E.dataDisplayOrder) do
		OctoTables_DataOtrisovka[categoryKey][dataType] = {}
	end
	----------------------------------------------------------------
	OctoTables_DataOtrisovka[categoryKey].Quests = {
		{id = 94385, defS = true,}, -- Void Assaults: Eversong Woods
		{id = 94386, defS = true,}, -- Void Assaults: Zul'Aman
	}
	----------------------------------------------------------------
	local TYPE = "quest"
	local sorted = {}
	for id = 93000, 96000 do
		local name = E.func_GetName(TYPE, id)
		local debugTEXT = E.debugInfo and E.debugInfo(id) or ""
		if name ~= E.TEXT_UNKNOWN .. debugTEXT then
			tinsert(sorted, id)
		end
	end

	E.func_SortRecords(sorted, true)
	for i, id in ipairs(sorted) do
		tinsert(OctoTables_DataOtrisovka[categoryKey].Quests, {id = id, defS = true,})
	end
	----------------------------------------------------------------
	return OctoTables_Vibor, OctoTables_DataOtrisovka
end