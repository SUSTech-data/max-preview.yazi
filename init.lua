local function entry(st)
	if st.old then
		Tab.layout, st.old = st.old, nil
	else
		st.old = Tab.layout
		Tab.layout = function(self)
			self._chunks = ui.Layout()
				:direction(ui.Layout.HORIZONTAL)
				:constraints({
					ui.Constraint.Percentage(0),
					ui.Constraint.Percentage(0),
					ui.Constraint.Percentage(100),
				})
				:split(self._area)
		end
	end
	ya.app_emit("resize", {})
end

local function mock_entry(st, args)
	ya.err(args[1])
	if args == nil or args[1] == "preview" then
		return entry(st)
	end
	if args[1] == "j" then
		if st.old then
			ya.manager_emit("seek", { "5" })
		else
			ya.manager_emit("arrow", { "1" })
		end
	end
	if args[1] == "k" then
		if st.old then
			ya.manager_emit("seek", { "-5" })
		else
			ya.manager_emit("arrow", { "-1" })
		end
	end
end

return { entry = mock_entry }
