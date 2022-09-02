local ls = require("luasnip")
local s = ls.s
local i = ls.i
local t = ls.t

local d = ls.dynamic_node
local c = ls.choice_node
local f = ls.function_node
local sn = ls.snippet_node

local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

local snippets, autosnippets = {}, {} 

s(
		{ trig = 'mk', name = 'inline math', dscr = 'Insert inline Math Environment.' },
		{ t '\\(', i(1), t '\\)' },
		{
			condition = tex.in_text,
			callbacks = {
				[-1] = { [events.leave] = appended_space_after_insert },
			},
		})


return snippets, autosnippets
