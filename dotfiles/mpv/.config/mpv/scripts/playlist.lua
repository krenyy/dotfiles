local mp = require("mp")

local ARROW_UP = "↑"
local ARROW_DOWN = "↓"
local ARROW_RIGHT = "➜"

local SCROLL_SIZE = 4

local function custom_show_playlist()
	local playlist_length = mp.get_property_native("playlist-count")
	local playlist_position = mp.get_property_native("playlist-pos")

	local playlist = {}

	table.insert(playlist, "")

	if playlist_position > SCROLL_SIZE then
		table.insert(playlist, ARROW_UP .. " (" .. playlist_position - SCROLL_SIZE .. " hidden items)")
	end

	local loop_start = playlist_position - SCROLL_SIZE
	local loop_end = playlist_position + SCROLL_SIZE

	for i = (loop_start > 0 and loop_start or 0), loop_end, 1 do
		local filename = mp.get_property_native("playlist/" .. i .. "/filename")
		local basename = string.gsub(filename, "(.*/)(.*)", "%2")
		table.insert(playlist, (i == playlist_position and ARROW_RIGHT or " ") .. " " .. i + 1 .. ". - " .. basename)
	end

	if (playlist_length - playlist_position) > SCROLL_SIZE then
		table.insert(
			playlist,
			ARROW_DOWN .. " (" .. playlist_length - (playlist_position + 1) - SCROLL_SIZE .. " hidden items)"
		)
	end

	table.insert(playlist, "")

	mp.osd_message(table.concat(playlist, "\n"))
end

mp.add_forced_key_binding("'", "custom_show_playlist", custom_show_playlist)
