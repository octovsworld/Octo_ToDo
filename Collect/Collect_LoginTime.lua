local GlobalAddonName, E = ...
----------------------------------------------------------------
local printed = false
----------------------------------------------------------------
local function Collect_LoginTime()
	----------------------------------------------------------------
	if not E.func_CanCollectData() then return end
	----------------------------------------------------------------
	local oldLoginDate = E.pd.loginDate
	local oldLoginDay = E.pd.loginDay
	local oldLoginHour = E.pd.loginHour
	local oldTime = E.pd.time

	E.pd.loginDate = date("%d.%m.%Y %H:%M:%S")
	E.pd.loginDay = date("%d.%m.%Y")
	E.pd.loginHour = date("%H:%M")
	E.pd.needResetWeekly = nil
	E.pd.needResetDaily = nil
	E.pd.needResetMonth = nil
	E.pd.time = E.TIME_SERVER() -- ServerTime
	E.pd.tmstp_Daily = E.func_GetSecondsUntilDailyReset() + E.TIME_SERVER()
	E.pd.tmstp_Weekly = E.func_GetSecondsUntilWeeklyReset() + E.TIME_SERVER()

	-- E.pd.WeeklyReset = E.func_Save(E.TIME_SERVER() + E.func_GetSecondsUntilWeeklyReset()) -- GetServerTime() + C_DateAndTime.GetSecondsUntilWeeklyReset()
	-- E.pd.DailyReset = E.func_Save(E.TIME_SERVER() + E.func_GetSecondsUntilDailyReset()) -- GetServerTime() + C_DateAndTime.GetSecondsUntilWeeklyReset()

	if E.DEBUG then
		if not printed then
			printed = true
			if oldTime then
				local color = "|cffFFFFFF"
				if E.pd.needResetWeekly then
					color = E.COLOR_GRAY
				elseif E.pd.needResetDaily then
					color = E.COLOR_RED
				end
				print(color .. E.func_FormatLastSeen(E.pd.time, E.pd.classColorHex) .. "|r", "")
				print("oldLoginDate:", oldLoginDate)
			end
		end
	end
end
----------------------------------------------------------------
function E.Collect_LoginTime()
	E.func_SpamBlock(Collect_LoginTime, true)
end
----------------------------------------------------------------