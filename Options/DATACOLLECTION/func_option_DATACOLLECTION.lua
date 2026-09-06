local GlobalAddonName, E = ...
local L = E.L
function E.func_option_DATACOLLECTION(category, layout)
	----------------------------------------------------------------
	do
		local function func_Clean(DATA)
			if DATA then
				if type(DATA) == "table" then
					wipe(DATA)
				end
			end
		end
		local name = nil
		local buttonText = L["Clear data"]
		local tooltip = L["Deletes collected data for disabled categories across all characters. Frees memory and removes unnecessary information"]
		local function buttonClick()
			Octo_Cache_DB = nil
			E.Init_Octo_Cache_DB()
			E.func_BUILD_DUNG_DB()
			if Octo_ToDo_DB_Variables and Octo_ToDo_DB_Variables.DATACOLLECTION  then
				for GUID, CharInfo in next, (Octo_ToDo_DB_Levels) do
					local pd = CharInfo.PlayerData
					local cm = CharInfo.MASLENGO
					if pd and cm then
						if Octo_ToDo_DB_Variables.DATACOLLECTION.CURRENCY == false then
							func_Clean(cm.Currency)
							func_Clean(cm.GARRISON)
						end
						if Octo_ToDo_DB_Variables.DATACOLLECTION.ITEMS == false then
							-- func_Clean(cm.InventoryType)
							func_Clean(cm.Items.Bags_FULL)
							func_Clean(cm.Items.Bags)
							func_Clean(cm.Items.Bank_FULL)
							func_Clean(cm.Items.Bank)
						end
						if Octo_ToDo_DB_Variables.DATACOLLECTION.RAIDSORDUNGEONS == false then
							func_Clean(cm.journalInstance)
							func_Clean(cm.SavedWorldBoss)
							func_Clean(cm.LFGInstance)
						end
						if Octo_ToDo_DB_Variables.DATACOLLECTION.REPUTATION == false then
							func_Clean(cm.Reputation)
						end
						if Octo_ToDo_DB_Variables.DATACOLLECTION.QUESTS == false then
							func_Clean(cm.ListOfQuests)
							func_Clean(cm.ListOfParagonQuests)
							func_Clean(cm.UniversalQuest)
							func_Clean(cm.Bounties627)
							func_Clean(cm.Bounties875)
							-- func_Clean(cm.OctoTable_QuestID)
						end
						if Octo_ToDo_DB_Variables.DATACOLLECTION.MYTHICPLUS == false then
							func_Clean(cm.GreatVault)
							func_Clean(cm.RunHistory)
							func_Clean(cm.GreatVaultbossDifficulties)
							func_Clean(pd.MythicPlus)
							pd.HasAvailableRewards = false
						end
						if Octo_ToDo_DB_Variables.DATACOLLECTION.PROFESSIONS == false then
							func_Clean(cm.professions)
						end
						-- if Octo_ToDo_DB_Variables.DATACOLLECTION.PVP == false then
						-- end
					end
				end
				E.func_Collect_All()
			end
		end
		E.func_Options_CreateButton(category, name, buttonText, buttonClick, tooltip)
	end
	----------------------------------------------------------------
	-- HEADER ------------------------------------------------------
	----------------------------------------------------------------
	E.func_Header(layout, L["MISCELLANEOUS"])

	----------------------------------------------------------------
	-- CURRENCY ----------------------------------------------------
	----------------------------------------------------------------
	for _, tbl in ipairs(E.Octo_ToDo_DB_Variables_defaultOptions.DATACOLLECTION) do
		local variableKey = tbl.variableKey
		local variableTbl = Octo_ToDo_DB_Variables.DATACOLLECTION
		local name = tbl.name
		local defaultValue = tbl.defaultValue
		local needBlock = false
		local callback = E.func_INIT_Components
		E.func_Options_CreateCheckbox(category, variableKey, variableTbl, name, defaultValue, nil, needBlock, callback)
	end
	----------------------------------------------------------------
	-- HEADER ------------------------------------------------------
	----------------------------------------------------------------
	E.func_Header(layout, L["EXPANSION_FILTER_TEXT"])
	----------------------------------------------------------------
	-- EXPANSIONS --------------------------------------------------
	----------------------------------------------------------------
	do
		local CurrentExpansion = E.func_GetCurrentExpansion()
		for expID = #E.OctoTable_Expansions, 1, -1 do
			local expData = E.OctoTable_Expansions[expID]
			local variableKey = expID
			local variableTbl = Octo_ToDo_DB_Variables.DATACOLLECTION
			local defaultValue = (expID == CurrentExpansion)
			local needBlock = (expID > CurrentExpansion)
			local name
			if needBlock then
				name = E.COLOR_GRAY .. expData.name .. "|r"
			else
				name = expData.color .. expData.name .. "|r"
			end
			local callback = function()
				E.func_INIT_Components()
				C_Timer.After(.1, E.func_Collect_All)
			end
			E.func_Options_CreateCheckbox(category, variableKey, variableTbl, name, defaultValue, nil, needBlock, callback)
		end
	end
	----------------------------------------------------------------
end