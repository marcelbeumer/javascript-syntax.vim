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
syn cluster jsAll contains=NULL

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
" hi def link jsOpSymbols Operator
" hi def link jsLogicSymbols Operator
" hi def link jsBraces Error
" hi def link jsParens Error
" hi def link jsEndColons Comment
" hi def link jsObjAssign Constant

" Context
syn match jsContext "\<\(this\|that\)\>"
syn match jsContextAccess "\<\(this\|that\)[.\[]\"\?\w\{1,\}\"\?\]\?" contains=jsContext
hi def link jsContext Special
hi def link jsContextAccess Special

" Functions
syn match jsFuncArg "\w*" contained
syn region jsFuncArgList start=/ function(/ end="\([^)]*\)" contains=jsFuncArg,jsFunc,jsClassname
syn match jsFuncName "\w\{1,\}" contained containedin=jsFuncNameAsLeft
syn match __jsFuncNamePropLeft "\w\{1,\}\s\?:" contained contains=jsFuncName
syn match __jsFuncNamePropStatement "\w\{1,\}\s\?:.*function" contains=__jsFuncNamePropLeft,jsFunc,jsFuncArgList
syn match __jsFuncNameAsLeft "\w\{1,\}\s\?=" contained contains=jsFuncName
syn match __jsFuncNameAsStatement "\w\{1,\}\s\?=.*function" contains=__jsFuncNameAsLeft,jsFunc,jsFuncArgList
hi def link jsFuncArg Constant
hi def link jsFuncName Function

" Things based on convention or library
syn match jsClassname /\<\u\w*\>/
syn match jsUnderScore "\<_\."
syn match jsUnderscoreCalls "\<_[.\[]\"\?\w\{1,\}\"\?\]\?" contains=jsUnderScore
hi def link jsClassname Structure
hi def link jsUnderScore Special
hi def link jsUnderscoreCalls Special

" Keywords
syn keyword jsBrowser window navigator location document history
syn keyword jsModule require define exports module
syn keyword jsDev console $ jQuery debugger
syn keyword jsGlobals Array Boolean Date Function Infinity Math Number NaN Object RegExp String Error
hi def link jsBrowser Special
hi def link jsModule Special
hi def link jsGlobals Special
" hi def link jsDev Special

syn keyword jsTypes true false null undefined
syn keyword jsProto prototype
syn keyword jsFunc function
syn keyword jsClasses class extends constructor
syn keyword jsInstances delete new instanceof typeof
syn keyword jsIdentifier arguments var let void yield
syn keyword jsControls if else switch do while for in try catch throw finally return with break continue case default
syn keyword jsMessage alert confirm prompt status
hi def link jsTypes Type
hi def link jsProto Type
hi def link jsFunc Keyword
hi def link jsClasses Keyword
hi def link jsInstances Keyword
hi def link jsControls Keyword
hi def link jsMessage Keyword
hi def link jsIdentifier Keyword

syn keyword jsReserved abstract enum int short boolean export interface static byte long super char final native synchronized float package throws const goto private transient implements protected volatile double import public
hi def link jsReserved Error

" " TODO: update list
" syn cluster jsAll add=jsComment,jsLineComment,jsDocComment,jsStringD,jsStringS,jsRegexpString,jsNumber,jsFloat,jsLabel,jsSource,jsOperator,jsBoolean,jsNull,jsFunc,jsConditional,jsRepeat,jsBranch,jsStatement,jsGlobalObjects,jsMessage,jsIdentifier,jsExceptions,jsReserved,jsDomErrNo,jsDomNodeConsts,jsDotNotation,jsBrowserObjects,jsDOMObjects,jsAjaxObjects,jsDOMMethods,jsHtmlElemProperties,jsDOMProperties,jsEventListenerMethods,jsAjaxProperties,jsAjaxMethods,jsFuncArg,jsClassname,jsObjAssign,jsUnderscoreCalls,jsFuncArgList,jsFunc

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
