" Vim syntax file
" Language:	Oberon
" Maintainer:	Stephan Beyer <sbeyer@copyleft.de>
" Last Change:	2001 Aug 08

" It's a very very very simple variant of a syntax file for Oberon - but I think
" the most important thing is to get a colored view when coding ;)

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn keyword	OberonStatement		BEGIN END CODE
syn keyword	OberonModule		MODULE
syn keyword	OberonInclude		IMPORT
syn keyword	OberonConditional	IN IS = # < <= > >= IF THEN ELSE ELSIF CASE 
syn keyword	OberonOperator		MOD DIV OR / * + - & ~ 
syn keyword	OberonStatement		:= WITH DO TO OF
syn keyword	OberonRepeat		FOR WHILE REPEAT UNTIL LOOP
syn keyword	OberonProcedure		PROCEDURE
syn keyword	OberonFunction		ABS ODD CAP ASH LEN MIN MAX SIZE ORD CHR ENTIER INC DEC INCL EXCL COPY NEW HALT
syn keyword	OberonType		INTEGER STRING CHAR LONG LONGINT SHORT SHORTINT BOOLEAN REAL LONGREAL SET
syn keyword	OberonDeclaration	CONST VAR TYPE
syn keyword	OberonTypedef		POINTER ARRAY RECORD
syn keyword	OberonBoolean		TRUE FALSE
syn keyword	OberonKeyword		RETURN EXIT


" Things which should be marked in comments...
syn keyword	OberonTodo		contained TODO FIXME XXX BUG
syn cluster	OberonCommentGroup	contains=OberonTodo

" Strings, Number, Comments...
syn region	OberonString		start=+L\=['"]+ skip=+\\\\\|\\['"]+ end=+['"]+
syn match	OberonNumber		"[0-9.]"
syn region OberonComment	start="(\*" end="\*)"

if version >= 508 || !exists("did_c_syn_inits")
  if version < 508
    let did_c_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink OberonFunction			Function
  HiLink OberonConditional		Conditional
  HiLink OberonRepeat			Repeat
  HiLink OberonNumber			Number
  HiLink OberonBoolean			Boolean
  HiLink OberonOperator			Operator
  HiLink OberonType			Type
  HiLink OberonDeclaration		Type
  HiLink OberonTypedef			Typedef
  HiLink OberonInclude			Include
  HiLink OberonModule			Macro
  HiLink OberonProcedure		Tag
  HiLink OberonStatement		Statement
  HiLink OberonString			String
  HiLink OberonComment			Comment
  HiLink OberonTodo			Todo
  HiLink OberonKeyword			Keyword
  delcommand HiLink
endif

let b:current_syntax = "oberon"

