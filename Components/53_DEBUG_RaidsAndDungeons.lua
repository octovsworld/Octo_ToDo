local GlobalAddonName, E = ...
local L = E.L
----------------------------------------------------------------
if not E.DEBUG then return end
----------------------------------------------------------------
local categoryKey = 53
----------------------------------------------------------------
E.Components[categoryKey] = function()
	if not Octo_ToDo_DB_Variables.DATACOLLECTION.RAIDSORDUNGEONS then return end

	local OctoTables_DataOtrisovka = {}
	local OctoTables_Vibor = {}
	OctoTables_DataOtrisovka[categoryKey] = {}
	OctoTables_Vibor[categoryKey] = {}
	OctoTables_Vibor[categoryKey].defs = false
	OctoTables_Vibor[categoryKey].icon = E.ICON_DEBUG
	OctoTables_Vibor[categoryKey].name = "RaidsOrDungeons"
	OctoTables_Vibor[categoryKey].color = E.COLOR_RED
	----------------------------------------------------------------
	local uniqueIDs = {}
	for Field, Value in next, (Enum.CalendarEventType) do
		for k, v in ipairs(C_Calendar.EventGetTextures(Value)) do
			local mapId = v.mapId
			if mapId then
				uniqueIDs[mapId] = true
			end
		end
	end
	local sorted = {}
	for id in next,(uniqueIDs) do
		tinsert(sorted, id)
	end
	E.func_SortRecords(sorted, true)

	OctoTables_DataOtrisovka[categoryKey].RaidsOrDungeons = {}
	for i, id in ipairs(sorted) do
		tinsert(OctoTables_DataOtrisovka[categoryKey].RaidsOrDungeons, {id = id, defS = true,})
	end
	----------------------------------------------------------------
	return OctoTables_Vibor, OctoTables_DataOtrisovka
end