local GlobalAddonName, E = ...

----------------------------------------------------------------
-- Вспомогательные функции для обработки квестов
----------------------------------------------------------------
local DEBUG = false  -- включить/выключить отладку

local DEBUG_TEXT = E.func_Gradient(GlobalAddonName)

local function DebugPrint(...)
	if DEBUG then
		print (DEBUG_TEXT, ...)
	end
end

local function func_SetQuestProgress(questDataTable, completedCount, totalCount)
	if totalCount == 0 then
		questDataTable.TextCenter = nil
	elseif completedCount >= totalCount then
		questDataTable.TextCenter = true
	elseif completedCount > 0 then
		questDataTable.TextCenter = completedCount .. "/" .. totalCount
	else
		questDataTable.TextCenter = nil
	end
end

local function func_ProcessQuestEntry(questData, questDataTable)
	if type(questData[1]) == "number" then
		local questID = questData[1]
		local FactionOrClass = questData.FactionOrClass
		local prof = questData.prof
		local skipThisQuest = false
		if prof then
			if not (E.pd.professions and E.pd.professions[prof]) then
				skipThisQuest = true
			end
		end
		if not skipThisQuest then
			if not FactionOrClass or (FactionOrClass[E.pd.FACTION] or FactionOrClass[E.pd.classFilename]) then
				local isCompleted = E.func_IsQuestFlaggedCompleted(questID)
				local status = E.func_GetQuestStatus(questID, true)
				questDataTable[questID] = status
				return isCompleted
			end
		end
	end
	return nil
end

----------------------------------------------------------------
-- Карта для сбора квестов на карте
----------------------------------------------------------------
local mapTable = {
	[E.MapID_ZerethMortis] = {
		65265, 64977, 65445, 65362, 65269, 65256, 65326, 64785, 65244, 65411,
		65252, 65268, 65089, 65416, 65262, 65255, 65115,
	},
	[E.MapID_Korthia] = {
		63959, 63783, 64432, 63780, 64070, 63935, 64240, 64040, 63776, 63775,
		64271, 63934, 63781, 63793, 63964, 63794, 63790, 63792, 63963, 63791,
		63789, 63788, 63787, 63785, 64103, 64101, 64089, 64430, 64065, 63989,
		64016, 64017, 63936, 63784, 63777, 63954, 63955, 63956, 63961,
	},
}

----------------------------------------------------------------
-- Асинхронный сбор обычных квестов
----------------------------------------------------------------
local QUEST_BATCH_SIZE = 10
local collectQuestsState = nil

local function CollectQuests_OnTick()
	local state = collectQuestsState
	if not state then return end

	local processed = 0

	if state.phase == 1 then
		local questID = next(E.OctoTable_QuestID, state.currentKey)
		while questID and processed < QUEST_BATCH_SIZE do
			if E.func_IsQuestFlaggedCompleted(questID) then
				E.cm.OctoTable_QuestID[questID] = true
			end
			state.currentKey = questID
			questID = next(E.OctoTable_QuestID, questID)
			state.processedCount = state.processedCount + 1
			processed = processed + 1
		end
		if questID == nil then
			state.phase = 2
			state.currentIndex = 0
			state.numShownEntries = E.func_GetNumQuestLogEntries()
			state.numQuests = 0
			DebugPrint("Этап 1 завершён, переход к этапу 2")
		end
		return
	end

	if state.phase == 2 then
		while state.currentIndex < state.numShownEntries and processed < QUEST_BATCH_SIZE do
			state.currentIndex = state.currentIndex + 1
			local i = state.currentIndex
			local info = E.func_GetInfo(i)
			local questID = info and info.questID or 0
			if info and info.frequency and questID ~= 0 and not info.isHeader and not info.isHidden then
				state.numQuests = state.numQuests + 1
				E.cm.ListOfQuests[questID] = E.func_GetQuestStatus(questID)
			end
			state.processedCount = state.processedCount + 1
			processed = processed + 1
		end
		if state.currentIndex >= state.numShownEntries then
			state.phase = 3
			state.currentKey = nil
			state.numQuests_Paragon = 0
			DebugPrint("Этап 2 завершён, переход к этапу 3")
		end
		return
	end

	if state.phase == 3 then
		local questID = next(E.OctoTable_Reputations_Paragon_Data, state.currentKey)
		while questID and processed < QUEST_BATCH_SIZE do
			if E.func_IsOnQuest(questID) then
				state.numQuests_Paragon = state.numQuests_Paragon + 1
				E.cm.ListOfParagonQuests[questID] = true
			end
			state.currentKey = questID
			questID = next(E.OctoTable_Reputations_Paragon_Data, questID)
			state.processedCount = state.processedCount + 1
			processed = processed + 1
		end
		if questID == nil then
			DebugPrint("Сбор обычных квестов завершён, обработано:", state.processedCount)
			E.pd.numQuests = E.func_Save(state.numQuests)
			E.pd.numShownEntries = E.func_Save(state.numShownEntries)
			E.pd.maxNumQuestsCanAccept = E.func_Save(E.func_GetMaxNumQuestsCanAccept())
			E.pd.numQuests_Paragon = E.func_Save(state.numQuests_Paragon)
			if E.func_SafeUpdate_AbandonButton then
				E.func_SafeUpdate_AbandonButton()
			end
			collectQuestsState = nil
			if state.ticker then
				state.ticker:Cancel()
			end
		end
	end
end

local function StartCollectQuestsAsync()
	if collectQuestsState then return end

	E.cm.ListOfQuests = {}
	E.cm.ListOfParagonQuests = {}
	E.cm.OctoTable_QuestID = {}

	collectQuestsState = {
		phase = 1,
		currentKey = nil,
		currentIndex = 0,
		numShownEntries = 0,
		numQuests = 0,
		numQuests_Paragon = 0,
		processedCount = 0,
	}
	collectQuestsState.ticker = C_Timer.NewTicker(0, CollectQuests_OnTick)
	DebugPrint("Начат сбор обычных квестов")
end

----------------------------------------------------------------
-- Асинхронный сбор универсальных квестов
----------------------------------------------------------------
local UNIVERSAL_BATCH_SIZE = 10
local collectUniversalState = nil

local function CollectUniversal_OnTick()
	local state = collectUniversalState
	if not state then return end

	local processed = 0
	local key = state.currentKey
	local totalUniversal = state.totalUniversal

	while key ~= nil and processed < UNIVERSAL_BATCH_SIZE do
		local data = E.ALL_UniversalQuests[key]
		state.currentKey = next(E.ALL_UniversalQuests, key)
		key = state.currentKey

		local questKey = data.questKey
		local questDataTable = {}

		if questKey then
			if data.questpools and #data.questpools > 0 then
				local totalPools = #data.questpools
				local completedPools = 0
				for _, pool in ipairs(data.questpools) do
					local poolCompleted = false
					for _, questData in ipairs(pool) do
						local done = func_ProcessQuestEntry(questData, questDataTable)
						if done ~= nil and done then
							poolCompleted = true
						end
					end
					if poolCompleted then
						completedPools = completedPools + 1
					end
				end
				func_SetQuestProgress(questDataTable, completedPools, totalPools)
			elseif data.quests then
				local forcedMaxQuest = data.forcedMaxQuest
				local count = 0
				local totalQUEST = 0
				local hasSingleQuestOutput = false
				for _, questData in ipairs(data.quests) do
					local done = func_ProcessQuestEntry(questData, questDataTable)
					if done ~= nil then
						totalQUEST = totalQUEST + 1
						if done then count = count + 1 end
						if (forcedMaxQuest == 1 or #data.quests == 1) and E.func_IsOnQuest(questData[1]) then
							questDataTable.TextCenter = questDataTable[questData[1]]
							hasSingleQuestOutput = true
						end
					end
				end
				if not hasSingleQuestOutput then
					local maxToShow = forcedMaxQuest ~= nil and forcedMaxQuest or totalQUEST
					func_SetQuestProgress(questDataTable, count, maxToShow)
				end
			end

			if data.isAccount then
				state.tempUniversalAccount[questKey] = questDataTable
			else
				state.tempUniversalChar[questKey] = questDataTable
			end
		end

		state.processedCount = state.processedCount + 1
		processed = processed + 1
	end

	-- Выводим прогресс каждые 10 записей или при завершении
	if state.processedCount % 10 == 0 or key == nil then
		DebugPrint(string.format("Универсальные квесты: %d/%d обработано", state.processedCount, totalUniversal))
	end

	if key == nil then
		DebugPrint("Сбор универсальных квестов завершён, обработано:", state.processedCount)
		for GUID, CharInfo in pairs(Octo_ToDo_DB_Levels) do
			local pd = CharInfo.PlayerData
			local cm = CharInfo.MASLENGO
			if pd and cm then
				if cm.UniversalQuest == nil then
					cm.UniversalQuest = {}
				end
				if GUID == E.curGUID then
					for questKey, v in pairs(state.tempUniversalChar) do
						cm.UniversalQuest[questKey] = v
					end
				end
				if E.func_IsSameAccount(pd) then
					for questKey, v in pairs(state.tempUniversalAccount) do
						cm.UniversalQuest[questKey] = v
					end
				end
			end
		end
		collectUniversalState = nil
		if state.ticker then
			state.ticker:Cancel()
		end
	end
end

local function StartCollectUniversalAsync()
	if collectUniversalState then return end

	local firstKey = next(E.ALL_UniversalQuests)
	if firstKey == nil then
		DebugPrint("E.ALL_UniversalQuests пуста!")
		return
	end

	local totalUniversal = 0
	for _ in pairs(E.ALL_UniversalQuests) do
		totalUniversal = totalUniversal + 1
	end

	collectUniversalState = {
		currentKey = firstKey,
		tempUniversalChar = {},
		tempUniversalAccount = {},
		processedCount = 0,
		totalUniversal = totalUniversal,
	}
	collectUniversalState.ticker = C_Timer.NewTicker(0, CollectUniversal_OnTick)
	DebugPrint("Начат сбор универсальных квестов, всего записей:", totalUniversal)
end

----------------------------------------------------------------
-- Синхронный сбор квестов на карте
----------------------------------------------------------------
local function Collect_QuestsOnMap()
	Octo_Cache_DB.QuestsOnMap = Octo_Cache_DB.QuestsOnMap or {}
	for uiMapID, staticQuests in next, (mapTable) do
		Octo_Cache_DB.QuestsOnMap[uiMapID] = Octo_Cache_DB.QuestsOnMap[uiMapID] or {}
		local saved = Octo_Cache_DB.QuestsOnMap[uiMapID]
		local exists = {}
		for i = 1, #saved do
			local qID = saved[i] and saved[i][1]
			if qID then
				exists[qID] = true
			end
		end
		for i = 1, #staticQuests do
			local qID = staticQuests[i]
			if not exists[qID] then
				exists[qID] = true
				saved[#saved + 1] = { qID }
			end
		end
		local info = E.func_GetQuestsOnMap_INFO(uiMapID)
		if #info > 0 then
			for i = 1, #info do
				local quest = info[i]
				local questID = quest.questID
				if not exists[questID] then
					local timestamp = E.func_GetQuestTimeLeftSeconds(questID)
					exists[questID] = true
					saved[#saved + 1] = {
						questID,
						addText = {timestamp = timestamp,},
					}
				end
			end
		end
	end
end

----------------------------------------------------------------
-- Публичные обёртки
----------------------------------------------------------------
function E.Collect_Quests()
	E.func_SpamBlock(StartCollectQuestsAsync, true)
	E.func_SpamBlock(StartCollectUniversalAsync, true)
end

function E.Collect_QuestsOnMap()
	E.func_SpamBlock(Collect_QuestsOnMap, true)
end