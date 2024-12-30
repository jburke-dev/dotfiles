local lsp_util = require("lspconfig.util")

return {
    root_dir = function (fname)
        return lsp_util.root_pattern("nx.json")(fname) or lsp_util.root_pattern("package.json", "tsconfig.json", ".git")(fname)
    end
}
