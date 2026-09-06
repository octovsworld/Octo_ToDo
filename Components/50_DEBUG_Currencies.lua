local GlobalAddonName, E = ...
local L = E.L
----------------------------------------------------------------
if not E.DEBUG then return end
----------------------------------------------------------------
local categoryKey = 50
----------------------------------------------------------------
E.Components[categoryKey] = function()
	if not Octo_ToDo_DB_Variables.DATACOLLECTION.CURRENCY then return end

	local OctoTables_DataOtrisovka = {}
	local OctoTables_Vibor = {}
	OctoTables_DataOtrisovka[categoryKey] = {}
	OctoTables_Vibor[categoryKey] = {}
	OctoTables_Vibor[categoryKey].defs = false
	OctoTables_Vibor[categoryKey].icon = E.ICON_DEBUG
	OctoTables_Vibor[categoryKey].name = CURRENCY
	OctoTables_Vibor[categoryKey].color = E.COLOR_RED
	----------------------------------------------------------------
	local sorted = {}
	for id = 1, 5000 do
	    local info = E.func_GetCurrencyInfo(id)
	    if info and info.name then
	        tinsert(sorted, id)
	    end
	end
	E.func_SortRecords(sorted, true)

	OctoTables_DataOtrisovka[categoryKey].Currencies = {}
	for i, id in ipairs(sorted) do
	    tinsert(OctoTables_DataOtrisovka[categoryKey].Currencies, {id = id, defS = true})
	end
	----------------------------------------------------------------
	return OctoTables_Vibor, OctoTables_DataOtrisovka
end