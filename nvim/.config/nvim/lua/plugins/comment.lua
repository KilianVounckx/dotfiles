return {
    "numToStr/Comment.nvim",
    config = function()
        require("Comment.ft").set("flix", { "//%s", "/*%s*/" })
    end,
}
