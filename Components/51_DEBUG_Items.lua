local GlobalAddonName, E = ...
local L = E.L
----------------------------------------------------------------
if not E.DEBUG then return end
----------------------------------------------------------------
local categoryKey = 51
----------------------------------------------------------------
E.Components[categoryKey] = function()
	if not Octo_ToDo_DB_Variables.DATACOLLECTION.ITEMS then return end

	local OctoTables_DataOtrisovka = {}
	local OctoTables_Vibor = {}
	OctoTables_DataOtrisovka[categoryKey] = {}
	OctoTables_Vibor[categoryKey] = {}
	OctoTables_Vibor[categoryKey].defs = false
	OctoTables_Vibor[categoryKey].icon = E.ICON_DEBUG
	OctoTables_Vibor[categoryKey].name = L["ITEMS"]
	OctoTables_Vibor[categoryKey].color = E.COLOR_RED
	----------------------------------------------------------------
	local testTBL = {}
	for id in next, (E.KeyStoneTBL) do
		testTBL[id] = true
	end
	for id in next, (E.OctoTable_itemID_MECHAGON) do
		testTBL[id] = true
	end
	for id in next, (E.OctoTable_itemID_ALL) do
		testTBL[id] = true
	end

	local sorted = {}
	for id in next, (testTBL) do
		table.insert(sorted, id)
	end

	E.func_SortRecords(sorted, true)

	OctoTables_DataOtrisovka[categoryKey].Items = {}
	for i, id in ipairs(sorted) do
		table.insert(OctoTables_DataOtrisovka[categoryKey].Items, {id = id, defS = true,})
	end
	----------------------------------------------------------------
	return OctoTables_Vibor, OctoTables_DataOtrisovka
end