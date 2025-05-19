local wezterm = require("wezterm")

local action = {}

action.ActivateLeftTab = wezterm.action({ ActivateTabRelative = -1 })

action.ActivateRightTab = wezterm.action({ ActivateTabRelative = 1 })

action.SpawnDefaultDomainTab = wezterm.action({ SpawnTab = "DefaultDomain" })

action.SpawnCurrendPaneDomainTab = wezterm.action({ SpawnTab = "CurrentPaneDomain" })

action.CloseCurrentTab = wezterm.action({
	CloseCurrentTab = { confirm = true },
})

action.CopyToClipboard = wezterm.action({ CopyTo = "Clipboard" })

action.QuitApplication = "QuitApplication"

action.PasteFromClipboard = wezterm.action({ PasteFrom = "Clipboard" })

action.ReloadConfiguration = "ReloadConfiguration"

action.SpawnWindow = "SpawnWindow"

action.ToggleFullScreen = "ToggleFullScreen"

action.IncreaseFontSize = "IncreaseFontSize"

action.DecreaseFontSize = "DecreaseFontSize"

local opa_def = 0.95

wezterm.on("inc-opacity", function(window, pane)
	opa_def = math.min(opa_def + 0.1, 1.0)
	local overrides = window:get_config_overrides() or {}
	overrides.window_background_opacity = opa_def
	window:set_config_overrides(overrides)
end)

action.IncreaseOpacity = wezterm.action.EmitEvent("inc-opacity")

wezterm.on("dec-opacity", function(window, pane)
	opa_def = math.max(opa_def - 0.1, 0.0)
	local overrides = window:get_config_overrides() or {}
	overrides.window_background_opacity = opa_def
	window:set_config_overrides(overrides)
end)

action.DecreaseOpacity = wezterm.action.EmitEvent("dec-opacity")

wezterm.on("toggle-opacity", function(window, pane)
	local overrides = window:get_config_overrides() or {}
	if not overrides.window_background_opacity then
		overrides.window_background_opacity = 0.5
	else
		overrides.window_background_opacity = nil
	end
	window:set_config_overrides(overrides)
end)

action.ToggleOpacity = wezterm.action.EmitEvent("toggle-opacity")

action.SplitCurrentPaneDomainHorizontal = wezterm.action({
	SplitHorizontal = { domain = "CurrentPaneDomain" },
})

action.SplitCurrentPaneDomainVertical = wezterm.action({
	SplitVertical = { domain = "CurrentPaneDomain" },
})

action.Search = wezterm.action({
	Search = { CaseSensitiveString = "" },
})

action.fn = {}

action.fn.SendString = function(str)
	return wezterm.action({ SendString = str })
end

action.fn.ActivateTab = function(num)
	return wezterm.action({ ActivateTab = num })
end

return action
