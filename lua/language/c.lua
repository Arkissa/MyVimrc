require "lsp" {
    lsp = "clangd",
    -- auto_format = true,
    opt = {
        init_options = {
            fallbackFlags = { "-xc", "-std=gnu2x", "-Wall" },
        },
        cmd = { "clangd"
        , "--enable-config"
        , "--suggest-missing-includes"
        , "--background-index" -- 后台建立索引，并持久化到disk
        , "--clang-tidy"       -- 开启clang-tidy
        , "--clang-tidy-checks=performance-*,bugprone-*"
        , "--completion-style=detailed"
        , "--cross-file-rename=true"
        , "--header-insertion=iwyu"
        , "--pch-storage=memory"
        , "--function-arg-placeholders=false"
        , "--ranking-model=decision_forest"
        , "--header-insertion-decorators"
        , "--pretty"
        , "--all-scopes-completion"
        },
    }
}
