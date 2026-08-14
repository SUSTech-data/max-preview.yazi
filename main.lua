-- Updated for the current Yazi plugin API: uses `ya.sync()`/`ya.emit()`/
-- `job.args` instead of the removed `ya.manager_emit`/`ya.app_emit` and
-- the old positional `args` parameter.

local M = {}

-- Toggle the maximized preview layout; runs in the sync context so it
-- can safely mutate the global `Tab.layout` and persist `old` in `st`.
local toggle = ya.sync(function(st)
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
end)

-- Decide whether j/k should seek within the maximized preview, or move
-- the cursor as usual; also runs in the sync context for `cx` access.
local step = ya.sync(function(st, dir)
	if st.old then
		return "seek", tostring(dir)
	end
	local current = cx.active.current
	local new = (current.cursor + dir + #current.files) % #current.files
	return "arrow", new - current.cursor
end)

function M:entry(job)
	local arg = job.args[1]

	if arg == nil or arg == "preview" then
		toggle()
		ya.emit("app:resize", {})
		return
	end

	local dir = arg == "j" and 1 or (arg == "k" and -1 or nil)
	if not dir then
		return
	end

	local kind, value = step(dir)
	ya.emit(kind, { value })
end

return M
