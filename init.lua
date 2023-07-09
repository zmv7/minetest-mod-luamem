local function kbtoh(val)
	if type(val) ~= "number" then
		return
	end
	local lvls = {"K", "M", "G", "T"}
	local lvl = 1
	while val > 1024 do
		val = val/1024
		lvl = lvl + 1
	end
	local str = tostring(val):match("%d+%.%d%d")
	return (str or val).." "..lvls[lvl].."B"
end

minetest.register_chatcommand("luamem",{
  description = "Check Lua's memory consumption",
  privs = {server=true},
  func = function(name,param)
	local mem = collectgarbage("count")
	return true, kbtoh(mem)
end})
