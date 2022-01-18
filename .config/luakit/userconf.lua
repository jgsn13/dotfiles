local modes = require("modes")
local settings = require("settings")

modes.add_binds(
    "normal",
    {
        {
            "<Control-c",
            "Copy selected text.",
            function()
                luakit.selection.clipboard = luakit.selection.primary
            end
        }
    }
)

settings.window.home_page = "https://search.brave.com"

local engines = settings.window.search_engines
engines.brave = "https://search.brave.com/search?q=%s"
engines.void = "https://docs.voidlinux.org?search=%s"
engines.aur = "https://aur.archlinux.org/packages.php?O=0&K=%s&do_Search=Go"
engines.aw = "https://wiki.archlinux.org/index.php/Special:Search?fulltext=Search&search=%s"
engines.go = "https://www.google.com/search?name=f&hl=en&q=%s"
engines.yt = "https://www.youtube.com/results?search_query=%s"

settings.window.default_search_engine = "brave"
