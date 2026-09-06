local GlobalAddonName, E = ...
local L = E.L
----------------------------------------------------------------
local WIDTH_FRAME = 660
local HEIGHT_FRAME = 560
local WIDTH_ROW = WIDTH_FRAME
local HEIGHT_ROW = 30
local INDENT_CONTAINER = 16
local WIDTH_DATAPROVIDER = WIDTH_ROW
local INDENT_SCROLL = 6
----------------------------------------------------------------
local minAddonVersion, maxAddonVersion
local table_insert = table.insert
----------------------------------------------------------------
local VERSION_COLOR = E.COLOR_GRAY
local NAME_COLOR = E.COLOR_SKYBLUE
local REMOVED_COLOR = E.COLOR_RED
local SEPARATOR = "----------------------------------------------------------------"
-- E.TOTALCOLORFOROPTIONSCHANGELOG = {}
local func_DataProviderData do
	-- E.TOTALCOLORFOROPTIONSCHANGELOG = {120100, 120007, 120005}
	-- minWowVersion, maxWowVersion = E.func_GetMinMaxValue(E.TOTALCOLORFOROPTIONSCHANGELOG)
	function func_DataProviderData()
		-- local function versionColor(ver)
		-- return E.func_GetColorGradient(ver, minWowVersion, maxWowVersion, true)
		-- end
		local function formatterstr(str)
			local result = E.COLOR_GRAY .. "(" .. str .. ")|r"
			return result
		end
		local Version_120100 = formatterstr("12.1.0") -- .. E.func_NumberToVersion(120100) -- , versionColor(120100)
		local Version_120007 = formatterstr("12.0.7") -- .. E.func_NumberToVersion(120007) -- , versionColor(120007)
		local Version_120005 = formatterstr("12.0.5") -- .. E.func_NumberToVersion(120005) -- , versionColor(120005)
		local tbl = {
			{
				addonVersion = 116.4,
				date = formatterstr("06.09.2026"),
				wowVersion = Version_120100,
				text = {
					"LibSFDropDown v41",
				}
			},
			{
				addonVersion = 116.3,
				date = formatterstr("06.09.2026"),
				wowVersion = Version_120100,
				text = {
					"Добавлена локализация: " .. NAME_COLOR .. L["MISCELLANEOUS"] .. "|r",
					"Добавлена локализация: " .. NAME_COLOR .. MINIMUM .. "|r",
					"DEEP_CLEAN",
					"Пофиксил: " .. E.COLOR_SKYBLUE .. L["HIDE"] .. "|r" .. " [ctrl+LMB]",
					"Octo_ToDo_DB_Variables.DATACOLLECTION.CURRENCY",
					"Octo_ToDo_DB_Variables.DATACOLLECTION.ITEMS",
					"Octo_ToDo_DB_Variables.DATACOLLECTION.RAIDSORDUNGEONS",
					"Octo_ToDo_DB_Variables.DATACOLLECTION.REPUTATION",
					"Octo_ToDo_DB_Variables.DATACOLLECTION.QUESTS",
					"Octo_ToDo_DB_Variables.DATACOLLECTION.MYTHICPLUS",
					"Octo_ToDo_DB_Variables.DATACOLLECTION.PROFESSIONS",
					"Octo_ToDo_DB_Variables.DATACOLLECTION.PVP",
					"Добавлена библиотека: " .. NAME_COLOR .. "LibThingsLoad" .. "|r",
					E.MIDDLE_MOUSE_ICON .. L["MMB:"] .. L["RATED_PVP_WEEKLY_VAULT"],
					"Добавлена функция: " .. NAME_COLOR .. "E.func_GetIconAndName(category, id, forcedQuality, fullDifficultyName)" .. "|r",
					"Пофикшен: " .. NAME_COLOR .. L["Row Highlight Color"] .. "|r",
					"Добавлена валюта: " .. E.func_GetIconAndName("currency", 3448),
					"Добавлена валюта: " .. E.func_GetIconAndName("currency", 3546),
					NAME_COLOR .. "[" .. E.OctoTable_KeystoneAbbr[583].abbreviation .. "] |r" .. C_ChallengeMode.GetMapUIInfo(583) .. NAME_COLOR .. " " .. E.func_GetIconAndName("spell", E.OctoTable_KeystoneAbbr[583].portal) .. "|r",
					NAME_COLOR .. "[" .. E.OctoTable_KeystoneAbbr[541].abbreviation .. "] |r" .. C_ChallengeMode.GetMapUIInfo(541) .. NAME_COLOR .. " " .. E.func_GetIconAndName("spell", E.OctoTable_KeystoneAbbr[541].portal) .. "|r",
					NAME_COLOR .. "[" .. E.OctoTable_KeystoneAbbr[586].abbreviation .. "] |r" .. C_ChallengeMode.GetMapUIInfo(586) .. NAME_COLOR .. " " .. E.func_GetIconAndName("spell", E.OctoTable_KeystoneAbbr[586].portal) .. "|r",
					NAME_COLOR .. "[" .. E.OctoTable_KeystoneAbbr[588].abbreviation .. "] |r" .. C_ChallengeMode.GetMapUIInfo(588) .. NAME_COLOR .. " " .. E.func_GetIconAndName("spell", E.OctoTable_KeystoneAbbr[588].portal) .. "|r",
					NAME_COLOR .. "[" .. E.OctoTable_KeystoneAbbr[585].abbreviation .. "] |r" .. C_ChallengeMode.GetMapUIInfo(585) .. NAME_COLOR .. " " .. E.func_GetIconAndName("spell", E.OctoTable_KeystoneAbbr[585].portal) .. "|r",
					NAME_COLOR .. "[" .. E.OctoTable_KeystoneAbbr[587].abbreviation .. "] |r" .. C_ChallengeMode.GetMapUIInfo(587) .. NAME_COLOR .. " " .. E.func_GetIconAndName("spell", E.OctoTable_KeystoneAbbr[587].portal) .. "|r",
					NAME_COLOR .. "[" .. E.OctoTable_KeystoneAbbr[584].abbreviation .. "] |r" .. C_ChallengeMode.GetMapUIInfo(584) .. NAME_COLOR .. " " .. E.func_GetIconAndName("spell", E.OctoTable_KeystoneAbbr[584].portal) .. "|r",
				}
			},
			{

				addonVersion = 116.2,
				date = formatterstr("04.09.2026"),
				wowVersion = Version_120100,
				text = {
					E.COLOR_GRAY .. "function Collect_Quests()" .. "|r",
				}
			},
			{
				addonVersion = 116.1,
				date = formatterstr("03.09.2026"),
				wowVersion = Version_120100,
				text = {
					E.COLOR_GRAY .. "function Collect_Quests()" .. "|r",
				}
			},
			{
				addonVersion = 116.0,
				date = formatterstr("01.09.2026"),
				wowVersion = Version_120100,
				text = {
					"Убрана валюта: " .. E.func_GetIconAndName("currency", 3513),
					-- "Пофиксил: " .. E.func_GetIconAndName("currency", 3418),
				}
			},
			{
				addonVersion = 115.9,
				date = formatterstr("01.09.2026"),
				wowVersion = Version_120100,
				text = {
					"Пофиксил сбор и вывод GreatVault",
					"Пофиксил сбор всех инстов, добавив перезапись сложностей",
					"Все компоненты теперь заполняются через E.Components[categoryKey] = function()",
					"Все компоненты теперь инициализируется на ивенте PLAYER_LOGIN",
					"E.SPAM_TIME = 3",
					"Удалена библиотека: " .. E.COLOR_RED .. "LibThingsLoad" .. "|r",
					"Добавлена локализация: " .. NAME_COLOR .. L["Weekly total"] .. "|r",
					"Добавлена локализация: " .. NAME_COLOR .. MYTHIC_PLUS_WEEKLY_BEST .. "|r",
					"Добавлена валюта: " .. E.func_GetIconAndName("currency", 3513),
					"Добавлена валюта: " .. E.func_GetIconAndName("currency", 3418),
					"Добавлена валюта: " .. E.func_GetIconAndName("currency", 3465),
					"Добавлена валюта: " .. E.func_GetIconAndName("currency", 3378),
					"Добавлена валюта: " .. E.func_GetIconAndName("currency", 3446),
					"Добавлена валюта: " .. E.func_GetIconAndName("currency", 3445),
					"Добавлена валюта: " .. E.func_GetIconAndName("currency", 3444),
					"Добавлена валюта: " .. E.func_GetIconAndName("currency", 3443),
					"Добавлена валюта: " .. E.func_GetIconAndName("currency", 3442),
					"Добавлена валюта: " .. E.func_GetIconAndName("currency", 3509),
					"Добавлена валюта: " .. E.func_GetIconAndName("currency", 3212),
					"Добавлена валюта: " .. E.func_GetIconAndName("currency", 3028),
					"Добавлена валюта: " .. E.func_GetIconAndName("currency", 3310),
					"Добавлена валюта: " .. E.func_GetIconAndName("currency", 3356),
					"Добавлена валюта: " .. E.func_GetIconAndName("currency", 3405),
					"Добавлена репутация: " .. E.func_GetIconAndName("reputation", 2772),
					"Добавлена репутация: " .. E.func_GetIconAndName("reputation", 2773),
					"Добавлена репутация: " .. E.func_GetIconAndName("reputation", 2796),
					NAME_COLOR .. "[" .. E.OctoTable_KeystoneAbbr[239].abbreviation .. "] |r" .. C_ChallengeMode.GetMapUIInfo(239) .. NAME_COLOR .. " " .. E.func_GetIconAndName("spell", E.OctoTable_KeystoneAbbr[239].portal) .. "|r",
					NAME_COLOR .. "[" .. E.OctoTable_KeystoneAbbr[250].abbreviation .. "] |r" .. C_ChallengeMode.GetMapUIInfo(250) .. NAME_COLOR .. " " .. E.func_GetIconAndName("spell", E.OctoTable_KeystoneAbbr[250].portal) .. "|r",
					NAME_COLOR .. "[" .. E.OctoTable_KeystoneAbbr[541].abbreviation .. "] |r" .. C_ChallengeMode.GetMapUIInfo(541) .. NAME_COLOR .. " " .. E.func_GetIconAndName("spell", E.OctoTable_KeystoneAbbr[541].portal) .. "|r",
					NAME_COLOR .. "[" .. E.OctoTable_KeystoneAbbr[586].abbreviation .. "] |r" .. C_ChallengeMode.GetMapUIInfo(586) .. NAME_COLOR .. " " .. E.func_GetIconAndName("spell", E.OctoTable_KeystoneAbbr[586].portal) .. "|r",
					NAME_COLOR .. "[" .. E.OctoTable_KeystoneAbbr[588].abbreviation .. "] |r" .. C_ChallengeMode.GetMapUIInfo(588) .. NAME_COLOR .. " " .. E.func_GetIconAndName("spell", E.OctoTable_KeystoneAbbr[588].portal) .. "|r",
					NAME_COLOR .. "[" .. E.OctoTable_KeystoneAbbr[585].abbreviation .. "] |r" .. C_ChallengeMode.GetMapUIInfo(585) .. NAME_COLOR .. " " .. E.func_GetIconAndName("spell", E.OctoTable_KeystoneAbbr[585].portal) .. "|r",
					NAME_COLOR .. "[" .. E.OctoTable_KeystoneAbbr[587].abbreviation .. "] |r" .. C_ChallengeMode.GetMapUIInfo(587) .. NAME_COLOR .. " " .. E.func_GetIconAndName("spell", E.OctoTable_KeystoneAbbr[587].portal) .. "|r",
					NAME_COLOR .. "[" .. E.OctoTable_KeystoneAbbr[584].abbreviation .. "] |r" .. C_ChallengeMode.GetMapUIInfo(584) .. NAME_COLOR .. " " .. E.func_GetIconAndName("spell", E.OctoTable_KeystoneAbbr[584].portal) .. "|r",
				}
			},
			{
				addonVersion = 115.8,
				date = formatterstr("01.09.2026"),
				wowVersion = Version_120100,
				text = {
					NAME_COLOR .. "[" .. E.OctoTable_KeystoneAbbr[161].abbreviation .. "] |r" .. C_ChallengeMode.GetMapUIInfo(161) .. NAME_COLOR .. " " .. E.func_GetIconAndName("spell", E.OctoTable_KeystoneAbbr[161].portal) .. "|r",
					NAME_COLOR .. "[" .. E.OctoTable_KeystoneAbbr[197].abbreviation .. "] |r" .. C_ChallengeMode.GetMapUIInfo(197) .. NAME_COLOR .. " " .. E.func_GetIconAndName("spell", E.OctoTable_KeystoneAbbr[197].portal) .. "|r",
					NAME_COLOR .. "[" .. E.OctoTable_KeystoneAbbr[207].abbreviation .. "] |r" .. C_ChallengeMode.GetMapUIInfo(207) .. NAME_COLOR .. " " .. E.func_GetIconAndName("spell", E.OctoTable_KeystoneAbbr[207].portal) .. "|r",
					NAME_COLOR .. "[" .. E.OctoTable_KeystoneAbbr[208].abbreviation .. "] |r" .. C_ChallengeMode.GetMapUIInfo(208) .. NAME_COLOR .. " " .. E.func_GetIconAndName("spell", E.OctoTable_KeystoneAbbr[208].portal) .. "|r",
					NAME_COLOR .. "[" .. E.OctoTable_KeystoneAbbr[209].abbreviation .. "] |r" .. C_ChallengeMode.GetMapUIInfo(209) .. NAME_COLOR .. " " .. E.func_GetIconAndName("spell", E.OctoTable_KeystoneAbbr[209].portal) .. "|r",
					NAME_COLOR .. "[" .. E.OctoTable_KeystoneAbbr[233].abbreviation .. "] |r" .. C_ChallengeMode.GetMapUIInfo(233) .. NAME_COLOR .. " " .. E.func_GetIconAndName("spell", E.OctoTable_KeystoneAbbr[233].portal) .. "|r",
					NAME_COLOR .. "[" .. E.OctoTable_KeystoneAbbr[246].abbreviation .. "] |r" .. C_ChallengeMode.GetMapUIInfo(246) .. NAME_COLOR .. " " .. E.func_GetIconAndName("spell", E.OctoTable_KeystoneAbbr[246].portal) .. "|r",
					NAME_COLOR .. "[" .. E.OctoTable_KeystoneAbbr[249].abbreviation .. "] |r" .. C_ChallengeMode.GetMapUIInfo(249) .. NAME_COLOR .. " " .. E.func_GetIconAndName("spell", E.OctoTable_KeystoneAbbr[249].portal) .. "|r",
					NAME_COLOR .. "[" .. E.OctoTable_KeystoneAbbr[250].abbreviation .. "] |r" .. C_ChallengeMode.GetMapUIInfo(250) .. NAME_COLOR .. " " .. E.func_GetIconAndName("spell", E.OctoTable_KeystoneAbbr[250].portal) .. "|r",
					NAME_COLOR .. "[" .. E.OctoTable_KeystoneAbbr[252].abbreviation .. "] |r" .. C_ChallengeMode.GetMapUIInfo(252) .. NAME_COLOR .. " " .. E.func_GetIconAndName("spell", E.OctoTable_KeystoneAbbr[252].portal) .. "|r",
					NAME_COLOR .. "[" .. E.OctoTable_KeystoneAbbr[583].abbreviation .. "] |r" .. C_ChallengeMode.GetMapUIInfo(583) .. NAME_COLOR .. " " .. E.func_GetIconAndName("spell", E.OctoTable_KeystoneAbbr[583].portal) .. "|r",
					NAME_COLOR .. "[" .. E.OctoTable_KeystoneAbbr[541].abbreviation .. "] |r" .. C_ChallengeMode.GetMapUIInfo(541) .. NAME_COLOR .. " " .. E.func_GetIconAndName("spell", E.OctoTable_KeystoneAbbr[541].portal) .. "|r",
				}
			},
			{
				addonVersion = 115.7,
				date = formatterstr("24.06.2026"),
				wowVersion = Version_120007,
				text = {
					"Добавлен " .. NAME_COLOR .. L["Changelog"] .. "|r",
					-- "Добавлена кнопка с порталами",
					"Настройки шрифта теперь не зависят от языка",
					"Унифицирован FontObject для настроек через метаттаблицу: " .. NAME_COLOR .. "E.OctoFont11_MT|r",
					"Пофиксил сбор валюты",
					"LibSFDropDown добавлена функция: " .. NAME_COLOR .. "ddReopenAllMenus|r",
					NAME_COLOR .. "DataProvider Expansion|r теперь по индексу",
					REMOVED_COLOR .. "Octo_ToDo_DBVersion|r" .. " -> " .. NAME_COLOR .. "Octo_ToDo_DB_Variables|r",
					REMOVED_COLOR .. "Octo_DevTool_DB|r" .. " -> " .. NAME_COLOR .. "Octo_ToDo_DB_Variables|r",
					REMOVED_COLOR .. "Octo_ToDo_DB_Calendar|r" .. " -> " .. NAME_COLOR .. "Octo_ToDo_DB_Variables.Calendar|r",
					NAME_COLOR .. "OctoTables_Vibor|r[categoryKey].defs = true",
				},
			},
			{
				addonVersion = 115.6,
				date = formatterstr("21.06.2026"),
				wowVersion = Version_120007,
				text = {
					"Добавлена возможность передвигать скроллбокс по СКМ",
					"Все настройки перенесены в \"выпадающее меню\" (Dropdown)",
					"Добавлена кнока для ивентов",
					"Добавлен рейд " .. NAME_COLOR .. E.func_GetIconAndName("dungeon", 3004) .. "|r" .. Version_120100,
					"Добавлен рейд " .. NAME_COLOR .. E.func_GetIconAndName("dungeon", 2987) .. "|r" .. Version_120100,
					"Добавлена аббревиатура для " .. NAME_COLOR .. E.func_GetIconAndName("challenge", 586) .. "|r" .. Version_120100,
					"Добавлена аббревиатура для " .. NAME_COLOR .. E.func_GetIconAndName("challenge", 588) .. "|r" .. Version_120100,
					"Добавлена аббревиатура для " .. NAME_COLOR .. E.func_GetIconAndName("challenge", 585) .. "|r" .. Version_120100,
					"Добавлена аббревиатура для " .. NAME_COLOR .. E.func_GetIconAndName("challenge", 587) .. "|r" .. Version_120100,
					"Добавлена аббревиатура для " .. NAME_COLOR .. E.func_GetIconAndName("challenge", 584) .. "|r" .. Version_120100,
					"Добавлена возможность сохранять позиции основного фрейма",
					"Исправлена привязка ScrollBox у основного фрейма",
				},
			},
			{
				addonVersion = 115.5,
				date = formatterstr("19.06.2026"),
				wowVersion = Version_120007,
				text = {
					L["Border"] .. " " .. NAME_COLOR .. "Octo.tga|r",
					L["RAID"] .. " " .. NAME_COLOR .. E.func_GetIconAndName("dungeon", 1592) .. "|r" .. Version_120007,
					L["RAID_INFO_WORLD_BOSS"] .. " " .. NAME_COLOR .. E.func_GetIconAndName("npc", 260833) .. "|r",
				},
			},
			{
				addonVersion = 115.4,
				date = formatterstr("18.06.2026"),
				wowVersion = Version_120007,
				text = {
					"Добавлено отображение " .. E.COLOR_RED .. E.func_GetIconAndName("spell", 306715) .. "|r",
				},
			},
			{
				addonVersion = 115.3,
				date = formatterstr("08.05.2026"),
				wowVersion = Version_120005,
				text = {
					E.func_GetName("map", 2393) .. ": " .. E.func_GetName("quest", 91277),
					E.func_GetName("quest", 93605),
				},
			},
		}
		return tbl
	end
end
----------------------------------------------------------------
local function UpdateToggleIcon(frame, enabled)
	if enabled then
		frame.SettingsTexture:SetAtlas("QuestLog-icon-shrink")
	else
		frame.SettingsTexture:SetAtlas("QuestLog-icon-Expand")
	end
end
----------------------------------------------------------------
function E.func_option_CHANGELOG(category, layout)
	----------------------------------------------------------------
	local EventFrame = CreateFrame("FRAME")
	EventFrame:Hide()
	----------------------------------------------------------------
	local scrollContentFrame_LEFT = CreateFrame("FRAME", nil, layout)
	scrollContentFrame_LEFT:Hide()
	----------------------------------------------------------------
	-- Функция показа StaticPopup с выделенной ссылкой
	local function ShowCopyLinkPopup(version)
		local prevVersion = string.format("%.1f", version - 0.1)
		local link = "http://github.com/octovsworld/" .. GlobalAddonName .. "/compare/v" .. prevVersion .. "...v" .. string.format("%.1f", version)

		StaticPopupDialogs[E.popupName] = setmetatable({
			text = "Ссылка для копирования:",
			button1 = OKAY,
			button2 = CANCEL,
			hasEditBox = true,
			editBoxWidth = 400,
			maxLetters = 0, -- без ограничения длины
			editBoxText = link,
			OnShow = function(dialog)
				local editBox = dialog.editBox or dialog.EditBox
				if editBox then
					editBox:SetText(link)
					editBox:SetFocus()
					editBox:HighlightText()
				end
			end,
			OnAccept = function(dialog) end,
			EditBoxOnEnterPressed = function(editBox)
				editBox:GetParent():Hide()
			end,
			timeout = 0,
			whileDead = true,
			hideOnEscape = true,
		}, { __index = E.StaticPopupDialogs_EDITBOX_STRING })

		StaticPopup_Show(E.popupName)
	end
	----------------------------------------------------------------
	layout:SetScript("OnShow", function()
		scrollContentFrame_LEFT:Show()
		RunNextFrame(E.func_CreateDataProvider_CHANGELOG)
	end)
	----------------------------------------------------------------
	local func_OnAcquiredLEFT do
		local function togglebuttonOnclick(self, button)
			local frame = self:GetParent()
			if frame.isPlaceholder then return end
			if not frame.isParent then return end
			local addonVersion = frame.addonVersion
			if addonVersion then
				local current = Octo_ToDo_DB_Variables.dataprovider[addonVersion]
				Octo_ToDo_DB_Variables.dataprovider[addonVersion] = not current
				local newState = Octo_ToDo_DB_Variables.dataprovider[addonVersion]
				UpdateToggleIcon(frame, newState)
				frame.isCollapsed = newState
				frame.node:SetCollapsed(newState)
			end
		end

		-- Создание кнопки переключения (сворачивания) в правой части
		function Create_ToggleButton(frame)
			frame.SettingsButton = CreateFrame("BUTTON", nil, frame)
			frame.SettingsButton:SetSize(HEIGHT_ROW, HEIGHT_ROW)
			frame.SettingsButton:SetPoint("RIGHT", frame.CopyButton, "LEFT", -4, 0)
			frame.SettingsButton:RegisterForClicks("LeftButtonUp")
			frame.SettingsButton:EnableMouse(true)
			frame.SettingsTexture = frame.SettingsButton:CreateTexture(nil, "BACKGROUND", nil, 5)
			frame.SettingsTexture:SetAllPoints()
			frame.SettingsButton:SetScript("OnClick", togglebuttonOnclick)
		end

		-- Создание кнопки копирования ссылки справа от кнопки сворачивания
		function Create_CopyButton(frame)
			frame.CopyButton = CreateFrame("BUTTON", nil, frame)
			frame.CopyButton:SetSize(HEIGHT_ROW, HEIGHT_ROW)
			frame.CopyButton:SetPoint("RIGHT", frame, "RIGHT", -1, 0)
			frame.CopyButton:SetNormalTexture("interface/AddOns/" .. GlobalAddonName .. "/Media/Textures/github")
			frame.CopyButton:SetHighlightTexture("interface/AddOns/" .. GlobalAddonName .. "/Media/Textures/github")
			frame.CopyButton:SetScript("OnClick", function(self, button)
				if button == "LeftButton" and frame.addonVersion then
					ShowCopyLinkPopup(frame.addonVersion)
				end
			end)
			frame.CopyButton:SetFrameLevel(frame:GetFrameLevel() + 10)
		end

		-- Текстовая метка
		function Create_TEXTLEFT(frame)
			frame.text = frame:CreateFontString()
			frame.text:SetPoint("LEFT", frame, "LEFT", 5, 0)
			frame.text:SetPoint("RIGHT", frame.SettingsButton, "LEFT", -5, 0)
			frame.text:SetWordWrap(false)
			frame.text:SetJustifyV("MIDDLE")
			frame.text:SetJustifyH("LEFT")
		end

		-- Фон
		function Create_BACKGROUND(frame)
			frame.BACKGROUND = frame:CreateTexture(nil, "BACKGROUND", nil, -2)
			frame.BACKGROUND:SetAllPoints()
			E.func_SetupTextureToFrame(frame.BACKGROUND, E.TEXTURE_HEADER)
		end

		function func_OnAcquiredLEFT(owner, frame, node, new)
			if not new then return end
			frame:SetWidth(WIDTH_ROW)
			frame:Hide()
			Create_CopyButton(frame)
			Create_ToggleButton(frame)
			Create_TEXTLEFT(frame)
			Create_BACKGROUND(frame)
			frame:SetHeight(HEIGHT_ROW)
			frame:SetPoint("LEFT", owner, "LEFT")
			frame:SetScript("OnHide", function() frame:Hide() end)
		end
	end
	----------------------------------------------------------------
	local func_Init do
		local function func_ToggleButton(frame)
			if frame.isPlaceholder then
				frame.SettingsButton:Hide()
			elseif frame.isParent then
				frame.SettingsButton:Show()
				local addonVersion = frame.addonVersion
				local isEnabled = Octo_ToDo_DB_Variables.dataprovider[addonVersion]
				UpdateToggleIcon(frame, isEnabled)
			else
				frame.SettingsButton:Hide()
			end
		end

		local function func_CopyButton(frame)
			if frame.isParent then
				frame.CopyButton:Show()
			else
				frame.CopyButton:Hide()
			end
		end

		local function func_text_LEFT(frame)
			if frame.isParent then
				frame.text:SetFontObject(E.OctoFont14_MT)
			else
				frame.text:SetFontObject(E.OctoFont11_MT)
			end
			frame.text:SetText(frame.dataText)
		end

		local function func_BACKGROUND(frame)
			if frame.isParent then
				local r, g, b
				if frame.isPlaceholder then
					local color = E.COLOR_GRAY
					r, g, b = E.func_Hex2RGBA(color)
				else
					local addonVersion = frame.addonVersion
					local color = E.func_GetColorGradient(addonVersion, minAddonVersion, maxAddonVersion, true)
					r, g, b = E.func_Hex2RGBA(color)
				end
				frame.BACKGROUND:SetVertexColor(r, g, b, .2)
			end
			frame.BACKGROUND:SetShown(frame.isParent)
		end

		function func_Init(frame, node)
			local data = node:GetData()
			frame:Show()
			frame.dataText = data.text
			frame.isParent = data.isParent
			frame.addonVersion = data.addonVersion
			frame.isCollapsed = data.isCollapsed or false
			frame.node = node
			frame.isPlaceholder = data.isPlaceholder
			func_ToggleButton(frame)
			func_CopyButton(frame)
			func_text_LEFT(frame)
			func_BACKGROUND(frame)
		end
	end
	----------------------------------------------------------------
	local func_CreateOcto_CHANGELOG do
		local function setup_scroll(layout)
			scrollContentFrame_LEFT:SetPoint("TOPLEFT", layout, "TOPLEFT", 0, -INDENT_CONTAINER-40)
			scrollContentFrame_LEFT:SetPoint("BOTTOMRIGHT", layout, "BOTTOMRIGHT", -INDENT_CONTAINER-INDENT_SCROLL, INDENT_CONTAINER)
			scrollContentFrame_LEFT:SetWidth(WIDTH_DATAPROVIDER)
			scrollContentFrame_LEFT.ScrollBoxLEFT = CreateFrame("FRAME", nil, scrollContentFrame_LEFT, "WowScrollBoxList")
			scrollContentFrame_LEFT.ScrollBoxLEFT:SetAllPoints()
			scrollContentFrame_LEFT.ScrollBarLEFT = CreateFrame("EventFrame", nil, scrollContentFrame_LEFT, "MinimalScrollBar")
			scrollContentFrame_LEFT.ScrollBarLEFT:SetPoint("TOPLEFT", scrollContentFrame_LEFT, "TOPRIGHT", INDENT_SCROLL, 0)
			scrollContentFrame_LEFT.ScrollBarLEFT:SetPoint("BOTTOMLEFT", scrollContentFrame_LEFT, "BOTTOMRIGHT", INDENT_SCROLL, 0)
			scrollContentFrame_LEFT.ViewLEFT = CreateScrollBoxListTreeListView(HEIGHT_ROW)
			scrollContentFrame_LEFT.ViewLEFT:SetElementExtent(HEIGHT_ROW)
			scrollContentFrame_LEFT.ViewLEFT:SetElementInitializer("OctoRectTemplate", function(...) func_Init(...) end)
			scrollContentFrame_LEFT.ViewLEFT:RegisterCallback(scrollContentFrame_LEFT.ViewLEFT.Event.OnAcquiredFrame, func_OnAcquiredLEFT, scrollContentFrame_LEFT)
			ScrollUtil.InitScrollBoxListWithScrollBar(scrollContentFrame_LEFT.ScrollBoxLEFT, scrollContentFrame_LEFT.ScrollBarLEFT, scrollContentFrame_LEFT.ViewLEFT)
			ScrollUtil.AddManagedScrollBarVisibilityBehavior(scrollContentFrame_LEFT.ScrollBoxLEFT, scrollContentFrame_LEFT.ScrollBarLEFT)
		end
		function func_CreateOcto_CHANGELOG()
			layout:SetPoint("TOPLEFT", INDENT_CONTAINER, -INDENT_CONTAINER*2)
			layout:SetPoint("BOTTOMRIGHT", -INDENT_CONTAINER, INDENT_CONTAINER)
			setup_scroll(layout)
		end
	end
	----------------------------------------------------------------
	Octo_ToDo_DB_Variables = Octo_ToDo_DB_Variables or {}
	Octo_ToDo_DB_Variables.dataprovider = Octo_ToDo_DB_Variables.dataprovider or {}
	----------------------------------------------------------------
	function E.func_CreateDataProvider_CHANGELOG()
		E.CHANGELOG_COLORS_FORTEXT = {}
		local DataProvider = CreateTreeDataProvider()
		local dataArray = func_DataProviderData()
		minAddonVersion, maxAddonVersion = E.func_GetMinMaxValue(dataArray, "addonVersion")

		local existingData = {}
		for _, data in ipairs(dataArray) do
			existingData[data.addonVersion] = data
		end

		-- Получаем версию из .toc через вашу обёртку
		local tocVersionRaw = E.func_GetAddOnMetadata(GlobalAddonName, "Version")
		local tocVersion
		if tocVersionRaw then
			local versionString = tocVersionRaw:match("v?(%d+%.%d+)")
			if versionString then
				tocVersion = tonumber(versionString)
			end
		end

		-- Определяем диапазон отображения с учётом .toc версии
		local displayMin = minAddonVersion
		local displayMax = maxAddonVersion
		if tocVersion then
			if tocVersion < displayMin then
				displayMin = tocVersion
			elseif tocVersion > displayMax then
				displayMax = tocVersion
			end
		end
		local minInt = math.floor(displayMin * 10 + 0.5)
		local maxInt = math.floor(displayMax * 10 + 0.5)

		for i = maxInt, minInt, -1 do
			local version = i / 10
			local data = rawget(existingData, version)
			if data then
				table_insert(E.CHANGELOG_COLORS_FORTEXT, version)
				if Octo_ToDo_DB_Variables.dataprovider[version] == nil then
					Octo_ToDo_DB_Variables.dataprovider[version] = false
				end
			end
			local parentText = " v" .. string.format("%.1f", version) .. " "
			if data then
				parentText = parentText .. (data.wowVersion or "") .. (data.date or "") .. "|r"
			end
			local parentNode = DataProvider:Insert({
				text = parentText,
				isParent = true,
				addonVersion = version,
				isCollapsed = Octo_ToDo_DB_Variables.dataprovider[version] or false,
				isPlaceholder = (data == nil),
			})
			parentNode:SetCollapsed(Octo_ToDo_DB_Variables.dataprovider[version] or false)
			if data then
				for _, childText in ipairs(data.text or {}) do
					parentNode:Insert({
						text = "• " .. childText,
						isParent = false,
					})
				end
			end
		end
		EventFrame:UpdateDataProvider(DataProvider)
	end
	----------------------------------------------------------------
	function EventFrame:UpdateDataProvider(DataProvider)
		scrollContentFrame_LEFT.ViewLEFT:SetDataProvider(DataProvider, ScrollBoxConstants.RetainScrollPosition)
	end
	----------------------------------------------------------------
	func_CreateOcto_CHANGELOG()
end