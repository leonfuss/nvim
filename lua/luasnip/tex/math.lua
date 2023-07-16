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

local utils = require("luasnip.utils")

return {

	s(
		{ trig = "([^%a])mm", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
		fmta("<>$ <> $", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			d(1, utils.get_visual),
		})
	),

	-------------
	-- Symbols --
	-------------

	-- greek letters
	s({ trig = "üa", snippetType = "autosnippet" }, { t("\\alpha") }, { condition = utils.tex.in_mathzone }),
	s({ trig = "üb", snippetType = "autosnippet" }, { t("\\beta") }, { condition = utils.tex.in_mathzone }),
	s({ trig = "üg", snippetType = "autosnippet" }, { t("\\gamma") }, { condition = utils.tex.in_mathzone }),
	s({ trig = "üs", snippetType = "autosnippet" }, fmta("\\sigma", {}), { condition = utils.tex.in_mathzone }),
	s({ trig = "üm", snippetType = "autosnippet" }, fmta("\\mu", {}), { condition = utils.tex.in_mathzone }),
	s({ trig = "üd", snippetType = "autosnippet" }, fmta("\\delta", {}), { condition = utils.tex.in_mathzone }),

	-- operators
	s({ trig = "*", snippetType = "autosnippet" }, fmta("\\cdot", {}), { condition = utils.tex.in_mathzone }),
	s({ trig = "!=", snippetType = "autosnippet" }, fmta("\\neq", {}), { condition = utils.tex.in_mathzone }),
	s({ trig = "in", snippetType = "autosnippet" }, fmta("\\in", {}), { condition = utils.tex.in_mathzone }),
	s({ trig = "to", snippetType = "autosnippet" }, fmta("\\to", {}), { condition = utils.tex.in_mathzone }),
	s({ trig = "mapsto", snippetType = "autosnippet" }, fmta("\\mapsto", {}), { condition = utils.tex.in_mathzone }),
	s({ trig = "pm", snippetType = "autosnippet" }, fmta("\\pm", {}), { condition = utils.tex.in_mathzone }),
	s({ trig = "cap", snippetType = "autosnippet" }, fmta("\\cap", {}), { condition = utils.tex.in_mathzone }),
	s({ trig = "cup", snippetType = "autosnippet" }, fmta("\\cup", {}), { condition = utils.tex.in_mathzone }),

	-- special symbols
	s({ trig = "CI", snippetType = "autosnippet" }, fmta("\\CI", {}), { condition = utils.tex.in_mathzone }),
	s({ trig = "SE", snippetType = "autosnippet" }, fmta("\\SE", {}), { condition = utils.tex.in_mathzone }),

	-- arrows
	s({ trig = "=>", snippetType = "autosnippet" }, fmta("\\Rightarrow", {}), { condition = utils.tex.in_mathzone }),
	s(
		{ trig = "->", snippetType = "autosnippet" },
		fmta("\\longrightarrow", {}),
		{ condition = utils.tex.in_mathzone }
	),

	------------------
	-- Surroundings --
	------------------

	-- spans
	s(
		{ trig = "text", snippetType = "autosnippet" },
		fmta("\\text{<>}", { i(1) }),
		{ condition = utils.tex.in_mathzone }
	),
	s(
		{ trig = "sq", snippetType = "autosnippet" },
		fmta("\\sqrt{<>}", { i(1) }),
		{ condition = utils.tex.in_mathzone }
	),
	s(
		{ trig = "bar", snippetType = "autosnippet" },
		fmta("\\overline{<>}", { i(1) }),
		{ condition = utils.tex.in_mathzone }
	),
	s(
		{ trig = "hat", snippetType = "autosnippet" },
		fmta("\\hat{<>}", { i(1) }),
		{ condition = utils.tex.in_mathzone }
	),
}
