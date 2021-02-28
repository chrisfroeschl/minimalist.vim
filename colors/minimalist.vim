" File: minimalist.vim
" Maintainer: Chris Fröschl <cfroeschl@protonmail.com>
" Last Modified: Sun 28 Feb 2021 10:40:30 AM CET
" License:
" Copyright (c) Chris Fröschl. Distributed under the same terms as Vim itself.
" See :help license
"
" Description:
" Minimal Vim theme.

" Starter boilerplate. {{{

if version > 580
highlight clear
    if exists("syntax_on")
        syntax reset
    endif
endif

set background=dark
let g:colors_name='minimalist'

" }}}

" Value palettes. {{{

let s:bold = 'bold,'
let s:italic = 'italic,'
let s:underline = 'underline,'
let s:reverse = 'reverse,'
let s:none = ['NONE', 'NONE']

let s:black = [0, '#000000']
let s:maroon = [1, '#800000']
let s:green = [2, '#008000']
let s:olive = [3, '#808000']
let s:navy = [4, '#000080']
let s:purple = [5, '#800080']
let s:teal = [6, '#008080']
let s:silver = [7, '#c0c0c0']
let s:grey = [8, '#808080']
let s:red = [9, '#ff0000']
let s:lime = [10, '#00ff00']
let s:yellow = [11, '#ffff00']
let s:blue = [12, '#0000ff']
let s:fuchsia = [13, '#ff00ff']
let s:aqua = [14, '#00ffff']
let s:white = [15, '#ffffff']

" }}}

" Helper Function {{{

" Arguments group, ctermfg ctermbg cterm
function s:HL(group, fg, ...)
    " Foreground.
    let fg = a:fg

    " Background.
    if a:0 >= 1
        let bg = a:1
    else
        let bg = s:none
    endif

    " Special.
    if a:0 >= 2 && strlen(a:2)
        let sp = a:2
        if a:0 >= 3 && strlen(a:3)
            let sp = a:2 . a:3
        endif
    else
        let sp = 'NONE,'
    endif

    let histring = [
    \ 'highlight', a:group,
    \ 'ctermfg=' . fg[0], 'guifg=' . fg[1],
    \ 'ctermbg=' . bg[0], 'guibg=' . bg[1],
    \ 'term=' . sp[:-2], 'cterm=' . sp[:-2], 'gui=' . sp[:-2]
    \ ]

    execute join(histring, ' ')
endfunction

" }}}

" Version 700 bound. {{{

if version >= 700
    call s:HL('CursorLine', s:none)
    highlight! link CursorColumn CursorLine 

    call s:HL('TabLine', s:white)
    highlight! link TabLineFill TabLine 
    highlight! link TabLineSel TabLine 

    call s:HL('Pmenu', s:black, s:white)
    call s:HL('PmenuSel', s:white, s:none, s:bold)
    call s:HL('PmenuSbar', s:none, s:silver)
    call s:HL('PmenuThumb', s:none, s:black)

    call s:HL('MatchParen', s:white, s:grey, s:bold)
endif

" }}}

" Version 703 bound. {{{

if version >= 703
    call s:HL('ColorColumn', s:none, s:grey)
    call s:HL('Conceal', s:aqua)
    call s:HL('CursorLineNr', s:white, s:none, s:bold)
endif

" }}}

" Vim highlighting. {{{

call s:HL('Normal', s:white)
call s:HL('Visual', s:none, s:grey)
highlight! link VisualNOS Visual

call s:HL('Search', s:yellow, s:black, s:reverse)
call s:HL('IncSearch', s:olive, s:black, s:reverse)

call s:HL('SpecialKey', s:lime, s:none, s:bold)
call s:HL('NonText', s:none)
call s:HL('Underline', s:none, s:none, s:underline)

call s:HL('StatusLine', s:white, s:black)
call s:HL('StatusLineNC', s:grey, s:black)
call s:HL('VertSplit', s:white)
call s:HL('Terminal', s:white)
call s:HL('EndOfBuffer', s:white)

call s:HL('WildMenu', s:white)
call s:HL('ErrorMsg', s:red)
call s:HL('MoreMsg', s:silver)
call s:HL('Question', s:blue)
call s:HL('WarningMsg', s:yellow)

call s:HL('LineNr', s:white)
call s:HL('SignColumn', s:none)
call s:HL('Folded', s:white, s:none ,s:bold)
highlight! link FoldColumn Folded

call s:HL('Cursor', s:none)
call s:HL('vCursor', s:none)
call s:HL('iCursor', s:none)
call s:HL('lCursor', s:none)

call s:HL('Special', s:lime)
call s:HL('Comment', s:silver)
call s:HL('Todo', s:white, s:none, s:underline, s:bold)
call s:HL('Error', s:red, s:none, s:bold)

" }}}

" General Programming highlighting. {{{

call s:HL('Statement', s:red)
call s:HL('Conditional', s:fuchsia)
call s:HL('Repeat', s:fuchsia)
call s:HL('Label', s:fuchsia)
highlight! link Exception Error
call s:HL('Operator', s:white, s:none, s:bold)
highlight! link Keyword Special
highlight! link Identifier SpecialKey
call s:HL('Function', s:lime)
call s:HL('PreProc', s:lime)
call s:HL('Include', s:aqua)
highlight! link Define Include
call s:HL('Macro', s:aqua)
call s:HL('PreCondit', s:aqua)
call s:HL('Constant', s:fuchsia)
highlight! link Character Constant
call s:HL('String', s:green)
call s:HL('Boolean', s:lime)
call s:HL('Number', s:white)
highlight! link Float Number
call s:HL('Type', s:olive, s:none, s:bold)
call s:HL('StorageClass', s:yellow)
call s:HL('Structure', s:lime)
highlight! link Typedef Structure

" }}}

" Versioning highlighting. {{{

call s:HL('DiffDelete', s:maroon)
highlight! link diffRemoved DiffDelete
highlight! link GitGutterDelete DiffDelete
call s:HL('DiffAdd', s:green)
highlight! link diffAdded DiffAdd
highlight! link GitGutterAdd DiffAdd
call s:HL('DiffChange', s:olive)
highlight! link diffChanged DiffChange
highlight! link GitGutterChange DiffChange
call s:HL('DiffText', s:none)
call s:HL('diffFile', s:yellow)
call s:HL('diffNewFile', s:yellow)
call s:HL('diffLine', s:aqua)

" }}}

" Spell highlighting. {{{

if has("spell")
    call s:HL('SpellCap', s:red, s:none, s:bold)
    call s:HL('SpellBad', s:red, s:none, s:underline)
    call s:HL('SpellLocal', s:aqua, s:none, s:underline)
    call s:HL('SpellRare', s:silver, s:none, s:underline)
endif

" }}}

" Netrw highlighting. {{{

call s:HL('netrwDir', s:green)
call s:HL('netrwClassify', s:green)
call s:HL('netrwLink', s:fuchsia)
call s:HL('netrwExe', s:red)
highlight! link netrwComment Comment
highlight! link netrwHelpCmd Comment
highlight! link netrwCmdSep Comment
highlight! link netrwVersion Comment
call s:HL('netrwList', s:aqua)

" }}}

" Coc highlighting. {{{

highlight! link CocErrorSign ErrorMsg
highlight! link CocWarningSign WarningMsg
call s:HL('CocInfoSign', s:fuchsia, s:none, s:underline)
highlight! link CocHintSign MoreMsg
call s:HL('CocErrorFloat', s:black, s:white)
highlight! link CocWarningFloat CocErrorFloat
highlight! link CocInfoFloat CocErrorFloat
highlight! link CocHintFloat CocErrorFloat
highlight! link CocDiagnosticsError ErrorMsg
highlight! link CocDiagnosticsWarning WarningMsg
highlight! link CocDiagnosticsInfo MoreMsg
highlight! link CocDiagnosticHint MoreMsg
call s:HL('CocErrorHighlight', s:none, s:none, s:underline)
call s:HL('CocWarningHighlight', s:none, s:none, s:underline)
call s:HL('CocInfoHighlight', s:none, s:none, s:underline)
call s:HL('CocHintHighlight', s:none, s:none, s:underline)

" }}}

" HTML highlighting. {{{

call s:HL('htmlTag', s:red)
highlight! link htmlEndTag htmlTag
highlight! link htmlTagName Normal
highlight! link htmlArg htmlTag
call s:HL('htmlScriptTag', s:yellow, s:none, s:bold)
highlight! link htmlTagN Normal
highlight! link htmlSpecialTagName Normal
highlight! link htmlSpecialChar Special
call s:HL('htmlLink', s:red, s:none, s:underline)
call s:HL('htmlBold', s:none, s:none, s:bold)
call s:HL('htmlItalic', s:none, s:none, s:italic)
call s:HL('htmlUnderline', s:none, s:none, s:underline)
call s:HL('htmlUnderlineItalic', s:none, s:none, s:underline, s:italic)
call s:HL('htmlBoldUnderline', s:none, s:none, s:bold, s:underline)
call s:HL('htmlBoldItalic', s:none, s:none, s:bold, s:italic)
call s:HL('htmlBoldUnderline', s:none, s:none, s:bold, s:italic, s:underline)

" }}}

" XML highlighting. {{{

highlight! link xmlTag htmlTag
highlight! link xmlEndTag htmlTag
highlight! link xmlTagName Normal
highlight! link xmlEqual Normal
highlight! link docbkKeyword Keyword
call s:HL('xmlDocTypeDecl', s:silver)
highlight! link xmlDocTypeKeyword  Keyword
call s:HL('xmlCdataStart', s:silver)
call s:HL('xmlCdataCdata', s:fuchsia)
call s:HL('dtdFunction', s:silver)
highlight! link dtdTagName Normal
highlight! link xmlAttrib htmlTag
call s:HL('xmlProcessingDelim', s:silver)
call s:HL('dtdParamEntityPunct', s:silver)
call s:HL('xmlEntity', s:yellow)
call s:HL('xmlEntityPunct', s:yellow)

" }}}

" Vim highlighting. {{{

call s:HL('vimCommentTitle', s:white, s:none, s:bold)
call s:HL('vimNotation', s:yellow)
call s:HL('vimBracket', s:yellow)
highlight! link vimMapModKey Special
highlight! link vimFuncSID Normal
highlight! link vimSetSep Normal
highlight! link vimContinue Normal

" }}}

" C highlighting. {{{

highlight! link cOperator Operator
highlight! link cStructure Structure

" }}}

" Python highlighting. {{{

call s:HL('pythonBuiltin', s:yellow)
highlight! link pythonBuiltinObj pythonBuiltin
highlight! link pythonBuiltinFunc pythonBuiltin
highlight! link pythonFunction Function
highlight! link pythonDecorator Normal
highlight! link pythonInclude Include
highlight! link pythonImport Include
call s:HL('pythonRun', s:fuchsia)
call s:HL('pythonRun', s:fuchsia)
highlight! link pythonOperator Operator
highlight! link pythonException Error
highlight! link pythonBoolean Boolean
highlight! link pythonDot Normal
highlight! link pythonConditional Conditional
highlight! link pythonRepeat Repeat
highlight! link pythonDottedName Normal

" }}}

" CSS highlighting. {{{

call s:HL('cssBraces', s:lime)
highlight! link cssFunctionName Function
highlight! link cssIdentifier Identifier
highlight! link cssClassName Normal
highlight! link cssColor Comment
highlight! link cssSelectorOp Normal
highlight! link cssSelectorOp2 Normal
call s:HL('cssImportant', s:red)
highlight! link cssVendor Normal
highlight! link cssTextProp String
highlight! link cssAnimationProp String
highlight! link cssUIProp String
highlight! link cssTransformProp String
highlight! link cssTransitionProp String
highlight! link cssBoxProp String
highlight! link cssFontDescriptiorProp String
highlight! link cssFlexibleBoxProp String
highlight! link cssBorderOutlineProp String
highlight! link cssBackgroundProp String
highlight! link cssMarginProp String
highlight! link cssListProp String
highlight! link cssTableProp String
highlight! link cssFontProp String
highlight! link cssPaddingProp String
highlight! link cssDimensionProp String
highlight! link cssRenderProp String
highlight! link cssColorProp String
highlight! link cssGeneratedContentProp String

" }}}

" JavaScript highlighting. {{{

highlight! link javaScriptBraces cssBraces
highlight! link javaScriptFunction Function
highlight! link javaScriptIdentifier Identifier
highlight! link javaScriptMember Normal
highlight! link javaScriptNumber Number
highlight! link javaScriptNull Keyword
call s:HL('javaScriptParens', s:silver)
highlight! link javascriptImport Include
highlight! link javascriptExport Include
call s:HL('javascriptClassKeyword', s:yellow)
call s:HL('javascriptClassExtends', s:fuchsia)
highlight! link javascriptDefault Special
highlight! link javascriptClassName Normal
highlight! link javascriptClassSuperName Normal
highlight! link javascriptGlobal Special
highlight! link javascriptEndColons Normal
highlight! link javascriptFuncArg Normal
highlight! link javascriptGlobalMethod Normal
highlight! link javascriptNodeGlobal Normal
highlight! link javascriptBOMWindowProp Normal
highlight! link javascriptArrayMethod Normal
highlight! link javascriptArrayStaticMethod Normal
highlight! link javascriptCacheMethod Normal
highlight! link javascriptDateMethod Normal
highlight! link javascriptMathStaticMethod Normal
highlight! link javascriptURLUtilsProp Normal
highlight! link javascriptBOMNavigatorProp Normal
highlight! link javascriptDOMDocMethod Normal
highlight! link javascriptDOMDocProp Normal
highlight! link javascriptBOMLocationMethod Normal
highlight! link javascriptStringMethod Normal
highlight! link javascriptVariable Normal
highlight! link javascriptIdentifier Identifier
highlight! link javascriptClassSuper Identifier
highlight! link javascriptFuncKeyword Function
highlight! link javascriptAsyncFunc Function
highlight! link javascriptClassStatic Normal
highlight! link javascriptOperator Operator
highlight! link javascriptForOperator Statement
highlight! link javascriptYield Statement
highlight! link javascriptExceptions Exception
highlight! link javascriptMessage Normal
highlight! link javascriptTemplateSB Normal
highlight! link javascriptTemplateSubstitution Normal
highlight! link javascriptLabel Label
highlight! link javascriptObjectLabel Label
highlight! link javascriptPropertyName Label
highlight! link javascriptLogicSymbols Operator
highlight! link javascriptLogicSymbols Keyword
highlight! link javascriptArrowFunc Function
highlight! link javascriptDocParamName Normal
highlight! link javascriptDocTags Special
highlight! link javascriptDocNotation Special
highlight! link javascriptDocParamType Special
call s:HL('javascriptBrackets', s:silver)
highlight! link javascriptDOMElemAttrs Normal
highlight! link javascriptDOMEventMethod Normal
highlight! link javascriptDOMNodeMethod Normal
highlight! link javascriptDOMStorageMethod Normal
highlight! link javascriptHeadersMethod Normal
highlight! link javascriptAsyncFuncKeyword Keyword
highlight! link jsClassKeyword javascriptClassKeyword
highlight! link jsExportDefault Special
highlight! link jsTemplateBraces cssBraces
highlight! link jsGlobalNodeObjects Special
highlight! link jsGlobalObjects Special
highlight! link jsParens javaScriptParens
highlight! link jsFunction Function
highlight! link jsFuncParens javaScriptParens
highlight! link jsNull Keyword
highlight! link jsUndefined Keyword
highlight! link jsClassDefinition Keyword

" }}}

" TypeScript highlighting. {{{

highlight! link typeScriptReserved Keyword
highlight! link typeScriptLabel Label
highlight! link typeScriptFuncKeyword Function
highlight! link typeScriptIdentifier Identifier
highlight! link typeScriptBraces cssBraces
highlight! link typeScriptEndColons Normal
highlight! link typeScriptDOMObjects Normal
highlight! link typeScriptAjaxMethods Normal
highlight! link typeScriptDocParam Normal
highlight! link typeScriptDocSeeTag Special
highlight! link typeScriptDocTags Special
highlight! link typeScriptGlobalObjects Normal
highlight! link typeScriptParens javaScriptParens
highlight! link typeScriptOpSymbols Keyword
highlight! link typeScriptHtmlElemProperties Normal
highlight! link typeScriptNull Keyword
highlight! link typeScriptInterpolationDelimiter Delimiter

" }}}

" Java highlighting. {{{

highlight! link javaAnnotation Keyword
highlight! link javaDocTags Special
highlight! link javaCommentTitle vimCommentTitle
highlight! link javaParen Normal
highlight! link javaParen1 Normal
highlight! link javaParen2 Normal
highlight! link javaParen3 Normal
highlight! link javaParen3 Normal
highlight! link javaParen4 Normal
highlight! link javaParen5 Normal
highlight! link javaOperator Operator
highlight! link javaVarArg Normal

" }}}

" Markdown highlighting. {{{

call s:HL('markdownItalic', s:silver, s:none, s:italic)
call s:HL('markdownH1', s:white, s:none, s:bold)
call s:HL('markdownH2', s:white, s:none, s:bold)
call s:HL('markdownH3', s:white, s:none, s:bold)
call s:HL('markdownH4', s:white, s:none, s:bold)
call s:HL('markdownH5', s:white, s:none, s:bold)
call s:HL('markdownH6', s:white, s:none, s:bold)
highlight! link markdownCode Special
highlight! link markdownCodeBlock String
highlight! link markdownCodeDelimiter Delimiter
highlight! link markdownBlockquote String
highlight! link markdownListMarker Keyword
highlight! link markdownRule Normal
highlight! link markdownHeadingRule Normal
highlight! link markdownUrlDelimiter Delimiter
highlight! link markdownTextDelimiter Delimiter
highlight! link markdownHeadingDelimiter Delimiter
highlight! link markdownUrl htmlLink
highlight! link markdownTitleDelimiter Delimiter
highlight! link markdownLinkText Normal
highlight! link markdownIdDeclaration Normal

" }}}

" JSON highlighting. {{{

highlight! link jsonKeyword Keyword
highlight! link jsonQuote Normal
highlight! link jsonBraces cssBraces
highlight! link jsonString String

" }}}

" Roff hightlight. {{{

call s:HL('nroffDefinition', s:none, s:none, s:italic)
call s:HL('nroffDefSpecial', s:none, s:none, s:italic, s:bold)

" }}}
