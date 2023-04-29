local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local extras = require("luasnip.extras")
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
local types = require("luasnip.util.types")
local parse = require("luasnip.util.parser").parse_snippet
local ms = ls.multi_snippet

local utils = require("luasnip.tex.utils")

return {
	-- s({
	-- 	trig = "hi",
	-- 	dscr = "hi to the computer world",
	-- 	regTrig = false,
	-- 	snippetType = "autosnippet",
	-- }, {
	-- 	t("Hello World"),
	-- }),
	s(
		{ trig = "([^%a])mm", wordTrig = false, regTrig = true },
		fmta("<>$<>$", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			d(1, utils.get_visual),
		})
	),

	s({ trig = "mm", snippetType = "autosnippet" }, fmta("$ <> $", { i(1) })),
	s({ trig = ";a", snippetType = "autosnippet" }, {
		t("\\alpha"),
	}, { condition = utils.in_mathzone }),
	s({ trig = ";b", snippetType = "autosnippet" }, {
		t("\\beta"),
	}),
	s({ trig = ";g", snippetType = "autosnippet" }, {
		t("\\gamma"),
	}),
}
