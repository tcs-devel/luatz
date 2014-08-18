local luatz = require "luatz.init"

describe("strftime", function()
	local strftime = luatz.strftime.strftime
	local time = luatz.time()
	for i, spec in ipairs {
		"a", "A", "b", "B", "c", "C", "d", "D", "e", "F",
		"g", "G", "H", "I", "j", "m", "M", "n", "p", "r",
		"R", --[["s",]] "S", "t", "T", "u", "U", "V", "w", "W",
		"y", "Y", "z", "Z" , "%"
	} do
		local tt = luatz.gmtime(time)
		it("Specifier "..spec.." is equivalent to os.date", function()
			local f = "%"..spec
			local osdf = "!%"..spec
			for i=1, 365*12 do
				local t = time + 60*60*24*i
				tt.day = tt.day + 1
				tt:normalise ( )
				assert.are.same(os.date(osdf,t), strftime(f,tt))
			end
		end)
	end
end)