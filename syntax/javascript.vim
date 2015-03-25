" Vim syntax file
" Language:     JavaScript
" Author:       Marcel Bumer <http://github.com/marcelbeumer>
" Website:      http://github.com/marcelbeumer/javascript-syntax.vim
" Credits:      Jose Elera Campana <https://github.com/jelera>

if !exists("main_syntax")
  if exists("b:current_syntax")
    finish
  endif
  let main_syntax = 'javascript'
endif

setlocal iskeyword+=$
syn sync fromstart

" Comments
syn match jsNodeSheBang "^#!.*/bin/env\s\+node\>"
syn keyword jsCommentTodo TODO FIXME XXX TBD contained
syn match jsLineComment "\/\/.*" contains=@Spell,jsCommentTodo
syn match jsCommentSkip "^[ \t]*\*\($\|[ \t]\+\)"
syn region jsComment start="/\*"  end="\*/" contains=@Spell,jsCommentTodo
hi def link jsNodeSheBang Comment
hi def link jsComment Comment
hi def link jsLineComment Comment
hi def link jsCommentTodo Todo

" Strings
syn match jsSpecial "\\\d\d\d\|\\."
syn region jsStringD start=+"+ skip=+\\\\\|\\"+ end=+"\|$+ contains=jsSpecial,@htmlPreproc
syn region jsStringS start=+'+ skip=+\\\\\|\\'+ end=+'\|$+ contains=jsSpecial,@htmlPreproc
syn region jsRegexpString start=+/[^/*]+me=e-1 skip=+\\\\\|\\/+ end=+/[gi]\{0,2\}\s*$+ end=+/[gi]\{0,2\}\s*[;.,)\]}]+me=e-1 contains=@htmlPreproc oneline
hi def link jsStringS String
hi def link jsStringD String
hi def link jsRegexpString String
hi def link jsSpecial Special

" Numbers
syn match jsNumber "-\=\<\d\+L\=\>\|0[xX][0-9a-fA-F]\+\>"
syn match jsFloat /\<-\=\%(\d\+\.\d\+\|\d\+\.\|\.\d\+\)\%([eE][+-]\=\d\+\)\=\>/
hi def link jsNumber Number
hi def link jsFloat Number

" Symbols and operators
syn match jsBraces "[{}\[\]]"
syn match jsParens "[()]"
syn match jsOpSymbols "=\{1,3}\|!==\|!=\|<\|>\|>=\|<=\|++\|+=\|--\|-="
syn match jsEndColons "[;,]" " all ; and ,
syn match jsLogicSymbols "\(&&\)\|\(||\)"
syn match jsObjAssign /@\?\I\i*\s*\ze::\@!/ " like foo: 12

" Functions
syn keyword jsFunc function contained
syn match jsArrowFunc "=>"
syn match jsFuncName "\w\{1,\}" contained
syn match jsFuncDef "\(\w\{1,\}\s*[:=]\s*\)\?\<function\>\*\?\(\s*\w\{1,\}\)\?" contains=jsFunc,jsFuncName
syn match jsArrowFuncDef "\w\{1,\}\s*=\s*\((.*)\|\S\{1,\}\)\s*=>" contains=jsArrowFunc,jsFuncName,_jsArgsToArrow
syn match _jsArgsToArrow "\((.*)\|\S\{1,\}\)\s*=>" contained
hi def link jsFunc Keyword
hi def link jsFuncName Function

" Classes
syn keyword jsClasses class extends constructor
syn match jsClassname /\<\u\w*\>/
syn match jsMethodName "\w\{1,\}" contained
syn match jsMethodArgs "(.\{-})" contained
syn match jsMethodDef "^\s*\w\{1,\}\s*(.\{-})\s*{" contains=jsMethodName,jsMethodArgs
syn match _non_jsMethodDef "^\s*\(for\|if\|else\|switch\|do\|while\|try\|catch\|finally\|with\)\s*" contains=jsControls
hi def link jsClassname Structure
hi def link jsClasses Keyword
hi def link jsMethodName Function


" Things based on convention or library
syn match jsUnderScore "\<_\."
syn match jsUnderscoreCalls "\<_[.\[]\"\?\w\{1,\}\"\?\]\?" contains=jsUnderScore
hi def link jsUnderScore Special
hi def link jsUnderscoreCalls Special

" Keywords
syn keyword jsBrowser window navigator location document history
syn keyword jsModule require define export default exports module import from as
syn keyword jsDev console debugger logger
syn keyword jsGlobals Array Boolean Date Function Infinity Math Number NaN Object RegExp String Error
hi def link jsBrowser Special
hi def link jsModule Special
hi def link jsGlobals Special
hi def link jsDev Special

syn keyword jsTypes true false null undefined
syn keyword jsContext this that
syn keyword jsProto prototype
syn keyword jsInstances delete new instanceof typeof
syn keyword jsIdentifier arguments super var let const void yield yield*
syn keyword jsControls if else switch do while for in try catch throw finally return with break continue case default
syn keyword jsMessage alert confirm prompt status
hi def link jsContext Keyword
hi def link jsTypes Type
hi def link jsProto Type
hi def link jsInstances Keyword
hi def link jsControls Keyword
hi def link jsMessage Keyword
hi def link jsIdentifier Keyword

syn keyword jsReserved abstract enum int short boolean interface static byte long char final native synchronized float package throws goto private transient implements protected volatile double public
hi def link jsReserved Error

function! JavaScriptFold()
    setl foldmethod=syntax
    setl foldlevelstart=1
    syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend
    setl foldtext=FoldText()
endfunction

let b:current_syntax = "javascript"
if main_syntax == 'javascript'
  unlet main_syntax
endif
