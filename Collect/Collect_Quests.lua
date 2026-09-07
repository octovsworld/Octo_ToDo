local GlobalAddonName, E = ...
local LibThingsLoad = LibStub("LibThingsLoad-1.0")
----------------------------------------------------------------
-- Настройки
----------------------------------------------------------------
local DEBUG_TEXT = E.func_Gradient(GlobalAddonName)
local collectQuestsState = nil
local collectUniversalState = nil
local canLoadQuests = LibThingsLoad and LibThingsLoad.QuestsByKey and true or false
E.failedQUESTS = {}
local mapTable = {
	-- SHADOWLANDS
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
	-- MIDNIGHT
	-- [E.MapID_TheCoiledIsle] = {
	-- },
}
----------------------------------------------------------------
-- Функции
----------------------------------------------------------------
local function DebugPrint(...)
	if E.DEBUG_QUESTS then
		print(DEBUG_TEXT, ...)
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
			if not FactionOrClass
			or (FactionOrClass[E.pd.FACTION] or FactionOrClass[E.pd.classFilename])
			then
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
-- Асинхронный сбор обычных квестов
----------------------------------------------------------------
local function ProcessQuestsFromJournal()
	if not collectQuestsState then
		return
	end
	local state = collectQuestsState
	if state.phase ~= 2 or state.waiting then
		return
	end
	local startIdx = state.currentIndex + 1
	local endIdx = math.min(
		state.currentIndex + E.QUEST_BATCH_SIZE,
		state.numShownEntries
	)
	state.currentIndex = endIdx
	local batch = {}
	local totalProcessed = endIdx - startIdx + 1
	for i = startIdx, endIdx do
		local info = E.func_GetInfo(i)
		local questID = info and info.questID or 0
		if info and info.frequency and questID ~= 0 and not info.isHeader and not info.isHidden then
			batch[#batch + 1] = {
				index = i,
				questID = questID,
			}
		end
	end
	if totalProcessed == 0 then
		state.phase = 3
		state.currentKey = nil
		state.numQuests_Paragon = 0
		DebugPrint("Этап 2 завершён, переход к этапу 3")
		return
	end
	if canLoadQuests and #batch > 0 then
		local idsToLoad = {}
		for _, entry in ipairs(batch) do
			idsToLoad[entry.questID] = true
		end
		state.waiting = true
		LibThingsLoad:QuestsByKey(idsToLoad):Then(function()
				-- Если старый сбор уже был заменён новым,
				-- этот callback больше ничего не должен менять.
				if collectQuestsState ~= state then
					return
				end
				for _, entry in ipairs(batch) do
					state.numQuests = state.numQuests + 1
					E.cm.ListOfQuests[entry.questID] = E.func_GetQuestStatus(entry.questID)
				end
				state.processedCount = state.processedCount + totalProcessed
				state.waiting = false
		end)
	else
		for _, entry in ipairs(batch) do
			state.numQuests = state.numQuests + 1
			E.cm.ListOfQuests[entry.questID] = E.func_GetQuestStatus(entry.questID)
		end
		state.processedCount = state.processedCount + totalProcessed
	end
end
local function CollectQuests_OnTick()
	local state = collectQuestsState
	if not state or state.waiting then
		return
	end
	if state.phase == 1 then
		local questID = next(E.OctoTable_QuestID, state.currentKey)
		local processed = 0
		while questID and processed < E.QUEST_BATCH_SIZE do
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
	elseif state.phase == 2 then
		ProcessQuestsFromJournal()
	elseif state.phase == 3 then
		local questID =
		next(E.OctoTable_Reputations_Paragon_Data, state.currentKey)
		local processed = 0
		while questID and processed < E.QUEST_BATCH_SIZE do
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
	if collectQuestsState then
		return
	end
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
		waiting = false,
	}
	collectQuestsState.ticker = C_Timer.NewTicker(0, CollectQuests_OnTick)
	DebugPrint("Начат сбор обычных квестов")
end
----------------------------------------------------------------
-- Универсальные квесты
--
-- ВАЖНО:
--
-- E.ALL_UniversalQuests может изменяться во время сбора.
-- Поэтому здесь НЕЛЬЗЯ использовать next() по самой
-- E.ALL_UniversalQuests между тиками.
--
-- При старте создаётся snapshot.
-- Текущий сбор работает ТОЛЬКО со snapshot.
--
-- Это гарантирует:
--
-- 1. удаление элементов из E.ALL_UniversalQuests
--    не сбросит итерацию;
--
-- 2. очистка E.ALL_UniversalQuests не остановит
--    текущий сбор;
--
-- 3. добавление новых элементов не создаст
--    повторный проход;
--
-- 4. currentIndex всегда только увеличивается;
--
-- 5. текущий сбор всегда сможет завершиться.
----------------------------------------------------------------
local function BuildUniversalSnapshot()
	local snapshot = {}
	for questKey, data in pairs(E.ALL_UniversalQuests) do
		-- Сохраняем сам объект data.
		--
		-- Даже если questKey потом будет удалён из
		-- E.ALL_UniversalQuests, ссылка на data останется
		-- доступной текущему сбору.
		--
		-- В текущем коде data используется только для чтения.
		-- Вложенные таблицы намеренно не копируются:
		-- это позволяет не создавать лишнюю глубокую копию
		-- потенциально больших структур.
		snapshot[#snapshot + 1] = {
			questKey = questKey,
			data = data,
		}
	end
	return snapshot
end
----------------------------------------------------------------
-- Подготовка одного universal entry
----------------------------------------------------------------
local function PrepareUniversalElement(elem)
	local data = elem.data
	local questKey = elem.questKey
	if not data or not questKey then
		return nil
	end
	local questIDs = {}
	if data.questpools then
		for _, pool in ipairs(data.questpools) do
			for _, questData in ipairs(pool) do
				if type(questData[1]) == "number" then
					questIDs[#questIDs + 1] = questData[1]
				end
			end
		end
	end
	if data.quests then
		for _, questData in ipairs(data.quests) do
			if type(questData[1]) == "number" then
				questIDs[#questIDs + 1] = questData[1]
			end
		end
	end
	return {
		data = data,
		questKey = questKey,
		questIDs = questIDs,
	}
end
----------------------------------------------------------------
-- Обработка одного universal entry
----------------------------------------------------------------
local function ProcessUniversalElement(state, elem)
	local data = elem.data
	local questKey = elem.questKey
	if not data or not questKey then
		return
	end
	local questDataTable = {}
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
				if done then
					count = count + 1
				end
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
----------------------------------------------------------------
-- Финализация универсального сбора
----------------------------------------------------------------
local function FinishCollectUniversal(state)
	-- Защита от повторного завершения.
	if collectUniversalState ~= state then
		return
	end
	local elapsed = GetTime() - state.startTime
	if E.DEBUG_QUESTS then
		print(DEBUG_TEXT, string.format("Сбор универсальных квестов занял %.2f секунд", elapsed))
	end
	DebugPrint("Сбор универсальных квестов завершён, обработано:", state.processedCount, "из", state.totalUniversal)
	-- Записываем собранные данные в DB.
	for GUID, CharInfo in next, (Octo_ToDo_DB_Levels) do
		local pd = CharInfo.PlayerData
		local cm = CharInfo.MASLENGO
		if pd and cm then
			if cm.UniversalQuest == nil then
				cm.UniversalQuest = {}
			end
			-- Данные текущего персонажа.
			if GUID == E.curGUID then
				for questKey, v in pairs(state.tempUniversalChar) do
					cm.UniversalQuest[questKey] = v
				end
			end
			-- Account-wide данные.
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
		state.ticker = nil
	end
end
----------------------------------------------------------------
-- Основной ticker универсальных квестов
----------------------------------------------------------------
local function CollectUniversal_OnTick()
	local state = collectUniversalState
	if not state then
		return
	end
	if state.waiting then
		return
	end
	----------------------------------------------------------------
	-- Если snapshot уже полностью обработан — завершаем.
	--
	-- Это единственное условие окончания итерации.
	--
	-- Никаких next() по E.ALL_UniversalQuests здесь нет.
	----------------------------------------------------------------
	if state.currentIndex >= state.totalUniversal then
		FinishCollectUniversal(state)
		return
	end
	----------------------------------------------------------------
	-- Формируем batch по snapshot.
	----------------------------------------------------------------
	local batchElements = {}
	local batchQuests = {}
	local startIndex = state.currentIndex + 1
	local endIndex = math.min(
		state.currentIndex + E.UNIVERSAL_BATCH_SIZE,
		state.totalUniversal
	)
	for i = startIndex, endIndex do
		local snapshotElement = state.snapshot[i]
		-- currentIndex изменяется монотонно.
		-- Он никогда не сбрасывается назад.
		state.currentIndex = i
		if snapshotElement then
			local elem = PrepareUniversalElement(snapshotElement)
			if elem then
				batchElements[#batchElements + 1] = elem
				for _, questID in ipairs(elem.questIDs) do
					batchQuests[questID] = true
				end
			end
		end
	end
	----------------------------------------------------------------
	-- На этом этапе весь batch уже зафиксирован.
	--
	-- Поэтому дальнейшие изменения:
	--
	-- E.ALL_UniversalQuests
	--
	-- вообще не имеют значения для этого batch.
	----------------------------------------------------------------
	if #batchElements == 0 then
		-- Может случиться, если snapshot содержит некорректные
		-- entries. Но currentIndex всё равно продвигается.
		state.processedCount = state.processedCount + (endIndex - startIndex + 1)
		DebugPrint(string.format(E.COLOR_YELLOW .. "Универсальные|r: %d/%d", state.processedCount, state.totalUniversal))
		if state.currentIndex >= state.totalUniversal then
			FinishCollectUniversal(state)
		end
		return
	end
	----------------------------------------------------------------
	-- Есть quest IDs для предварительной загрузки.
	----------------------------------------------------------------
	if canLoadQuests and next(batchQuests) ~= nil then
		state.waiting = true
		local promise = LibThingsLoad:QuestsByKey(batchQuests)
		promise:Then(function()
				----------------------------------------------------------------
				-- Критически важная защита:
				--
				-- Пока LibThingsLoad работал, старый state мог быть
				-- отменён/заменён новым сбором.
				--
				-- В таком случае старый callback ничего не делает.
				----------------------------------------------------------------
				if collectUniversalState ~= state then
					return
				end
				for _, elem in ipairs(batchElements) do
					ProcessUniversalElement(state, elem)
				end
				state.processedCount = state.processedCount + #batchElements
				DebugPrint(string.format(E.COLOR_YELLOW .. "Универсальные|r: %d/%d", state.processedCount, state.totalUniversal))
				state.waiting = false
				----------------------------------------------------------------
				-- Теоретически ticker может быть вызван только следующим
				-- тиком, но проверка здесь делает завершение явно безопасным.
				----------------------------------------------------------------
				if state.currentIndex >= state.totalUniversal then
					FinishCollectUniversal(state)
				end
		end)
		if E.DEBUG_QUESTS then
			promise:ThenForAll(function()
				print(promise.quest.count, promise.quest.total)
			end)
			promise:Fail(function(promise, ID, TYPE)
				if TYPE == "quest" then
					print (E.COLOR_RED, ID, "|r")
					E.failedQUESTS[ID] = true
				end
			end)
		end
	else
		----------------------------------------------------------------
		-- LibThingsLoad недоступна или batch не содержит quest IDs.
		-- Обрабатываем сразу.
		----------------------------------------------------------------
		for _, elem in ipairs(batchElements) do
			ProcessUniversalElement(state, elem)
		end
		state.processedCount = state.processedCount + #batchElements
		DebugPrint(string.format(E.COLOR_LIME .. "Универсальные|r: %d/%d", state.processedCount, state.totalUniversal))
		if state.currentIndex >= state.totalUniversal then
			FinishCollectUniversal(state)
		end
	end
end
----------------------------------------------------------------
-- Запуск универсального сбора
----------------------------------------------------------------
local function StartCollectUniversalAsync()
	if collectUniversalState then
		return
	end
	----------------------------------------------------------------
	-- Создаём snapshot ДО запуска ticker.
	--
	-- После этой точки E.ALL_UniversalQuests может:
	--
	-- * полностью очиститься;
	-- * удалить отдельные entries;
	-- * добавить новые entries;
	-- * заменить entries;
	--
	-- и текущий проход всё равно будет работать по snapshot.
	----------------------------------------------------------------
	local snapshot = BuildUniversalSnapshot()
	if #snapshot == 0 then
		DebugPrint("E.ALL_UniversalQuests пуста!")
		return
	end
	collectUniversalState = {
		snapshot = snapshot,
		currentIndex = 0,
		tempUniversalChar = {},
		tempUniversalAccount = {},
		processedCount = 0,
		totalUniversal = #snapshot,
		waiting = false,
		startTime = GetTime(),
	}
	collectUniversalState.ticker = C_Timer.NewTicker(0, CollectUniversal_OnTick)
	DebugPrint("Начат сбор универсальных квестов, всего записей:", #snapshot)
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
				saved[#saved + 1] = {qID, }
			end
		end
		local info = E.func_GetQuestsOnMap_INFO(uiMapID)
		if info and #info > 0 then
			for i = 1, #info do
				local quest = info[i]
				local questID = quest.questID
				if not exists[questID] then
					local timestamp = E.func_GetQuestTimeLeftSeconds(questID)
					exists[questID] = true
					saved[#saved + 1] = {
						questID,
						addText = {
							timestamp = timestamp,
						},
					}
				end
			end
		end
	end
end
----------------------------------------------------------------
-- Public API
----------------------------------------------------------------
function E.Collect_Quests()
	if not Octo_ToDo_DB_Variables.DATACOLLECTION.QUESTS then return end
	E.func_SpamBlock(StartCollectQuestsAsync, true)
	E.func_SpamBlock(StartCollectUniversalAsync, true)
end
function E.Collect_QuestsOnMap()
	if not Octo_ToDo_DB_Variables.DATACOLLECTION[9] then return end -- SHADOWLANDS
	if not Octo_ToDo_DB_Variables.DATACOLLECTION.QUESTS then return end
	E.func_SpamBlock(Collect_QuestsOnMap, true)
end