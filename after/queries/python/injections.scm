; extends

; highlight SQL inside python strings that start with a SQL keyword
; (lua-match, since vim-match only checks one line of multiline strings)
((string
  (string_content) @injection.content)
  (#lua-match? @injection.content "^%s*[Ss][Ee][Ll][Ee][Cc][Tt]%s")
  (#set! injection.language "sql"))
((string
  (string_content) @injection.content)
  (#lua-match? @injection.content "^%s*[Ii][Nn][Ss][Ee][Rr][Tt]%s")
  (#set! injection.language "sql"))
((string
  (string_content) @injection.content)
  (#lua-match? @injection.content "^%s*[Uu][Pp][Dd][Aa][Tt][Ee]%s")
  (#set! injection.language "sql"))
((string
  (string_content) @injection.content)
  (#lua-match? @injection.content "^%s*[Dd][Ee][Ll][Ee][Tt][Ee]%s")
  (#set! injection.language "sql"))
((string
  (string_content) @injection.content)
  (#lua-match? @injection.content "^%s*[Cc][Rr][Ee][Aa][Tt][Ee]%s")
  (#set! injection.language "sql"))
((string
  (string_content) @injection.content)
  (#lua-match? @injection.content "^%s*[Aa][Ll][Tt][Ee][Rr]%s")
  (#set! injection.language "sql"))
((string
  (string_content) @injection.content)
  (#lua-match? @injection.content "^%s*[Dd][Rr][Oo][Pp]%s")
  (#set! injection.language "sql"))
((string
  (string_content) @injection.content)
  (#lua-match? @injection.content "^%s*[Ww][Ii][Tt][Hh]%s")
  (#set! injection.language "sql"))
