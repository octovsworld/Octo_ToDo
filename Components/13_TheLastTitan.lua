local GlobalAddonName, E = ...
----------------------------------------------------------------
local enable = false
if not enable then return end
----------------------------------------------------------------
if not E.Is_TLT_available then return end;
----------------------------------------------------------------
local L = E.L
----------------------------------------------------------------
local categoryKey = 13
----------------------------------------------------------------
E.Components[categoryKey] = function()
	if not Octo_ToDo_DB_Variables.DATACOLLECTION[categoryKey] then return end

	local OctoTables_DataOtrisovka = {}
	local OctoTables_Vibor = {}
	OctoTables_DataOtrisovka[categoryKey] = {}
	OctoTables_Vibor[categoryKey] = {}
	OctoTables_Vibor[categoryKey].defs = false
	OctoTables_Vibor[categoryKey].icon = E.OctoTable_Expansions[categoryKey].icon
	OctoTables_Vibor[categoryKey].name = E.OctoTable_Expansions[categoryKey].color..E.OctoTable_Expansions[categoryKey].nameBlizzard
	OctoTables_Vibor[categoryKey].color = E.OctoTable_Expansions[categoryKey] and E.OctoTable_Expansions[categoryKey].color or E.COLOR_BLACK
	----------------------------------------------------------------
	if Octo_ToDo_DB_Variables.DATACOLLECTION.CURRENCY then
		OctoTables_DataOtrisovka[categoryKey].Currencies = E.FilterByVersion({
		})
	end
	----------------------------------------------------------------
	if Octo_ToDo_DB_Variables.DATACOLLECTION.ITEMS then
		OctoTables_DataOtrisovka[categoryKey].Items = E.FilterByVersion({
		})
	end
	----------------------------------------------------------------
	if Octo_ToDo_DB_Variables.DATACOLLECTION.RAIDSORDUNGEONS then
		OctoTables_DataOtrisovka[categoryKey].RaidsOrDungeons = E.FilterByVersion({
		})
	end
	----------------------------------------------------------------
	if Octo_ToDo_DB_Variables.DATACOLLECTION.REPUTATION then
		OctoTables_DataOtrisovka[categoryKey].Reputations = E.FilterByVersion({
		})
	end
	----------------------------------------------------------------
	if Octo_ToDo_DB_Variables.DATACOLLECTION.QUESTS then
		OctoTables_DataOtrisovka[categoryKey].UniversalQuests = E.FilterByVersion({
		})
	end
	----------------------------------------------------------------
	OctoTables_DataOtrisovka[categoryKey].AdditionallyTOP = {
	}
	----------------------------------------------------------------
	OctoTables_DataOtrisovka[categoryKey].AdditionallyBOTTOM = {
	}
	----------------------------------------------------------------
	return OctoTables_Vibor, OctoTables_DataOtrisovka
end