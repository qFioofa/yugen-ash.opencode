# yugen-ash.nvim highlight groups → opencode zones

Correlation of every language highlight group in [yugen-ash.nvim](https://github.com/qFioofa/yugen-ash.nvim) (legacy vimscript groups + Treesitter captures) with opencode's highlight zones. opencode themes only expose generic zones (`syntax*` / `secondary` / UI), so each nvim group is assigned the closest zone by semantic role and color. Styles (bold/italic/underline) are preserved where the source sets them.

Colors: **dark** from the `main` palette, **light** from the `light` palette of `palette.lua`; identical to `defs` in `src/yugen-ash.json`.

## Legend: role → zone

- **crimson** — Keywords, declarations, storage, modifiers, structures, includes, preproc → `syntaxKeyword`
- **tide** — Control flow, booleans, `keyword.operator`, property keys → `secondary`
- **primary** — Functions, methods, commands, constructors, headings → `syntaxFunction`
- **sage** — Strings, characters, templates, markup tags → `syntaxString`
- **gold** — Types, classes/structs/enums, modules → `syntaxType`
- **amber** — Builtin types, annotations/decorators/attributes → `syntaxType` / `syntaxKeyword`
- **violet** — Numbers, constants/macros, null/nil/self, builtin variables → `syntaxNumber`
- **frost** — Operators, sigils, arrows → `syntaxOperator`
- **seafoam** — Labels, atoms/symbols, paths, ids → `syntaxVariable`
- **coral** — Interpolation, regex, special punctuation → `syntaxPunctuation`
- **rust** — Escapes and special characters → `syntaxString`
- **color200** — Identifiers and plain variables → `syntaxVariable`
- **color300** — Object members / properties → `syntaxVariable`
- **color400** — Comments and docstrings (groups) / delimiters, punctuation (others) → `syntaxComment` / `syntaxPunctuation`
- **color500** — Members (generic captures) → `syntaxVariable`
- **error / success / warning** — Diagnostics-ish tokens → `error` / `success` / `warning`

## Generic layers

### Generic syntax (`groups/syntax.lua`)

| Highlight group | yugen-ash role | opencode zone | dark | light | style / link |
| --------------- | -------------- | ------------- | ---- | ----- | ------------ |
| `Constant` | tide | `secondary` | #79a0aa | #2563EB |  |
| `String` | sage | `syntaxString` | #9db89c | #059669 |  |
| `Character` | sage | `syntaxString` | #9db89c | #059669 |  |
| `Number` | violet | `syntaxNumber` | #c678dd | #7C3AED |  |
| `Boolean` | tide | `secondary` | #79a0aa | #2563EB |  |
| `Float` | violet | `syntaxNumber` | #c678dd | #7C3AED |  |
| `Identifier` | color200 | `syntaxVariable` | #D4D4D4 | #333333 |  |
| `Function` | primary | `syntaxFunction` | #FFBE89 | #D97706 |  |
| `Statement` | color200 | `syntaxVariable` | #D4D4D4 | #333333 |  |
| `Conditional` | tide | `secondary` | #79a0aa | #2563EB |  |
| `Repeat` | tide | `secondary` | #79a0aa | #2563EB |  |
| `Label` | seafoam | `syntaxVariable` | #8dd3c3 | #0D9488 |  |
| `Operator` | frost | `syntaxOperator` | #96a8ad | #2563EB |  |
| `Keyword` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `Exception` | tide | `secondary` | #79a0aa | #2563EB |  |
| `PreProc` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `Include` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `Type` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `Special` | rust | `syntaxString` | #bc735c | #DC2626 |  |
| `Tag` | primary | `syntaxFunction` | #FFBE89 | #D97706 |  |
| `Delimiter` | color200 | `syntaxVariable` | #D4D4D4 | #333333 |  |
| `SpecialComment` | color300 | `syntaxVariable` | #A9A9A9 | #555555 |  |
| `Comment` | color400 | `syntaxComment` | #696969 | #777777 |  |
| `Underlined` | — | `—` | — | — | underline |
| `Bold` | — | `—` | — | — | bold |
| `Italic` | — | `—` | — | — | italic |

### Generic Treesitter captures (`groups/treesitter.lua`)

| Highlight group | yugen-ash role | opencode zone | dark | light | style / link |
| --------------- | -------------- | ------------- | ---- | ----- | ------------ |
| `@variable` | color200 | `syntaxVariable` | #D4D4D4 | #333333 |  |
| `@property` | color300 | `syntaxVariable` | #A9A9A9 | #555555 |  |
| `@variable.builtin` | violet | `syntaxVariable` | #c678dd | #7C3AED |  |
| `@variable.parameter` | color200 | `syntaxVariable` | #D4D4D4 | #333333 | italic |
| `@variable.member` | color500 | `syntaxVariable` | #505050 | #999999 |  |
| `@variable.object.property` | color500 | `syntaxVariable` | #505050 | #999999 |  |
| `@constructor` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `@constant` | violet | `syntaxNumber` | #c678dd | #7C3AED | bold |
| `@constant.builtin` | tide | `secondary` | #79a0aa | #2563EB |  |
| `@constant.macro` | violet | `syntaxNumber` | #c678dd | #7C3AED | bold |
| `@function` | primary | `syntaxFunction` | #FFBE89 | #D97706 | link → `Function` |
| `@function.call` | primary | `syntaxFunction` | #FFBE89 | #D97706 | link → `Function` |
| `@function.builtin` | primary | `syntaxFunction` | #FFBE89 | #D97706 |  |
| `@function.macro` | primary | `syntaxFunction` | #FFBE89 | #D97706 | bold |
| `@keyword` | crimson | `syntaxKeyword` | #bf616a | #DC2626 | link → `Keyword` |
| `@keyword.function` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `@keyword.import` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `@keyword.operator` | frost | `syntaxOperator` | #96a8ad | #2563EB | link → `Operator` |
| `@keyword.return` | crimson | `syntaxKeyword` | #bf616a | #DC2626 | link → `Keyword` |
| `@keyword.coroutine` | tide | `secondary` | #79a0aa | #2563EB |  |
| `@keyword.export` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `@parameter` | color200 | `syntaxVariable` | #D4D4D4 | #333333 |  |
| `@method` | primary | `syntaxFunction` | #FFBE89 | #D97706 |  |
| `@operator` | frost | `syntaxOperator` | #96a8ad | #2563EB |  |
| `@punctuation.delimiter` | color400 | `syntaxPunctuation` | #696969 | #777777 |  |
| `@punctuation.bracket` | color400 | `syntaxPunctuation` | #696969 | #777777 |  |
| `@string` | sage | `syntaxString` | #9db89c | #059669 | link → `String` |
| `@string.documentation` | color400 | `syntaxComment` | #696969 | #777777 |  |
| `@string.regexp` | coral | `syntaxPunctuation` | #FF9E8B | #EA580C |  |
| `@string.escape` | rust | `syntaxString` | #bc735c | #DC2626 |  |
| `@tag` | sage | `syntaxString` | #9db89c | #059669 |  |
| `@tag.attribute` | gold | `syntaxType` | #D4A017 | #B45309 | italic |
| `@text` | color200 | `syntaxVariable` | #D4D4D4 | #333333 |  |
| `@text.title` | primary | `syntaxFunction` | #FFBE89 | #D97706 | bold |
| `@type` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `@type.builtin` | amber | `syntaxType` | #D4A76A | #D97706 |  |
| `@type.qualifier` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `@type.definition` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `@label` | seafoam | `syntaxVariable` | #8dd3c3 | #0D9488 |  |
| `@conditional` | tide | `secondary` | #79a0aa | #2563EB |  |
| `@repeat` | tide | `secondary` | #79a0aa | #2563EB |  |
| `@storageclass` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `@structure` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `@include` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `@exception` | tide | `secondary` | #79a0aa | #2563EB |  |
| `@comment` | color400 | `syntaxComment` | #696969 | #777777 |  |
| `@comment.error` | error | `error` | #F57A7A | #DC2626 |  |
| `@comment.warning` | warning | `warning` | #FFF2AF | #D97706 |  |
| `@comment.hint` | success | `success` | #7EAB8E | #059669 |  |
| `@comment.todo` | gold | `syntaxType` | #D4A017 | #B45309 | bold |

## Languages

### Bash / shell (`langs/bash.lua`)

| Highlight group | yugen-ash role | opencode zone | dark | light | style / link |
| --------------- | -------------- | ------------- | ---- | ----- | ------------ |
| `shStatement` | color200 | `syntaxVariable` | #D4D4D4 | #333333 |  |
| `shFunctionKey` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `shFunctionName` | primary | `syntaxFunction` | #FFBE89 | #D97706 |  |
| `shConditional` | tide | `secondary` | #79a0aa | #2563EB |  |
| `shRepeat` | tide | `secondary` | #79a0aa | #2563EB |  |
| `shLoop` | tide | `secondary` | #79a0aa | #2563EB |  |
| `shCase` | tide | `secondary` | #79a0aa | #2563EB |  |
| `shCaseLabel` | seafoam | `syntaxVariable` | #8dd3c3 | #0D9488 |  |
| `shCaseEsac` | tide | `secondary` | #79a0aa | #2563EB |  |
| `shShellVariables` | violet | `syntaxVariable` | #c678dd | #7C3AED |  |
| `shVariable` | color200 | `syntaxVariable` | #D4D4D4 | #333333 |  |
| `shVarAssign` | tide | `secondary` | #79a0aa | #2563EB |  |
| `shDerefSimple` | violet | `syntaxNumber` | #c678dd | #7C3AED |  |
| `shDerefVar` | violet | `syntaxNumber` | #c678dd | #7C3AED |  |
| `shDeref` | violet | `syntaxNumber` | #c678dd | #7C3AED |  |
| `shCommandSub` | color200 | `syntaxVariable` | #D4D4D4 | #333333 |  |
| `shCmdSubRegion` | color200 | `syntaxVariable` | #D4D4D4 | #333333 |  |
| `shString` | sage | `syntaxString` | #9db89c | #059669 |  |
| `shSingleQuote` | sage | `syntaxString` | #9db89c | #059669 |  |
| `shDoubleQuote` | sage | `syntaxString` | #9db89c | #059669 |  |
| `shQuote` | sage | `syntaxString` | #9db89c | #059669 |  |
| `shTestOpr` | frost | `syntaxOperator` | #96a8ad | #2563EB |  |
| `shOption` | amber | `syntaxKeyword` | #D4A76A | #D97706 |  |
| `shOperator` | frost | `syntaxOperator` | #96a8ad | #2563EB |  |
| `shRange` | color200 | `syntaxVariable` | #D4D4D4 | #333333 |  |
| `shRedir` | tide | `secondary` | #79a0aa | #2563EB |  |
| `shSetList` | color200 | `syntaxVariable` | #D4D4D4 | #333333 |  |
| `shSpecial` | rust | `syntaxString` | #bc735c | #DC2626 |  |
| `shSpecialDQ` | rust | `syntaxString` | #bc735c | #DC2626 |  |
| `shEscape` | rust | `syntaxString` | #bc735c | #DC2626 |  |
| `shComment` | color400 | `syntaxComment` | #696969 | #777777 |  |
| `shShebang` | color400 | `syntaxComment` | #696969 | #777777 |  |
| `shAlias` | primary | `syntaxFunction` | #FFBE89 | #D97706 |  |
| `@keyword.bash` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `@keyword.conditional.bash` | tide | `secondary` | #79a0aa | #2563EB |  |
| `@keyword.repeat.bash` | tide | `secondary` | #79a0aa | #2563EB |  |
| `@function.bash` | primary | `syntaxFunction` | #FFBE89 | #D97706 |  |
| `@function.builtin.bash` | primary | `syntaxFunction` | #FFBE89 | #D97706 |  |
| `@variable.bash` | color200 | `syntaxVariable` | #D4D4D4 | #333333 |  |
| `@variable.parameter.bash` | violet | `syntaxVariable` | #c678dd | #7C3AED |  |
| `@string.special.bash` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `@string.special.path.bash` | sage | `syntaxString` | #9db89c | #059669 |  |
| `@operator.bash` | frost | `syntaxOperator` | #96a8ad | #2563EB |  |
| `@punctuation.special.bash` | coral | `syntaxPunctuation` | #FF9E8B | #EA580C |  |
| `@constant.bash` | violet | `syntaxNumber` | #c678dd | #7C3AED | bold |
| `@parameter.bash` | amber | `syntaxType` | #D4A76A | #D97706 |  |

### C / C++ (`langs/c.lua`)

| Highlight group | yugen-ash role | opencode zone | dark | light | style / link |
| --------------- | -------------- | ------------- | ---- | ----- | ------------ |
| `cTypedef` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `cPreCondit` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `cStructure` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `cType` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `cStorageClass` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `cInclude` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `cDefine` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `cMacro` | violet | `syntaxNumber` | #c678dd | #7C3AED |  |
| `cSpecial` | rust | `syntaxString` | #bc735c | #DC2626 |  |
| `cCommentString` | sage | `syntaxString` | #9db89c | #059669 |  |
| `cCommentSkip` | color400 | `syntaxComment` | #696969 | #777777 |  |
| `cComment2` | color400 | `syntaxComment` | #696969 | #777777 |  |
| `cConstant` | tide | `secondary` | #79a0aa | #2563EB |  |
| `cInteger` | violet | `syntaxNumber` | #c678dd | #7C3AED |  |
| `cFloat` | violet | `syntaxNumber` | #c678dd | #7C3AED |  |
| `cString` | sage | `syntaxString` | #9db89c | #059669 |  |
| `cCharacter` | sage | `syntaxString` | #9db89c | #059669 |  |
| `cOperator` | frost | `syntaxOperator` | #96a8ad | #2563EB |  |
| `cLabel` | seafoam | `syntaxVariable` | #8dd3c3 | #0D9488 |  |
| `cConditional` | tide | `secondary` | #79a0aa | #2563EB |  |
| `cRepeat` | tide | `secondary` | #79a0aa | #2563EB |  |
| `cStatement` | color200 | `syntaxVariable` | #D4D4D4 | #333333 |  |
| `cException` | tide | `secondary` | #79a0aa | #2563EB |  |
| `cSpecialChar` | rust | `syntaxString` | #bc735c | #DC2626 |  |
| `cSpecialComment` | color400 | `syntaxComment` | #696969 | #777777 |  |
| `@type.c` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `@type.builtin.c` | amber | `syntaxType` | #D4A76A | #D97706 |  |
| `@keyword.c` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `@keyword.storage.c` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `@keyword.function.c` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `@preproc.c` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `@preproc.define.c` | violet | `syntaxNumber` | #c678dd | #7C3AED | bold |
| `@preproc.include.c` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `@constant.c` | violet | `syntaxNumber` | #c678dd | #7C3AED | bold |
| `@macro.c` | violet | `syntaxNumber` | #c678dd | #7C3AED | bold |
| `@structure.c` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `@union.c` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `@enum.c` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |

### CMake (`langs/cmake.lua`)

| Highlight group | yugen-ash role | opencode zone | dark | light | style / link |
| --------------- | -------------- | ------------- | ---- | ----- | ------------ |
| `cmakeStatement` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `cmakeCommand` | primary | `syntaxFunction` | #FFBE89 | #D97706 |  |
| `cmakeKeyword` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `cmakeArguments` | color200 | `syntaxVariable` | #D4D4D4 | #333333 |  |
| `cmakeVariable` | violet | `syntaxVariable` | #c678dd | #7C3AED |  |
| `cmakeVariableValue` | violet | `syntaxVariable` | #c678dd | #7C3AED |  |
| `cmakeProperty` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `cmakeModule` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `cmakeString` | sage | `syntaxString` | #9db89c | #059669 |  |
| `cmakeGeneratorExpression` | coral | `syntaxPunctuation` | #FF9E8B | #EA580C |  |
| `cmakeGeneratorExpressions` | coral | `syntaxPunctuation` | #FF9E8B | #EA580C |  |
| `cmakeRegistry` | amber | `syntaxType` | #D4A76A | #D97706 |  |
| `cmakeEscaped` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `cmakeComment` | color400 | `syntaxComment` | #696969 | #777777 |  |
| `cmakeTodo` | gold | `syntaxType` | #D4A017 | #B45309 | bold |
| `@keyword.cmake` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `@function.cmake` | primary | `syntaxFunction` | #FFBE89 | #D97706 |  |
| `@function.builtin.cmake` | primary | `syntaxFunction` | #FFBE89 | #D97706 |  |
| `@function.call.cmake` | primary | `syntaxFunction` | #FFBE89 | #D97706 |  |
| `@variable.cmake` | color200 | `syntaxVariable` | #D4D4D4 | #333333 |  |
| `@constant.cmake` | violet | `syntaxNumber` | #c678dd | #7C3AED | bold |
| `@string.cmake` | sage | `syntaxString` | #9db89c | #059669 |  |
| `@operator.cmake` | frost | `syntaxOperator` | #96a8ad | #2563EB |  |
| `@property.cmake` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `@punctuation.special.cmake` | coral | `syntaxPunctuation` | #FF9E8B | #EA580C |  |
| `@punctuation.bracket.cmake` | color400 | `syntaxPunctuation` | #696969 | #777777 |  |
| `@comment.cmake` | color400 | `syntaxComment` | #696969 | #777777 |  |

### C# (`langs/csharp.lua`)

| Highlight group | yugen-ash role | opencode zone | dark | light | style / link |
| --------------- | -------------- | ------------- | ---- | ----- | ------------ |
| `csType` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `csNewType` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `csClass` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `csClassType` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `csStorage` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `csModifier` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `csAccessModifier` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `csKeyword` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `csLogicSymbols` | frost | `syntaxOperator` | #96a8ad | #2563EB |  |
| `csConditional` | tide | `secondary` | #79a0aa | #2563EB |  |
| `csRepeat` | tide | `secondary` | #79a0aa | #2563EB |  |
| `csLabel` | seafoam | `syntaxVariable` | #8dd3c3 | #0D9488 |  |
| `csException` | tide | `secondary` | #79a0aa | #2563EB |  |
| `csUnspecifiedStatement` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `csContextualStatement` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `csInterpolation` | coral | `syntaxPunctuation` | #FF9E8B | #EA580C |  |
| `csInterpolationDelimiter` | coral | `syntaxPunctuation` | #FF9E8B | #EA580C |  |
| `csQuote` | sage | `syntaxString` | #9db89c | #059669 |  |
| `csString` | sage | `syntaxString` | #9db89c | #059669 |  |
| `csVerbatimString` | sage | `syntaxString` | #9db89c | #059669 |  |
| `csEndColon` | color400 | `syntaxPunctuation` | #696969 | #777777 |  |
| `csComment` | color400 | `syntaxComment` | #696969 | #777777 |  |
| `csXmlComment` | color400 | `syntaxComment` | #696969 | #777777 |  |
| `csXmlTag` | tide | `secondary` | #79a0aa | #2563EB |  |
| `csXmlCommentLeader` | color400 | `syntaxComment` | #696969 | #777777 |  |
| `csPreProcessor` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `csPreCondit` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `csRegion` | violet | `syntaxNumber` | #c678dd | #7C3AED |  |
| `csAttribute` | amber | `syntaxKeyword` | #D4A76A | #D97706 | italic |
| `csUserType` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `csUserMethod` | primary | `syntaxFunction` | #FFBE89 | #D97706 |  |
| `csUserIdentifier` | color200 | `syntaxVariable` | #D4D4D4 | #333333 |  |
| `csBoolean` | tide | `secondary` | #79a0aa | #2563EB |  |
| `csNumber` | violet | `syntaxNumber` | #c678dd | #7C3AED |  |
| `csFloat` | violet | `syntaxNumber` | #c678dd | #7C3AED |  |
| `csNull` | violet | `syntaxNumber` | #c678dd | #7C3AED |  |
| `@keyword.c_sharp` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `@keyword.import.c_sharp` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `@keyword.function.c_sharp` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `@keyword.return.c_sharp` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `@type.c_sharp` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `@type.builtin.c_sharp` | amber | `syntaxType` | #D4A76A | #D97706 |  |
| `@type.definition.c_sharp` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `@function.c_sharp` | primary | `syntaxFunction` | #FFBE89 | #D97706 |  |
| `@function.builtin.c_sharp` | primary | `syntaxFunction` | #FFBE89 | #D97706 |  |
| `@constant.c_sharp` | violet | `syntaxNumber` | #c678dd | #7C3AED | bold |
| `@constant.builtin.c_sharp` | tide | `secondary` | #79a0aa | #2563EB |  |
| `@variable.builtin.c_sharp` | violet | `syntaxVariable` | #c678dd | #7C3AED |  |
| `@attribute.c_sharp` | amber | `syntaxKeyword` | #D4A76A | #D97706 | italic |
| `@constructor.c_sharp` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `@property.c_sharp` | color300 | `syntaxVariable` | #A9A9A9 | #555555 |  |
| `@punctuation.special.c_sharp` | coral | `syntaxPunctuation` | #FF9E8B | #EA580C |  |

### CSS / SCSS (`langs/css.lua`)

| Highlight group | yugen-ash role | opencode zone | dark | light | style / link |
| --------------- | -------------- | ------------- | ---- | ----- | ------------ |
| `cssTagName` | sage | `syntaxString` | #9db89c | #059669 |  |
| `cssClassName` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `cssClassNameDot` | color400 | `syntaxPunctuation` | #696969 | #777777 |  |
| `cssIdentifier` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `cssPseudoClass` | seafoam | `syntaxVariable` | #8dd3c3 | #0D9488 |  |
| `cssPseudoClassId` | seafoam | `syntaxVariable` | #8dd3c3 | #0D9488 |  |
| `cssPseudoClassFn` | primary | `syntaxFunction` | #FFBE89 | #D97706 |  |
| `cssAttributeSelector` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `cssProp` | tide | `secondary` | #79a0aa | #2563EB |  |
| `cssAttr` | violet | `syntaxNumber` | #c678dd | #7C3AED |  |
| `cssAttrComma` | color400 | `syntaxPunctuation` | #696969 | #777777 |  |
| `cssAttrRegion` | violet | `syntaxNumber` | #c678dd | #7C3AED |  |
| `cssValueLength` | violet | `syntaxNumber` | #c678dd | #7C3AED |  |
| `cssValueNumber` | violet | `syntaxNumber` | #c678dd | #7C3AED |  |
| `cssValueInteger` | violet | `syntaxNumber` | #c678dd | #7C3AED |  |
| `cssValueAngle` | violet | `syntaxNumber` | #c678dd | #7C3AED |  |
| `cssValueTime` | violet | `syntaxNumber` | #c678dd | #7C3AED |  |
| `cssColor` | coral | `syntaxPunctuation` | #FF9E8B | #EA580C |  |
| `cssFunctionName` | primary | `syntaxFunction` | #FFBE89 | #D97706 |  |
| `cssFunction` | primary | `syntaxFunction` | #FFBE89 | #D97706 |  |
| `cssUnitDecorators` | amber | `syntaxKeyword` | #D4A76A | #D97706 |  |
| `cssImportant` | crimson | `syntaxKeyword` | #bf616a | #DC2626 | bold |
| `cssBraces` | color400 | `syntaxPunctuation` | #696969 | #777777 |  |
| `cssNoise` | color400 | `syntaxPunctuation` | #696969 | #777777 |  |
| `cssString` | sage | `syntaxString` | #9db89c | #059669 |  |
| `cssStringQ` | sage | `syntaxString` | #9db89c | #059669 |  |
| `cssStringQQ` | sage | `syntaxString` | #9db89c | #059669 |  |
| `cssComment` | color400 | `syntaxComment` | #696969 | #777777 |  |
| `cssMediaType` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `cssMediaKeyword` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `cssAtRule` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `cssAtKeyword` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `cssVendor` | color400 | `syntaxPunctuation` | #696969 | #777777 |  |
| `cssURL` | seafoam | `syntaxVariable` | #8dd3c3 | #0D9488 | underline |
| `scssVariable` | violet | `syntaxVariable` | #c678dd | #7C3AED |  |
| `scssVariableValue` | color200 | `syntaxVariable` | #D4D4D4 | #333333 |  |
| `scssMixin` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `scssMixinName` | primary | `syntaxFunction` | #FFBE89 | #D97706 |  |
| `scssInclude` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `scssSelectorName` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `scssNestingSelector` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `scssAmpersand` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `scssInterpolation` | coral | `syntaxPunctuation` | #FF9E8B | #EA580C |  |
| `scssInterpolationDelimiter` | coral | `syntaxPunctuation` | #FF9E8B | #EA580C |  |
| `@type.css` | sage | `syntaxString` | #9db89c | #059669 |  |
| `@type.tag.css` | sage | `syntaxString` | #9db89c | #059669 |  |
| `@property.css` | tide | `secondary` | #79a0aa | #2563EB |  |
| `@string.css` | sage | `syntaxString` | #9db89c | #059669 |  |
| `@string.plain.css` | sage | `syntaxString` | #9db89c | #059669 |  |
| `@number.css` | violet | `syntaxNumber` | #c678dd | #7C3AED |  |
| `@function.css` | primary | `syntaxFunction` | #FFBE89 | #D97706 |  |
| `@keyword.css` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `@constant.css` | tide | `secondary` | #79a0aa | #2563EB |  |
| `@attribute.css` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `@tag.attribute.css` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `@punctuation.delimiter.css` | color400 | `syntaxPunctuation` | #696969 | #777777 |  |
| `@punctuation.special.css` | coral | `syntaxPunctuation` | #FF9E8B | #EA580C |  |
| `@property.id.css` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `@property.class.css` | gold | `syntaxType` | #D4A017 | #B45309 |  |

### Dockerfile (`langs/dockerfile.lua`)

| Highlight group | yugen-ash role | opencode zone | dark | light | style / link |
| --------------- | -------------- | ------------- | ---- | ----- | ------------ |
| `dockerfileKeyword` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `dockerfileFroms` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `dockerfileInstruction` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `dockerfileOption` | amber | `syntaxKeyword` | #D4A76A | #D97706 |  |
| `dockerfileString` | sage | `syntaxString` | #9db89c | #059669 |  |
| `dockerfileColor` | violet | `syntaxNumber` | #c678dd | #7C3AED |  |
| `dockerfileEnv` | violet | `syntaxNumber` | #c678dd | #7C3AED |  |
| `dockerfileBytes` | violet | `syntaxNumber` | #c678dd | #7C3AED |  |
| `dockerfileTag` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `dockerfileComment` | color400 | `syntaxComment` | #696969 | #777777 |  |
| `dockerfileFirst` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `dockerfileShell` | color200 | `syntaxVariable` | #D4D4D4 | #333333 |  |
| `@keyword.dockerfile` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `@string.dockerfile` | sage | `syntaxString` | #9db89c | #059669 |  |
| `@variable.dockerfile` | color200 | `syntaxVariable` | #D4D4D4 | #333333 |  |
| `@property.dockerfile` | tide | `secondary` | #79a0aa | #2563EB |  |
| `@constant.dockerfile` | violet | `syntaxNumber` | #c678dd | #7C3AED | bold |
| `@operator.dockerfile` | frost | `syntaxOperator` | #96a8ad | #2563EB |  |
| `@function.dockerfile` | primary | `syntaxFunction` | #FFBE89 | #D97706 |  |
| `@punctuation.special.dockerfile` | coral | `syntaxPunctuation` | #FF9E8B | #EA580C |  |
| `@comment.dockerfile` | color400 | `syntaxComment` | #696969 | #777777 |  |

### Elixir (`langs/elixir.lua`)

| Highlight group | yugen-ash role | opencode zone | dark | light | style / link |
| --------------- | -------------- | ------------- | ---- | ----- | ------------ |
| `elixirKeyword` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `elixirDefine` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `elixirPrivateDefine` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `elixirModuleDefine` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `elixirProtocolDefine` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `elixirImplDefine` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `elixirRecordDefine` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `elixirStructDefine` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `elixirExceptionDefine` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `elixirCallbackDefine` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `elixirGuard` | tide | `secondary` | #79a0aa | #2563EB |  |
| `elixirBlockDefinition` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `elixirDefjp` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `elixirInclude` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `elixirImport` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `elixirOperator` | frost | `syntaxOperator` | #96a8ad | #2563EB |  |
| `elixirModuleDeclaration` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `elixirAlias` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `elixirAtom` | seafoam | `syntaxVariable` | #8dd3c3 | #0D9488 |  |
| `elixirAtomMapKey` | seafoam | `syntaxVariable` | #8dd3c3 | #0D9488 |  |
| `elixirMapDelimiter` | color400 | `syntaxPunctuation` | #696969 | #777777 |  |
| `elixirVariable` | color200 | `syntaxVariable` | #D4D4D4 | #333333 |  |
| `elixirString` | sage | `syntaxString` | #9db89c | #059669 |  |
| `elixirStringDelimiter` | sage | `syntaxString` | #9db89c | #059669 |  |
| `elixirCharList` | sage | `syntaxString` | #9db89c | #059669 |  |
| `elixirSigil` | coral | `syntaxPunctuation` | #FF9E8B | #EA580C |  |
| `elixirSigilDelimiter` | coral | `syntaxPunctuation` | #FF9E8B | #EA580C |  |
| `elixirInterpolation` | coral | `syntaxPunctuation` | #FF9E8B | #EA580C |  |
| `elixirInterpolationDelimiter` | coral | `syntaxPunctuation` | #FF9E8B | #EA580C |  |
| `elixirDocString` | color400 | `syntaxComment` | #696969 | #777777 |  |
| `elixirDocSigilDelimiter` | color400 | `syntaxPunctuation` | #696969 | #777777 |  |
| `elixirComment` | color400 | `syntaxComment` | #696969 | #777777 |  |
| `elixirRegex` | coral | `syntaxPunctuation` | #FF9E8B | #EA580C |  |
| `elixirBoolean` | tide | `secondary` | #79a0aa | #2563EB |  |
| `elixirNil` | violet | `syntaxNumber` | #c678dd | #7C3AED |  |
| `elixirNumber` | violet | `syntaxNumber` | #c678dd | #7C3AED |  |
| `elixirSelf` | violet | `syntaxVariable` | #c678dd | #7C3AED |  |
| `elixirUnusedVariable` | color400 | `syntaxPunctuation` | #696969 | #777777 |  |
| `elixirModuleAttribute` | amber | `syntaxKeyword` | #D4A76A | #D97706 |  |
| `elixirDocTest` | color400 | `syntaxPunctuation` | #696969 | #777777 |  |
| `@keyword.elixir` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `@keyword.function.elixir` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `@keyword.import.elixir` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `@function.elixir` | primary | `syntaxFunction` | #FFBE89 | #D97706 |  |
| `@function.call.elixir` | primary | `syntaxFunction` | #FFBE89 | #D97706 |  |
| `@module.elixir` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `@type.elixir` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `@constant.elixir` | seafoam | `syntaxVariable` | #8dd3c3 | #0D9488 |  |
| `@constant.builtin.elixir` | tide | `secondary` | #79a0aa | #2563EB |  |
| `@string.special.symbol.elixir` | seafoam | `syntaxVariable` | #8dd3c3 | #0D9488 |  |
| `@string.special.elixir` | coral | `syntaxPunctuation` | #FF9E8B | #EA580C |  |
| `@variable.member.elixir` | seafoam | `syntaxVariable` | #8dd3c3 | #0D9488 |  |
| `@attribute.elixir` | amber | `syntaxKeyword` | #D4A76A | #D97706 |  |
| `@comment.documentation.elixir` | color400 | `syntaxComment` | #696969 | #777777 |  |
| `@operator.elixir` | frost | `syntaxOperator` | #96a8ad | #2563EB |  |
| `@punctuation.special.elixir` | coral | `syntaxPunctuation` | #FF9E8B | #EA580C |  |

### Erlang (`langs/erlang.lua`)

| Highlight group | yugen-ash role | opencode zone | dark | light | style / link |
| --------------- | -------------- | ------------- | ---- | ----- | ------------ |
| `erlangKeyword` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `erlangConditional` | tide | `secondary` | #79a0aa | #2563EB |  |
| `erlangBIF` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `erlangFunction` | primary | `syntaxFunction` | #FFBE89 | #D97706 |  |
| `erlangFunCall` | primary | `syntaxFunction` | #FFBE89 | #D97706 |  |
| `erlangLocalFuncRef` | primary | `syntaxFunction` | #FFBE89 | #D97706 |  |
| `erlangLocalFuncCall` | primary | `syntaxFunction` | #FFBE89 | #D97706 |  |
| `erlangGlobalFuncRef` | primary | `syntaxFunction` | #FFBE89 | #D97706 |  |
| `erlangGlobalFuncCall` | primary | `syntaxFunction` | #FFBE89 | #D97706 |  |
| `erlangAtom` | seafoam | `syntaxVariable` | #8dd3c3 | #0D9488 |  |
| `erlangVariable` | color200 | `syntaxVariable` | #D4D4D4 | #333333 |  |
| `erlangAttribute` | amber | `syntaxKeyword` | #D4A76A | #D97706 |  |
| `erlangDirective` | violet | `syntaxNumber` | #c678dd | #7C3AED |  |
| `erlangRecord` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `erlangRecordDef` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `erlangMacro` | violet | `syntaxNumber` | #c678dd | #7C3AED | bold |
| `erlangString` | sage | `syntaxString` | #9db89c | #059669 |  |
| `erlangStringModifier` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `erlangModifier` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `erlangNumberInteger` | violet | `syntaxNumber` | #c678dd | #7C3AED |  |
| `erlangNumberFloat` | violet | `syntaxNumber` | #c678dd | #7C3AED |  |
| `erlangNumberHex` | violet | `syntaxNumber` | #c678dd | #7C3AED |  |
| `erlangBoolean` | tide | `secondary` | #79a0aa | #2563EB |  |
| `erlangBitType` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `erlangType` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `erlangOperator` | frost | `syntaxOperator` | #96a8ad | #2563EB |  |
| `erlangPipe` | frost | `syntaxOperator` | #96a8ad | #2563EB |  |
| `erlangRightArrow` | frost | `syntaxOperator` | #96a8ad | #2563EB |  |
| `erlangSeparator` | color400 | `syntaxPunctuation` | #696969 | #777777 |  |
| `erlangComment` | color400 | `syntaxComment` | #696969 | #777777 |  |
| `erlangProcess` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `erlangPort` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `@keyword.erlang` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `@keyword.directive.erlang` | violet | `syntaxNumber` | #c678dd | #7C3AED |  |
| `@keyword.import.erlang` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `@function.erlang` | primary | `syntaxFunction` | #FFBE89 | #D97706 |  |
| `@function.call.erlang` | primary | `syntaxFunction` | #FFBE89 | #D97706 |  |
| `@function.builtin.erlang` | primary | `syntaxFunction` | #FFBE89 | #D97706 |  |
| `@module.erlang` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `@type.erlang` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `@constant.erlang` | violet | `syntaxNumber` | #c678dd | #7C3AED | bold |
| `@string.special.symbol.erlang` | seafoam | `syntaxVariable` | #8dd3c3 | #0D9488 |  |
| `@variable.erlang` | color200 | `syntaxVariable` | #D4D4D4 | #333333 |  |
| `@variable.member.erlang` | color300 | `syntaxVariable` | #A9A9A9 | #555555 |  |
| `@attribute.erlang` | amber | `syntaxKeyword` | #D4A76A | #D97706 |  |
| `@operator.erlang` | frost | `syntaxOperator` | #96a8ad | #2563EB |  |
| `@punctuation.delimiter.erlang` | color400 | `syntaxPunctuation` | #696969 | #777777 |  |
| `@comment.erlang` | color400 | `syntaxComment` | #696969 | #777777 |  |

### Go (`langs/go.lua`)

| Highlight group | yugen-ash role | opencode zone | dark | light | style / link |
| --------------- | -------------- | ------------- | ---- | ----- | ------------ |
| `goDirective` | violet | `syntaxNumber` | #c678dd | #7C3AED |  |
| `goPackage` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `goImport` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `goDeclaration` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `goDeclType` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `goStatement` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `goConditional` | tide | `secondary` | #79a0aa | #2563EB |  |
| `goLabel` | seafoam | `syntaxVariable` | #8dd3c3 | #0D9488 |  |
| `goRepeat` | tide | `secondary` | #79a0aa | #2563EB |  |
| `goType` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `goSignedInts` | amber | `syntaxType` | #D4A76A | #D97706 |  |
| `goUnsignedInts` | amber | `syntaxType` | #D4A76A | #D97706 |  |
| `goFloats` | amber | `syntaxType` | #D4A76A | #D97706 |  |
| `goComplexes` | amber | `syntaxType` | #D4A76A | #D97706 |  |
| `goBuiltins` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `goPredefinedIdentifiers` | violet | `syntaxNumber` | #c678dd | #7C3AED |  |
| `goVar` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `goConst` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `goStruct` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `goStructDef` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `goInterface` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `goFunction` | primary | `syntaxFunction` | #FFBE89 | #D97706 |  |
| `goFunctionCall` | primary | `syntaxFunction` | #FFBE89 | #D97706 |  |
| `goFunctionReturn` | color200 | `syntaxVariable` | #D4D4D4 | #333333 |  |
| `goReceiverType` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `goString` | sage | `syntaxString` | #9db89c | #059669 |  |
| `goRawString` | sage | `syntaxString` | #9db89c | #059669 |  |
| `goEscape` | rust | `syntaxString` | #bc735c | #DC2626 |  |
| `goField` | color300 | `syntaxVariable` | #A9A9A9 | #555555 |  |
| `goBoolean` | tide | `secondary` | #79a0aa | #2563EB |  |
| `goConstants` | tide | `secondary` | #79a0aa | #2563EB |  |
| `goComment` | color400 | `syntaxComment` | #696969 | #777777 |  |
| `goSpecialString` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `goOperator` | frost | `syntaxOperator` | #96a8ad | #2563EB |  |
| `@keyword.go` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `@keyword.import.go` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `@keyword.function.go` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `@keyword.return.go` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `@type.go` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `@type.builtin.go` | amber | `syntaxType` | #D4A76A | #D97706 |  |
| `@function.go` | primary | `syntaxFunction` | #FFBE89 | #D97706 |  |
| `@function.builtin.go` | primary | `syntaxFunction` | #FFBE89 | #D97706 |  |
| `@constant.builtin.go` | tide | `secondary` | #79a0aa | #2563EB |  |
| `@variable.member.go` | color300 | `syntaxVariable` | #A9A9A9 | #555555 |  |
| `@module.go` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `@label.go` | seafoam | `syntaxVariable` | #8dd3c3 | #0D9488 |  |
| `@string.special.go` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `@operator.go` | frost | `syntaxOperator` | #96a8ad | #2563EB |  |
| `@punctuation.special.go` | coral | `syntaxPunctuation` | #FF9E8B | #EA580C |  |

### HTML (`langs/html.lua`)

| Highlight group | yugen-ash role | opencode zone | dark | light | style / link |
| --------------- | -------------- | ------------- | ---- | ----- | ------------ |
| `htmlTag` | color400 | `syntaxPunctuation` | #696969 | #777777 |  |
| `htmlEndTag` | color400 | `syntaxPunctuation` | #696969 | #777777 |  |
| `htmlTagName` | sage | `syntaxString` | #9db89c | #059669 |  |
| `htmlSpecialTagName` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `htmlTagN` | sage | `syntaxString` | #9db89c | #059669 |  |
| `htmlArg` | gold | `syntaxType` | #D4A017 | #B45309 | italic |
| `htmlString` | sage | `syntaxString` | #9db89c | #059669 |  |
| `htmlValue` | sage | `syntaxString` | #9db89c | #059669 |  |
| `htmlSpecialChar` | rust | `syntaxString` | #bc735c | #DC2626 |  |
| `htmlComment` | color400 | `syntaxComment` | #696969 | #777777 |  |
| `htmlCommentPart` | color400 | `syntaxComment` | #696969 | #777777 |  |
| `htmlPreProc` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `htmlPreStmt` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `htmlH1` | primary | `syntaxFunction` | #FFBE89 | #D97706 | bold |
| `htmlH2` | primary | `syntaxFunction` | #FFBE89 | #D97706 | bold |
| `htmlH3` | primary | `syntaxFunction` | #FFBE89 | #D97706 | bold |
| `htmlBold` | — | `—` | — | — | bold |
| `htmlItalic` | — | `—` | — | — | italic |
| `htmlUnderline` | — | `—` | — | — | underline |
| `htmlLink` | seafoam | `syntaxVariable` | #8dd3c3 | #0D9488 | underline |
| `htmlTitle` | color200 | `syntaxVariable` | #D4D4D4 | #333333 |  |
| `htmlScriptTag` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `htmlEvent` | gold | `syntaxType` | #D4A017 | #B45309 | italic |
| `@tag.html` | sage | `syntaxString` | #9db89c | #059669 |  |
| `@tag.builtin.html` | sage | `syntaxString` | #9db89c | #059669 |  |
| `@tag.attribute.html` | gold | `syntaxType` | #D4A017 | #B45309 | italic |
| `@tag.delimiter.html` | color400 | `syntaxPunctuation` | #696969 | #777777 |  |
| `@string.html` | sage | `syntaxString` | #9db89c | #059669 |  |
| `@constant.html` | tide | `secondary` | #79a0aa | #2563EB |  |
| `@text.title.html` | primary | `syntaxFunction` | #FFBE89 | #D97706 | bold |
| `@punctuation.bracket.html` | color400 | `syntaxPunctuation` | #696969 | #777777 |  |
| `@punctuation.special.html` | coral | `syntaxPunctuation` | #FF9E8B | #EA580C |  |
| `@markup.heading.html` | primary | `syntaxFunction` | #FFBE89 | #D97706 | bold |
| `@markup.link.html` | seafoam | `syntaxVariable` | #8dd3c3 | #0D9488 | underline |

### Java (`langs/java.lua`)

| Highlight group | yugen-ash role | opencode zone | dark | light | style / link |
| --------------- | -------------- | ------------- | ---- | ----- | ------------ |
| `javaExternal` | violet | `syntaxNumber` | #c678dd | #7C3AED |  |
| `javaImport` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `javaClassDecl` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `javaMethodDecl` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `javaScopeDecl` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `javaStorageClass` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `javaConditional` | tide | `secondary` | #79a0aa | #2563EB |  |
| `javaRepeat` | tide | `secondary` | #79a0aa | #2563EB |  |
| `javaBranch` | tide | `secondary` | #79a0aa | #2563EB |  |
| `javaExceptions` | tide | `secondary` | #79a0aa | #2563EB |  |
| `javaStatement` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `javaType` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `javaTypedef` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `javaClassPrimitive` | amber | `syntaxType` | #D4A76A | #D97706 |  |
| `javaConstant` | tide | `secondary` | #79a0aa | #2563EB |  |
| `javaBoolean` | tide | `secondary` | #79a0aa | #2563EB |  |
| `javaNumber` | violet | `syntaxNumber` | #c678dd | #7C3AED |  |
| `javaString` | sage | `syntaxString` | #9db89c | #059669 |  |
| `javaCharacter` | sage | `syntaxString` | #9db89c | #059669 |  |
| `javaSpecialChar` | rust | `syntaxString` | #bc735c | #DC2626 |  |
| `javaOperator` | frost | `syntaxOperator` | #96a8ad | #2563EB |  |
| `javaAnnotation` | amber | `syntaxKeyword` | #D4A76A | #D97706 | italic |
| `javaDocTags` | tide | `secondary` | #79a0aa | #2563EB |  |
| `javaComment` | color400 | `syntaxComment` | #696969 | #777777 |  |
| `javaCommentTitle` | color400 | `syntaxComment` | #696969 | #777777 |  |
| `javaDocComment` | color400 | `syntaxComment` | #696969 | #777777 |  |
| `javaLineComment` | color400 | `syntaxComment` | #696969 | #777777 |  |
| `javaParen` | color400 | `syntaxPunctuation` | #696969 | #777777 |  |
| `javaParen1` | color400 | `syntaxPunctuation` | #696969 | #777777 |  |
| `javaBraces` | color400 | `syntaxPunctuation` | #696969 | #777777 |  |
| `@keyword.java` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `@keyword.import.java` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `@keyword.function.java` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `@type.java` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `@type.builtin.java` | amber | `syntaxType` | #D4A76A | #D97706 |  |
| `@function.java` | primary | `syntaxFunction` | #FFBE89 | #D97706 |  |
| `@function.builtin.java` | primary | `syntaxFunction` | #FFBE89 | #D97706 |  |
| `@constant.java` | violet | `syntaxNumber` | #c678dd | #7C3AED | bold |
| `@constant.builtin.java` | violet | `syntaxNumber` | #c678dd | #7C3AED |  |
| `@variable.builtin.java` | tide | `secondary` | #79a0aa | #2563EB |  |
| `@attribute.java` | amber | `syntaxKeyword` | #D4A76A | #D97706 | italic |
| `@annotation.java` | amber | `syntaxKeyword` | #D4A76A | #D97706 | italic |
| `@constructor.java` | gold | `syntaxType` | #D4A017 | #B45309 | bold |
| `@property.java` | color300 | `syntaxVariable` | #A9A9A9 | #555555 |  |

### JavaScript / JSX (`langs/javascript.lua`)

| Highlight group | yugen-ash role | opencode zone | dark | light | style / link |
| --------------- | -------------- | ------------- | ---- | ----- | ------------ |
| `javaScriptNull` | violet | `syntaxNumber` | #c678dd | #7C3AED |  |
| `javaScriptBoolean` | tide | `secondary` | #79a0aa | #2563EB |  |
| `javaScriptNumber` | violet | `syntaxNumber` | #c678dd | #7C3AED |  |
| `javaScriptFunction` | primary | `syntaxFunction` | #FFBE89 | #D97706 |  |
| `javaScriptIdentifier` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `javaScriptOperator` | frost | `syntaxOperator` | #96a8ad | #2563EB |  |
| `javaScriptBraces` | color400 | `syntaxPunctuation` | #696969 | #777777 |  |
| `javaScriptParens` | color400 | `syntaxPunctuation` | #696969 | #777777 |  |
| `javaScriptReserved` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `javaScriptType` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `javaScriptStatement` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `javaScriptConditional` | tide | `secondary` | #79a0aa | #2563EB |  |
| `javaScriptRepeat` | tide | `secondary` | #79a0aa | #2563EB |  |
| `javaScriptException` | tide | `secondary` | #79a0aa | #2563EB |  |
| `javaScriptMessage` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `javaScriptGlobal` | amber | `syntaxType` | #D4A76A | #D97706 |  |
| `javaScriptMember` | color300 | `syntaxVariable` | #A9A9A9 | #555555 |  |
| `javaScriptStringS` | sage | `syntaxString` | #9db89c | #059669 |  |
| `javaScriptStringD` | sage | `syntaxString` | #9db89c | #059669 |  |
| `jsThis` | violet | `syntaxVariable` | #c678dd | #7C3AED |  |
| `jsSuper` | violet | `syntaxVariable` | #c678dd | #7C3AED |  |
| `jsFunction` | primary | `syntaxFunction` | #FFBE89 | #D97706 |  |
| `jsArrowFunction` | primary | `syntaxFunction` | #FFBE89 | #D97706 |  |
| `jsClassDefinition` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `jsClassKeyword` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `jsImport` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `jsExport` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `jsFrom` | violet | `syntaxNumber` | #c678dd | #7C3AED |  |
| `jsModuleKeyword` | violet | `syntaxNumber` | #c678dd | #7C3AED |  |
| `jsGlobalObjects` | amber | `syntaxType` | #D4A76A | #D97706 |  |
| `jsGlobalNodeObjects` | amber | `syntaxType` | #D4A76A | #D97706 |  |
| `jsBuiltins` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `jsUndefined` | violet | `syntaxNumber` | #c678dd | #7C3AED |  |
| `jsNull` | violet | `syntaxNumber` | #c678dd | #7C3AED |  |
| `jsObjectKey` | color300 | `syntaxVariable` | #A9A9A9 | #555555 |  |
| `jsObjectProp` | color300 | `syntaxVariable` | #A9A9A9 | #555555 |  |
| `jsTemplateBraces` | coral | `syntaxPunctuation` | #FF9E8B | #EA580C |  |
| `jsTemplateString` | sage | `syntaxString` | #9db89c | #059669 |  |
| `jsTernaryIfOperator` | frost | `syntaxOperator` | #96a8ad | #2563EB |  |
| `jsOperatorKeyword` | frost | `syntaxOperator` | #96a8ad | #2563EB |  |
| `jsDestructuringBlock` | color200 | `syntaxVariable` | #D4D4D4 | #333333 |  |
| `@keyword.javascript` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `@keyword.import.javascript` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `@keyword.export.javascript` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `@keyword.function.javascript` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `@keyword.coroutine.javascript` | seafoam | `syntaxVariable` | #8dd3c3 | #0D9488 |  |
| `@lsp.typemod.variable.readonly.javascript` | color200 | `syntaxVariable` | #D4D4D4 | #333333 | link → `@variable` |
| `@function.javascript` | primary | `syntaxFunction` | #FFBE89 | #D97706 |  |
| `@function.builtin.javascript` | primary | `syntaxFunction` | #FFBE89 | #D97706 |  |
| `@constructor.javascript` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `@type.javascript` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `@type.builtin.javascript` | amber | `syntaxType` | #D4A76A | #D97706 |  |
| `@constant.javascript` | color200 | `syntaxVariable` | #D4D4D4 | #333333 |  |
| `@constant.builtin.javascript` | tide | `secondary` | #79a0aa | #2563EB |  |
| `@variable.builtin.javascript` | violet | `syntaxVariable` | #c678dd | #7C3AED |  |
| `@property.javascript` | color300 | `syntaxVariable` | #A9A9A9 | #555555 |  |
| `@label.javascript` | seafoam | `syntaxVariable` | #8dd3c3 | #0D9488 |  |
| `@punctuation.special.javascript` | coral | `syntaxPunctuation` | #FF9E8B | #EA580C |  |
| `@string.template.javascript` | sage | `syntaxString` | #9db89c | #059669 |  |
| `@tag.javascript` | sage | `syntaxString` | #9db89c | #059669 |  |
| `@tag.builtin.javascript` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `@tag.attribute.javascript` | gold | `syntaxType` | #D4A017 | #B45309 | italic |
| `@tag.delimiter.javascript` | color400 | `syntaxPunctuation` | #696969 | #777777 |  |
| `@constructor.tsx` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `@tag.tsx` | sage | `syntaxString` | #9db89c | #059669 |  |
| `@tag.builtin.tsx` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `@tag.attribute.tsx` | gold | `syntaxType` | #D4A017 | #B45309 | italic |
| `@tag.delimiter.tsx` | color400 | `syntaxPunctuation` | #696969 | #777777 |  |

### JSON / JSONC (`langs/json.lua`)

| Highlight group | yugen-ash role | opencode zone | dark | light | style / link |
| --------------- | -------------- | ------------- | ---- | ----- | ------------ |
| `jsonString` | sage | `syntaxString` | #9db89c | #059669 |  |
| `jsonStringSQ` | sage | `syntaxString` | #9db89c | #059669 |  |
| `jsonKeyword` | tide | `secondary` | #79a0aa | #2563EB |  |
| `jsonKeywordMatch` | color400 | `syntaxPunctuation` | #696969 | #777777 |  |
| `jsonQuote` | color400 | `syntaxPunctuation` | #696969 | #777777 |  |
| `jsonBraces` | color400 | `syntaxPunctuation` | #696969 | #777777 |  |
| `jsonBoolean` | tide | `secondary` | #79a0aa | #2563EB |  |
| `jsonNull` | violet | `syntaxNumber` | #c678dd | #7C3AED |  |
| `jsonNumber` | violet | `syntaxNumber` | #c678dd | #7C3AED |  |
| `jsonNoise` | color400 | `syntaxPunctuation` | #696969 | #777777 |  |
| `jsonEscape` | rust | `syntaxString` | #bc735c | #DC2626 |  |
| `jsonComment` | color400 | `syntaxComment` | #696969 | #777777 |  |
| `jsoncComment` | color400 | `syntaxComment` | #696969 | #777777 |  |
| `@property.json` | tide | `secondary` | #79a0aa | #2563EB |  |
| `@label.json` | tide | `secondary` | #79a0aa | #2563EB |  |
| `@string.json` | sage | `syntaxString` | #9db89c | #059669 |  |
| `@number.json` | violet | `syntaxNumber` | #c678dd | #7C3AED |  |
| `@boolean.json` | tide | `secondary` | #79a0aa | #2563EB |  |
| `@constant.builtin.json` | tide | `secondary` | #79a0aa | #2563EB |  |
| `@punctuation.bracket.json` | color400 | `syntaxPunctuation` | #696969 | #777777 |  |
| `@punctuation.delimiter.json` | color400 | `syntaxPunctuation` | #696969 | #777777 |  |
| `@string.escape.json` | rust | `syntaxString` | #bc735c | #DC2626 |  |
| `@property.jsonc` | tide | `secondary` | #79a0aa | #2563EB |  |
| `@string.jsonc` | sage | `syntaxString` | #9db89c | #059669 |  |
| `@number.jsonc` | violet | `syntaxNumber` | #c678dd | #7C3AED |  |
| `@boolean.jsonc` | tide | `secondary` | #79a0aa | #2563EB |  |
| `@comment.jsonc` | color400 | `syntaxComment` | #696969 | #777777 |  |
| `@punctuation.bracket.jsonc` | color400 | `syntaxPunctuation` | #696969 | #777777 |  |
| `@punctuation.delimiter.jsonc` | color400 | `syntaxPunctuation` | #696969 | #777777 |  |

### Kotlin (`langs/kotlin.lua`)

| Highlight group | yugen-ash role | opencode zone | dark | light | style / link |
| --------------- | -------------- | ------------- | ---- | ----- | ------------ |
| `ktKeyword` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `ktImport` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `ktPackage` | violet | `syntaxNumber` | #c678dd | #7C3AED |  |
| `ktModifier` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `ktVisibilityModifier` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `ktStructure` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `ktConditional` | tide | `secondary` | #79a0aa | #2563EB |  |
| `ktRepeat` | tide | `secondary` | #79a0aa | #2563EB |  |
| `ktExceptions` | tide | `secondary` | #79a0aa | #2563EB |  |
| `ktType` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `ktTypeDef` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `ktFunction` | primary | `syntaxFunction` | #FFBE89 | #D97706 |  |
| `ktFunctionCall` | primary | `syntaxFunction` | #FFBE89 | #D97706 |  |
| `ktString` | sage | `syntaxString` | #9db89c | #059669 |  |
| `ktStringInterpolation` | coral | `syntaxPunctuation` | #FF9E8B | #EA580C |  |
| `ktSimpleInterpolation` | coral | `syntaxPunctuation` | #FF9E8B | #EA580C |  |
| `ktComplexInterpolation` | coral | `syntaxPunctuation` | #FF9E8B | #EA580C |  |
| `ktComplexInterpolationBrace` | coral | `syntaxPunctuation` | #FF9E8B | #EA580C |  |
| `ktEscapedName` | color200 | `syntaxVariable` | #D4D4D4 | #333333 |  |
| `ktEscape` | rust | `syntaxString` | #bc735c | #DC2626 |  |
| `ktLabel` | seafoam | `syntaxVariable` | #8dd3c3 | #0D9488 |  |
| `ktAnnotation` | amber | `syntaxKeyword` | #D4A76A | #D97706 | italic |
| `ktBoolean` | tide | `secondary` | #79a0aa | #2563EB |  |
| `ktConstant` | tide | `secondary` | #79a0aa | #2563EB |  |
| `ktNull` | violet | `syntaxNumber` | #c678dd | #7C3AED |  |
| `ktNumber` | violet | `syntaxNumber` | #c678dd | #7C3AED |  |
| `ktFloat` | violet | `syntaxNumber` | #c678dd | #7C3AED |  |
| `ktComment` | color400 | `syntaxComment` | #696969 | #777777 |  |
| `ktDocComment` | color400 | `syntaxComment` | #696969 | #777777 |  |
| `ktShebang` | color400 | `syntaxComment` | #696969 | #777777 |  |
| `ktOperator` | frost | `syntaxOperator` | #96a8ad | #2563EB |  |
| `@keyword.kotlin` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `@keyword.import.kotlin` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `@keyword.function.kotlin` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `@keyword.return.kotlin` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `@type.kotlin` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `@type.builtin.kotlin` | amber | `syntaxType` | #D4A76A | #D97706 |  |
| `@function.kotlin` | primary | `syntaxFunction` | #FFBE89 | #D97706 |  |
| `@function.builtin.kotlin` | primary | `syntaxFunction` | #FFBE89 | #D97706 |  |
| `@constant.kotlin` | violet | `syntaxNumber` | #c678dd | #7C3AED | bold |
| `@constant.builtin.kotlin` | tide | `secondary` | #79a0aa | #2563EB |  |
| `@variable.builtin.kotlin` | violet | `syntaxVariable` | #c678dd | #7C3AED |  |
| `@attribute.kotlin` | amber | `syntaxKeyword` | #D4A76A | #D97706 | italic |
| `@annotation.kotlin` | amber | `syntaxKeyword` | #D4A76A | #D97706 | italic |
| `@constructor.kotlin` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `@label.kotlin` | seafoam | `syntaxVariable` | #8dd3c3 | #0D9488 |  |
| `@punctuation.special.kotlin` | coral | `syntaxPunctuation` | #FF9E8B | #EA580C |  |

### LaTeX (`langs/latex.lua`)

| Highlight group | yugen-ash role | opencode zone | dark | light | style / link |
| --------------- | -------------- | ------------- | ---- | ----- | ------------ |
| `texStatement` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `texCmdName` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `texBeginEnd` | violet | `syntaxNumber` | #c678dd | #7C3AED |  |
| `texBeginEndName` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `texDocType` | violet | `syntaxNumber` | #c678dd | #7C3AED |  |
| `texDocTypeArgs` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `texInputFile` | sage | `syntaxString` | #9db89c | #059669 |  |
| `texSection` | primary | `syntaxFunction` | #FFBE89 | #D97706 | bold |
| `texSectionMarker` | primary | `syntaxFunction` | #FFBE89 | #D97706 |  |
| `texSectionName` | primary | `syntaxFunction` | #FFBE89 | #D97706 | bold |
| `texType` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `texTypeStyle` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `texMathZone` | tide | `secondary` | #79a0aa | #2563EB |  |
| `texMath` | tide | `secondary` | #79a0aa | #2563EB |  |
| `texMathSymbol` | coral | `syntaxPunctuation` | #FF9E8B | #EA580C |  |
| `texMathOper` | tide | `secondary` | #79a0aa | #2563EB |  |
| `texMathMatcher` | tide | `secondary` | #79a0aa | #2563EB |  |
| `texMathDelim` | color400 | `syntaxPunctuation` | #696969 | #777777 |  |
| `texMathDelimZone` | color400 | `syntaxPunctuation` | #696969 | #777777 |  |
| `texGreek` | coral | `syntaxPunctuation` | #FF9E8B | #EA580C |  |
| `texSuperscript` | amber | `syntaxType` | #D4A76A | #D97706 |  |
| `texSubscript` | amber | `syntaxType` | #D4A76A | #D97706 |  |
| `texRefZone` | seafoam | `syntaxVariable` | #8dd3c3 | #0D9488 |  |
| `texRefLabel` | seafoam | `syntaxVariable` | #8dd3c3 | #0D9488 |  |
| `texLabel` | seafoam | `syntaxVariable` | #8dd3c3 | #0D9488 |  |
| `texCite` | seafoam | `syntaxVariable` | #8dd3c3 | #0D9488 |  |
| `texString` | sage | `syntaxString` | #9db89c | #059669 |  |
| `texDelimiter` | color400 | `syntaxPunctuation` | #696969 | #777777 |  |
| `texSpecialChar` | rust | `syntaxString` | #bc735c | #DC2626 |  |
| `texOption` | amber | `syntaxKeyword` | #D4A76A | #D97706 |  |
| `texCmdArgs` | color200 | `syntaxVariable` | #D4D4D4 | #333333 |  |
| `texDefName` | primary | `syntaxFunction` | #FFBE89 | #D97706 |  |
| `texNewCmd` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `texComment` | color400 | `syntaxComment` | #696969 | #777777 |  |
| `texTodo` | gold | `syntaxType` | #D4A017 | #B45309 | bold |
| `@keyword.latex` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `@function.latex` | primary | `syntaxFunction` | #FFBE89 | #D97706 |  |
| `@function.macro.latex` | primary | `syntaxFunction` | #FFBE89 | #D97706 |  |
| `@module.latex` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `@markup.heading.latex` | primary | `syntaxFunction` | #FFBE89 | #D97706 | bold |
| `@markup.environment.latex` | violet | `syntaxNumber` | #c678dd | #7C3AED |  |
| `@markup.environment.name.latex` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `@markup.link.latex` | seafoam | `syntaxVariable` | #8dd3c3 | #0D9488 |  |
| `@markup.link.label.latex` | seafoam | `syntaxVariable` | #8dd3c3 | #0D9488 |  |
| `@markup.math.latex` | tide | `secondary` | #79a0aa | #2563EB |  |
| `@markup.list.latex` | primary | `syntaxFunction` | #FFBE89 | #D97706 |  |
| `@string.latex` | sage | `syntaxString` | #9db89c | #059669 |  |
| `@punctuation.delimiter.latex` | color400 | `syntaxPunctuation` | #696969 | #777777 |  |
| `@punctuation.special.latex` | coral | `syntaxPunctuation` | #FF9E8B | #EA580C |  |
| `@comment.latex` | color400 | `syntaxComment` | #696969 | #777777 |  |

### Makefile (`langs/make.lua`)

| Highlight group | yugen-ash role | opencode zone | dark | light | style / link |
| --------------- | -------------- | ------------- | ---- | ----- | ------------ |
| `makeIdent` | violet | `syntaxNumber` | #c678dd | #7C3AED |  |
| `makeSpecTarget` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `makeSpecialTarget` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `makeTarget` | primary | `syntaxFunction` | #FFBE89 | #D97706 |  |
| `makeStatement` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `makeCommands` | color200 | `syntaxVariable` | #D4D4D4 | #333333 |  |
| `makePreCondit` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `makeDefine` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `makeOverride` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `makeInclude` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `makeExport` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `makeImplicit` | primary | `syntaxFunction` | #FFBE89 | #D97706 |  |
| `makeSpecial` | rust | `syntaxString` | #bc735c | #DC2626 |  |
| `makeComment` | color400 | `syntaxComment` | #696969 | #777777 |  |
| `makeDString` | sage | `syntaxString` | #9db89c | #059669 |  |
| `makeSString` | sage | `syntaxString` | #9db89c | #059669 |  |
| `makeBString` | sage | `syntaxString` | #9db89c | #059669 |  |
| `makeCmdNextLine` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `@keyword.make` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `@function.make` | primary | `syntaxFunction` | #FFBE89 | #D97706 |  |
| `@function.builtin.make` | primary | `syntaxFunction` | #FFBE89 | #D97706 |  |
| `@variable.make` | violet | `syntaxVariable` | #c678dd | #7C3AED |  |
| `@string.make` | sage | `syntaxString` | #9db89c | #059669 |  |
| `@operator.make` | frost | `syntaxOperator` | #96a8ad | #2563EB |  |
| `@symbol.make` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `@punctuation.special.make` | coral | `syntaxPunctuation` | #FF9E8B | #EA580C |  |
| `@comment.make` | color400 | `syntaxComment` | #696969 | #777777 |  |

### Nix (`langs/nix.lua`)

| Highlight group | yugen-ash role | opencode zone | dark | light | style / link |
| --------------- | -------------- | ------------- | ---- | ----- | ------------ |
| `nixKeyword` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `nixBuiltin` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `nixSimpleBuiltin` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `nixNamespacedBuiltin` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `nixConditional` | tide | `secondary` | #79a0aa | #2563EB |  |
| `nixOperator` | frost | `syntaxOperator` | #96a8ad | #2563EB |  |
| `nixBoolean` | tide | `secondary` | #79a0aa | #2563EB |  |
| `nixNull` | violet | `syntaxNumber` | #c678dd | #7C3AED |  |
| `nixInteger` | violet | `syntaxNumber` | #c678dd | #7C3AED |  |
| `nixFloat` | violet | `syntaxNumber` | #c678dd | #7C3AED |  |
| `nixString` | sage | `syntaxString` | #9db89c | #059669 |  |
| `nixStringDelimiter` | sage | `syntaxString` | #9db89c | #059669 |  |
| `nixSimpleString` | sage | `syntaxString` | #9db89c | #059669 |  |
| `nixIndentedString` | sage | `syntaxString` | #9db89c | #059669 |  |
| `nixStringSpecial` | rust | `syntaxString` | #bc735c | #DC2626 |  |
| `nixInterpolation` | coral | `syntaxPunctuation` | #FF9E8B | #EA580C |  |
| `nixInterpolationDelimiter` | coral | `syntaxPunctuation` | #FF9E8B | #EA580C |  |
| `nixInterpolationParam` | coral | `syntaxPunctuation` | #FF9E8B | #EA580C |  |
| `nixComment` | color400 | `syntaxComment` | #696969 | #777777 |  |
| `nixAttribute` | color300 | `syntaxVariable` | #A9A9A9 | #555555 |  |
| `nixAttributeDot` | color400 | `syntaxPunctuation` | #696969 | #777777 |  |
| `nixPath` | seafoam | `syntaxVariable` | #8dd3c3 | #0D9488 |  |
| `nixHomePath` | seafoam | `syntaxVariable` | #8dd3c3 | #0D9488 |  |
| `nixSearchPath` | seafoam | `syntaxVariable` | #8dd3c3 | #0D9488 |  |
| `nixURI` | seafoam | `syntaxVariable` | #8dd3c3 | #0D9488 | underline |
| `nixFunctionCall` | primary | `syntaxFunction` | #FFBE89 | #D97706 |  |
| `nixArgumentDefinition` | color200 | `syntaxVariable` | #D4D4D4 | #333333 |  |
| `nixArgOperator` | frost | `syntaxOperator` | #96a8ad | #2563EB |  |
| `nixInherit` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `@keyword.nix` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `@keyword.import.nix` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `@function.builtin.nix` | primary | `syntaxFunction` | #FFBE89 | #D97706 |  |
| `@function.call.nix` | primary | `syntaxFunction` | #FFBE89 | #D97706 |  |
| `@variable.parameter.nix` | color200 | `syntaxVariable` | #D4D4D4 | #333333 |  |
| `@variable.member.nix` | color300 | `syntaxVariable` | #A9A9A9 | #555555 |  |
| `@property.nix` | color300 | `syntaxVariable` | #A9A9A9 | #555555 |  |
| `@constant.builtin.nix` | tide | `secondary` | #79a0aa | #2563EB |  |
| `@string.special.path.nix` | seafoam | `syntaxVariable` | #8dd3c3 | #0D9488 |  |
| `@string.special.uri.nix` | seafoam | `syntaxVariable` | #8dd3c3 | #0D9488 | underline |
| `@punctuation.special.nix` | coral | `syntaxPunctuation` | #FF9E8B | #EA580C |  |
| `@operator.nix` | frost | `syntaxOperator` | #96a8ad | #2563EB |  |

### PowerShell (`langs/powershell.lua`)

| Highlight group | yugen-ash role | opencode zone | dark | light | style / link |
| --------------- | -------------- | ------------- | ---- | ----- | ------------ |
| `ps1Keyword` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `ps1Conditional` | tide | `secondary` | #79a0aa | #2563EB |  |
| `ps1Repeat` | tide | `secondary` | #79a0aa | #2563EB |  |
| `ps1Exception` | tide | `secondary` | #79a0aa | #2563EB |  |
| `ps1Operator` | frost | `syntaxOperator` | #96a8ad | #2563EB |  |
| `ps1Constant` | tide | `secondary` | #79a0aa | #2563EB |  |
| `ps1Boolean` | tide | `secondary` | #79a0aa | #2563EB |  |
| `ps1Type` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `ps1Variable` | color200 | `syntaxVariable` | #D4D4D4 | #333333 |  |
| `ps1VariableConst` | violet | `syntaxVariable` | #c678dd | #7C3AED |  |
| `ps1Builtin` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `ps1Cmdlet` | primary | `syntaxFunction` | #FFBE89 | #D97706 |  |
| `ps1FunctionDeclaration` | primary | `syntaxFunction` | #FFBE89 | #D97706 |  |
| `ps1FunctionInvocation` | primary | `syntaxFunction` | #FFBE89 | #D97706 |  |
| `ps1Modifier` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `ps1Member` | color300 | `syntaxVariable` | #A9A9A9 | #555555 |  |
| `ps1Attribute` | amber | `syntaxKeyword` | #D4A76A | #D97706 | italic |
| `ps1String` | sage | `syntaxString` | #9db89c | #059669 |  |
| `ps1StringLiteral` | sage | `syntaxString` | #9db89c | #059669 |  |
| `ps1Escape` | rust | `syntaxString` | #bc735c | #DC2626 |  |
| `ps1InterpolationDelimiter` | coral | `syntaxPunctuation` | #FF9E8B | #EA580C |  |
| `ps1Hashtable` | color200 | `syntaxVariable` | #D4D4D4 | #333333 |  |
| `ps1Number` | violet | `syntaxNumber` | #c678dd | #7C3AED |  |
| `ps1Comment` | color400 | `syntaxComment` | #696969 | #777777 |  |
| `ps1CommentDoc` | color400 | `syntaxComment` | #696969 | #777777 |  |
| `ps1CommentString` | sage | `syntaxString` | #9db89c | #059669 |  |
| `ps1CommentDocTag` | tide | `secondary` | #79a0aa | #2563EB |  |
| `@keyword.powershell` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `@keyword.function.powershell` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `@keyword.return.powershell` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `@function.powershell` | primary | `syntaxFunction` | #FFBE89 | #D97706 |  |
| `@function.call.powershell` | primary | `syntaxFunction` | #FFBE89 | #D97706 |  |
| `@function.builtin.powershell` | primary | `syntaxFunction` | #FFBE89 | #D97706 |  |
| `@type.powershell` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `@variable.powershell` | color200 | `syntaxVariable` | #D4D4D4 | #333333 |  |
| `@variable.builtin.powershell` | violet | `syntaxVariable` | #c678dd | #7C3AED |  |
| `@constant.powershell` | violet | `syntaxNumber` | #c678dd | #7C3AED | bold |
| `@constant.builtin.powershell` | tide | `secondary` | #79a0aa | #2563EB |  |
| `@string.powershell` | sage | `syntaxString` | #9db89c | #059669 |  |
| `@operator.powershell` | frost | `syntaxOperator` | #96a8ad | #2563EB |  |
| `@attribute.powershell` | amber | `syntaxKeyword` | #D4A76A | #D97706 | italic |
| `@punctuation.special.powershell` | coral | `syntaxPunctuation` | #FF9E8B | #EA580C |  |
| `@comment.powershell` | color400 | `syntaxComment` | #696969 | #777777 |  |

### Protocol Buffers (`langs/protobuf.lua`)

| Highlight group | yugen-ash role | opencode zone | dark | light | style / link |
| --------------- | -------------- | ------------- | ---- | ----- | ------------ |
| `pbSyntax` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `pbSyntaxName` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `pbPackage` | violet | `syntaxNumber` | #c678dd | #7C3AED |  |
| `pbPackageName` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `pbImport` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `pbOption` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `pbKeyword` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `pbBool` | tide | `secondary` | #79a0aa | #2563EB |  |
| `pbType` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `pbTypeKeyword` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `pbField` | color300 | `syntaxVariable` | #A9A9A9 | #555555 |  |
| `pbFieldRule` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `pbFieldDefault` | violet | `syntaxNumber` | #c678dd | #7C3AED |  |
| `pbEnum` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `pbEnumName` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `pbMessage` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `pbMessageName` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `pbService` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `pbServiceName` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `pbRpc` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `pbString` | sage | `syntaxString` | #9db89c | #059669 |  |
| `pbInt` | violet | `syntaxNumber` | #c678dd | #7C3AED |  |
| `pbFloat` | violet | `syntaxNumber` | #c678dd | #7C3AED |  |
| `pbComment` | color400 | `syntaxComment` | #696969 | #777777 |  |
| `@keyword.proto` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `@keyword.import.proto` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `@type.proto` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `@type.builtin.proto` | amber | `syntaxType` | #D4A76A | #D97706 |  |
| `@type.definition.proto` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `@constant.proto` | violet | `syntaxNumber` | #c678dd | #7C3AED | bold |
| `@constant.builtin.proto` | tide | `secondary` | #79a0aa | #2563EB |  |
| `@field.proto` | color300 | `syntaxVariable` | #A9A9A9 | #555555 |  |
| `@variable.member.proto` | color300 | `syntaxVariable` | #A9A9A9 | #555555 |  |
| `@string.proto` | sage | `syntaxString` | #9db89c | #059669 |  |
| `@number.proto` | violet | `syntaxNumber` | #c678dd | #7C3AED |  |
| `@boolean.proto` | tide | `secondary` | #79a0aa | #2563EB |  |
| `@operator.proto` | frost | `syntaxOperator` | #96a8ad | #2563EB |  |
| `@punctuation.delimiter.proto` | color400 | `syntaxPunctuation` | #696969 | #777777 |  |
| `@comment.proto` | color400 | `syntaxComment` | #696969 | #777777 |  |

### Python (`langs/python.lua`)

| Highlight group | yugen-ash role | opencode zone | dark | light | style / link |
| --------------- | -------------- | ------------- | ---- | ----- | ------------ |
| `pythonStatement` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `pythonKeyword` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `pythonImport` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `pythonInclude` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `pythonFunction` | primary | `syntaxFunction` | #FFBE89 | #D97706 |  |
| `pythonDefName` | primary | `syntaxFunction` | #FFBE89 | #D97706 |  |
| `pythonClassName` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `pythonClass` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `pythonConditional` | tide | `secondary` | #79a0aa | #2563EB |  |
| `pythonRepeat` | tide | `secondary` | #79a0aa | #2563EB |  |
| `pythonException` | tide | `secondary` | #79a0aa | #2563EB |  |
| `pythonExceptions` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `pythonOperator` | frost | `syntaxOperator` | #96a8ad | #2563EB |  |
| `pythonDecorator` | amber | `syntaxKeyword` | #D4A76A | #D97706 | italic |
| `pythonDecoratorName` | amber | `syntaxKeyword` | #D4A76A | #D97706 | italic |
| `pythonBuiltin` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `pythonBuiltinObj` | amber | `syntaxType` | #D4A76A | #D97706 |  |
| `pythonBuiltinFunc` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `pythonBuiltinType` | amber | `syntaxType` | #D4A76A | #D97706 |  |
| `pythonConstant` | tide | `secondary` | #79a0aa | #2563EB |  |
| `pythonBoolean` | tide | `secondary` | #79a0aa | #2563EB |  |
| `pythonNone` | violet | `syntaxNumber` | #c678dd | #7C3AED |  |
| `pythonNumber` | violet | `syntaxNumber` | #c678dd | #7C3AED |  |
| `pythonString` | sage | `syntaxString` | #9db89c | #059669 |  |
| `pythonRawString` | sage | `syntaxString` | #9db89c | #059669 |  |
| `pythonBytes` | sage | `syntaxString` | #9db89c | #059669 |  |
| `pythonFString` | sage | `syntaxString` | #9db89c | #059669 |  |
| `pythonStrFormat` | coral | `syntaxPunctuation` | #FF9E8B | #EA580C |  |
| `pythonStrFormatting` | coral | `syntaxPunctuation` | #FF9E8B | #EA580C |  |
| `pythonStrInterpRegion` | coral | `syntaxPunctuation` | #FF9E8B | #EA580C |  |
| `pythonEscape` | rust | `syntaxString` | #bc735c | #DC2626 |  |
| `pythonComment` | color400 | `syntaxComment` | #696969 | #777777 |  |
| `pythonDocstring` | color400 | `syntaxComment` | #696969 | #777777 |  |
| `pythonSelf` | violet | `syntaxVariable` | #c678dd | #7C3AED | italic |
| `pythonAttribute` | color200 | `syntaxVariable` | #D4D4D4 | #333333 |  |
| `pythonDot` | color400 | `syntaxPunctuation` | #696969 | #777777 |  |
| `@keyword.python` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `@keyword.import.python` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `@keyword.function.python` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `@keyword.operator.python` | tide | `secondary` | #79a0aa | #2563EB |  |
| `@function.python` | primary | `syntaxFunction` | #FFBE89 | #D97706 |  |
| `@function.builtin.python` | primary | `syntaxFunction` | #FFBE89 | #D97706 |  |
| `@function.call.python` | primary | `syntaxFunction` | #FFBE89 | #D97706 |  |
| `@type.python` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `@type.builtin.python` | amber | `syntaxType` | #D4A76A | #D97706 |  |
| `@constant.python` | tide | `secondary` | #79a0aa | #2563EB | bold |
| `@constant.builtin.python` | tide | `secondary` | #79a0aa | #2563EB |  |
| `@variable.builtin.python` | frost | `syntaxOperator` | #96a8ad | #2563EB | italic |
| `@variable.member.python` | color200 | `syntaxVariable` | #D4D4D4 | #333333 |  |
| `@property.python` | color200 | `syntaxVariable` | #D4D4D4 | #333333 |  |
| `@variable.object.property.python` | color200 | `syntaxVariable` | #D4D4D4 | #333333 |  |
| `@attribute.python` | amber | `syntaxKeyword` | #D4A76A | #D97706 | italic |
| `@constructor.python` | gold | `syntaxType` | #D4A017 | #B45309 | bold |
| `@string.documentation.python` | color400 | `syntaxComment` | #696969 | #777777 |  |
| `@punctuation.special.python` | coral | `syntaxPunctuation` | #FF9E8B | #EA580C |  |

### Ruby (`langs/ruby.lua`)

| Highlight group | yugen-ash role | opencode zone | dark | light | style / link |
| --------------- | -------------- | ------------- | ---- | ----- | ------------ |
| `rubyModule` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `rubyClass` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `rubyDefine` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `rubyFunction` | primary | `syntaxFunction` | #FFBE89 | #D97706 |  |
| `rubyMethodName` | primary | `syntaxFunction` | #FFBE89 | #D97706 |  |
| `rubyBlock` | primary | `syntaxFunction` | #FFBE89 | #D97706 |  |
| `rubyInclude` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `rubyAccess` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `rubyAttribute` | amber | `syntaxKeyword` | #D4A76A | #D97706 | italic |
| `rubyClassVariable` | color200 | `syntaxVariable` | #D4D4D4 | #333333 |  |
| `rubyInstanceVariable` | seafoam | `syntaxVariable` | #8dd3c3 | #0D9488 |  |
| `rubyGlobalVariable` | color200 | `syntaxVariable` | #D4D4D4 | #333333 |  |
| `rubyPredefinedConstant` | violet | `syntaxNumber` | #c678dd | #7C3AED |  |
| `rubySelf` | violet | `syntaxVariable` | #c678dd | #7C3AED | italic |
| `rubySymbol` | seafoam | `syntaxVariable` | #8dd3c3 | #0D9488 |  |
| `rubyString` | sage | `syntaxString` | #9db89c | #059669 |  |
| `rubyStringDelimiter` | sage | `syntaxString` | #9db89c | #059669 |  |
| `rubyInterpolation` | coral | `syntaxPunctuation` | #FF9E8B | #EA580C |  |
| `rubyInterpolationDelimiter` | coral | `syntaxPunctuation` | #FF9E8B | #EA580C |  |
| `rubyRegexp` | coral | `syntaxPunctuation` | #FF9E8B | #EA580C |  |
| `rubyRegexpDelimiter` | coral | `syntaxPunctuation` | #FF9E8B | #EA580C |  |
| `rubyBoolean` | tide | `secondary` | #79a0aa | #2563EB |  |
| `rubyConstant` | violet | `syntaxNumber` | #c678dd | #7C3AED |  |
| `rubyNumber` | violet | `syntaxNumber` | #c678dd | #7C3AED |  |
| `rubyOperator` | frost | `syntaxOperator` | #96a8ad | #2563EB |  |
| `rubyPseudoVariable` | violet | `syntaxVariable` | #c678dd | #7C3AED |  |
| `rubyComment` | color400 | `syntaxComment` | #696969 | #777777 |  |
| `rubyDocumentation` | color400 | `syntaxComment` | #696969 | #777777 |  |
| `rubyConditional` | tide | `secondary` | #79a0aa | #2563EB |  |
| `rubyRepeat` | tide | `secondary` | #79a0aa | #2563EB |  |
| `rubyException` | tide | `secondary` | #79a0aa | #2563EB |  |
| `rubyKeyword` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `rubySharpBang` | color400 | `syntaxComment` | #696969 | #777777 |  |
| `rubyReservedWord` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `rubyHash` | color400 | `syntaxPunctuation` | #696969 | #777777 |  |
| `rubyArrayDelimiter` | color400 | `syntaxPunctuation` | #696969 | #777777 |  |
| `@keyword.ruby` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `@keyword.function.ruby` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `@keyword.import.ruby` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `@function.ruby` | primary | `syntaxFunction` | #FFBE89 | #D97706 |  |
| `@function.method.ruby` | primary | `syntaxFunction` | #FFBE89 | #D97706 |  |
| `@function.call.ruby` | primary | `syntaxFunction` | #FFBE89 | #D97706 |  |
| `@function.builtin.ruby` | primary | `syntaxFunction` | #FFBE89 | #D97706 |  |
| `@method.ruby` | primary | `syntaxFunction` | #FFBE89 | #D97706 |  |
| `@method.call.ruby` | primary | `syntaxFunction` | #FFBE89 | #D97706 |  |
| `@type.ruby` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `@type.builtin.ruby` | amber | `syntaxType` | #D4A76A | #D97706 |  |
| `@type.class.ruby` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `@type.definition.ruby` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `@variable.ruby` | color200 | `syntaxVariable` | #D4D4D4 | #333333 |  |
| `@variable.builtin.ruby` | violet | `syntaxVariable` | #c678dd | #7C3AED | italic |
| `@variable.parameter.ruby` | color200 | `syntaxVariable` | #D4D4D4 | #333333 | italic |
| `@variable.member.ruby` | seafoam | `syntaxVariable` | #8dd3c3 | #0D9488 |  |
| `@property.ruby` | color300 | `syntaxVariable` | #A9A9A9 | #555555 |  |
| `@constant.ruby` | violet | `syntaxNumber` | #c678dd | #7C3AED | bold |
| `@constant.builtin.ruby` | tide | `secondary` | #79a0aa | #2563EB |  |
| `@string.special.symbol.ruby` | seafoam | `syntaxVariable` | #8dd3c3 | #0D9488 |  |
| `@string.regexp.ruby` | coral | `syntaxPunctuation` | #FF9E8B | #EA580C |  |
| `@punctuation.special.ruby` | coral | `syntaxPunctuation` | #FF9E8B | #EA580C |  |
| `@attribute.ruby` | amber | `syntaxKeyword` | #D4A76A | #D97706 | italic |
| `@operator.ruby` | frost | `syntaxOperator` | #96a8ad | #2563EB |  |
| `@label.ruby` | seafoam | `syntaxVariable` | #8dd3c3 | #0D9488 |  |
| `@constructor.ruby` | gold | `syntaxType` | #D4A017 | #B45309 | bold |
| `@comment.documentation.ruby` | color400 | `syntaxComment` | #696969 | #777777 |  |

### Rust (`langs/rust.lua`)

| Highlight group | yugen-ash role | opencode zone | dark | light | style / link |
| --------------- | -------------- | ------------- | ---- | ----- | ------------ |
| `rustKeyword` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `rustReservedKeyword` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `rustStorage` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `rustStructure` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `rustPubScopeCrate` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `rustModPath` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `rustModPathSep` | color400 | `syntaxPunctuation` | #696969 | #777777 |  |
| `rustIdentifier` | color200 | `syntaxVariable` | #D4D4D4 | #333333 |  |
| `rustFuncName` | primary | `syntaxFunction` | #FFBE89 | #D97706 |  |
| `rustFuncCall` | primary | `syntaxFunction` | #FFBE89 | #D97706 |  |
| `rustMacro` | violet | `syntaxNumber` | #c678dd | #7C3AED | bold |
| `rustMacroVariable` | violet | `syntaxVariable` | #c678dd | #7C3AED |  |
| `rustTrait` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `rustDeriveTrait` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `rustEnum` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `rustEnumVariant` | violet | `syntaxNumber` | #c678dd | #7C3AED |  |
| `rustType` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `rustSelf` | violet | `syntaxVariable` | #c678dd | #7C3AED | italic |
| `rustSigil` | frost | `syntaxOperator` | #96a8ad | #2563EB |  |
| `rustOperator` | frost | `syntaxOperator` | #96a8ad | #2563EB |  |
| `rustArrowCharacter` | frost | `syntaxOperator` | #96a8ad | #2563EB |  |
| `rustQuestionMark` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `rustLifetime` | amber | `syntaxType` | #D4A76A | #D97706 | italic |
| `rustLabel` | seafoam | `syntaxVariable` | #8dd3c3 | #0D9488 |  |
| `rustString` | sage | `syntaxString` | #9db89c | #059669 |  |
| `rustStringRaw` | sage | `syntaxString` | #9db89c | #059669 |  |
| `rustCharacter` | sage | `syntaxString` | #9db89c | #059669 |  |
| `rustEscape` | rust | `syntaxString` | #bc735c | #DC2626 |  |
| `rustFormat` | coral | `syntaxPunctuation` | #FF9E8B | #EA580C |  |
| `rustSpecial` | rust | `syntaxString` | #bc735c | #DC2626 |  |
| `rustComment` | color400 | `syntaxComment` | #696969 | #777777 |  |
| `rustCommentLine` | color400 | `syntaxComment` | #696969 | #777777 |  |
| `rustCommentBlock` | color400 | `syntaxComment` | #696969 | #777777 |  |
| `rustCommentLineDoc` | color400 | `syntaxComment` | #696969 | #777777 |  |
| `rustCommentBlockDoc` | color400 | `syntaxComment` | #696969 | #777777 |  |
| `rustAttribute` | amber | `syntaxKeyword` | #D4A76A | #D97706 | italic |
| `rustDerive` | amber | `syntaxType` | #D4A76A | #D97706 | italic |
| `rustConditional` | tide | `secondary` | #79a0aa | #2563EB |  |
| `rustRepeat` | tide | `secondary` | #79a0aa | #2563EB |  |
| `rustBoolean` | tide | `secondary` | #79a0aa | #2563EB |  |
| `rustConstant` | tide | `secondary` | #79a0aa | #2563EB |  |
| `rustDecNumber` | violet | `syntaxNumber` | #c678dd | #7C3AED |  |
| `rustHexNumber` | violet | `syntaxNumber` | #c678dd | #7C3AED |  |
| `rustOctNumber` | violet | `syntaxNumber` | #c678dd | #7C3AED |  |
| `rustBinNumber` | violet | `syntaxNumber` | #c678dd | #7C3AED |  |
| `rustFloat` | violet | `syntaxNumber` | #c678dd | #7C3AED |  |
| `@keyword.rust` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `@keyword.import.rust` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `@keyword.function.rust` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `@keyword.return.rust` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `@type.rust` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `@type.builtin.rust` | amber | `syntaxType` | #D4A76A | #D97706 |  |
| `@type.definition.rust` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `@function.rust` | primary | `syntaxFunction` | #FFBE89 | #D97706 |  |
| `@function.builtin.rust` | primary | `syntaxFunction` | #FFBE89 | #D97706 |  |
| `@function.macro.rust` | primary | `syntaxFunction` | #FFBE89 | #D97706 | bold |
| `@constant.rust` | violet | `syntaxNumber` | #c678dd | #7C3AED | bold |
| `@constant.builtin.rust` | tide | `secondary` | #79a0aa | #2563EB |  |
| `@variable.builtin.rust` | violet | `syntaxVariable` | #c678dd | #7C3AED | italic |
| `@module.rust` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `@constructor.rust` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `@attribute.rust` | amber | `syntaxKeyword` | #D4A76A | #D97706 | italic |
| `@label.rust` | amber | `syntaxType` | #D4A76A | #D97706 | italic |
| `@punctuation.special.rust` | coral | `syntaxPunctuation` | #FF9E8B | #EA580C |  |

### SQL (`langs/sql.lua`)

| Highlight group | yugen-ash role | opencode zone | dark | light | style / link |
| --------------- | -------------- | ------------- | ---- | ----- | ------------ |
| `sqlStatement` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `sqlKeyword` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `sqlSpecial` | rust | `syntaxString` | #bc735c | #DC2626 |  |
| `sqlConditional` | tide | `secondary` | #79a0aa | #2563EB |  |
| `sqlOperator` | frost | `syntaxOperator` | #96a8ad | #2563EB |  |
| `sqlFunction` | primary | `syntaxFunction` | #FFBE89 | #D97706 |  |
| `sqlType` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `sqlString` | sage | `syntaxString` | #9db89c | #059669 |  |
| `sqlNumber` | violet | `syntaxNumber` | #c678dd | #7C3AED |  |
| `sqlComment` | color400 | `syntaxComment` | #696969 | #777777 |  |
| `sqlVariable` | color200 | `syntaxVariable` | #D4D4D4 | #333333 |  |
| `sqlTable` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `sqlColumn` | color300 | `syntaxVariable` | #A9A9A9 | #555555 |  |
| `sqlParen` | color400 | `syntaxPunctuation` | #696969 | #777777 |  |
| `sqlError` | error | `error` | #F57A7A | #DC2626 |  |
| `@keyword.sql` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `@type.sql` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `@type.builtin.sql` | amber | `syntaxType` | #D4A76A | #D97706 |  |
| `@function.sql` | primary | `syntaxFunction` | #FFBE89 | #D97706 |  |
| `@function.builtin.sql` | primary | `syntaxFunction` | #FFBE89 | #D97706 |  |
| `@function.call.sql` | primary | `syntaxFunction` | #FFBE89 | #D97706 |  |
| `@string.sql` | sage | `syntaxString` | #9db89c | #059669 |  |
| `@number.sql` | violet | `syntaxNumber` | #c678dd | #7C3AED |  |
| `@boolean.sql` | tide | `secondary` | #79a0aa | #2563EB |  |
| `@constant.builtin.sql` | tide | `secondary` | #79a0aa | #2563EB |  |
| `@operator.sql` | frost | `syntaxOperator` | #96a8ad | #2563EB |  |
| `@field.sql` | color300 | `syntaxVariable` | #A9A9A9 | #555555 |  |
| `@variable.member.sql` | color300 | `syntaxVariable` | #A9A9A9 | #555555 |  |
| `@attribute.sql` | amber | `syntaxKeyword` | #D4A76A | #D97706 |  |
| `@punctuation.delimiter.sql` | color400 | `syntaxPunctuation` | #696969 | #777777 |  |
| `@punctuation.bracket.sql` | color400 | `syntaxPunctuation` | #696969 | #777777 |  |
| `@comment.sql` | color400 | `syntaxComment` | #696969 | #777777 |  |

### Svelte (`langs/svelte.lua`)

| Highlight group | yugen-ash role | opencode zone | dark | light | style / link |
| --------------- | -------------- | ------------- | ---- | ----- | ------------ |
| `svelteTag` | sage | `syntaxString` | #9db89c | #059669 |  |
| `svelteTagName` | sage | `syntaxString` | #9db89c | #059669 |  |
| `svelteComponentName` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `svelteAttribute` | gold | `syntaxType` | #D4A017 | #B45309 | italic |
| `svelteAttributeName` | gold | `syntaxType` | #D4A017 | #B45309 | italic |
| `svelteDirective` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `svelteKeyword` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `svelteConditional` | tide | `secondary` | #79a0aa | #2563EB |  |
| `svelteRepeat` | tide | `secondary` | #79a0aa | #2563EB |  |
| `svelteBraces` | coral | `syntaxPunctuation` | #FF9E8B | #EA580C |  |
| `svelteBlockKeyword` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `svelteString` | sage | `syntaxString` | #9db89c | #059669 |  |
| `@tag.svelte` | sage | `syntaxString` | #9db89c | #059669 |  |
| `@tag.builtin.svelte` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `@tag.attribute.svelte` | gold | `syntaxType` | #D4A017 | #B45309 | italic |
| `@tag.delimiter.svelte` | color400 | `syntaxPunctuation` | #696969 | #777777 |  |
| `@keyword.svelte` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `@keyword.conditional.svelte` | tide | `secondary` | #79a0aa | #2563EB |  |
| `@keyword.repeat.svelte` | tide | `secondary` | #79a0aa | #2563EB |  |
| `@keyword.import.svelte` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `@constant.svelte` | tide | `secondary` | #79a0aa | #2563EB |  |
| `@punctuation.special.svelte` | coral | `syntaxPunctuation` | #FF9E8B | #EA580C |  |
| `@punctuation.bracket.svelte` | coral | `syntaxPunctuation` | #FF9E8B | #EA580C |  |
| `@property.svelte` | color300 | `syntaxVariable` | #A9A9A9 | #555555 | italic |
| `@type.svelte` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `@function.svelte` | primary | `syntaxFunction` | #FFBE89 | #D97706 |  |
| `@variable.svelte` | color200 | `syntaxVariable` | #D4D4D4 | #333333 |  |

### TOML (`langs/toml.lua`)

| Highlight group | yugen-ash role | opencode zone | dark | light | style / link |
| --------------- | -------------- | ------------- | ---- | ----- | ------------ |
| `tomlTable` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `tomlTableArray` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `tomlKey` | tide | `secondary` | #79a0aa | #2563EB |  |
| `tomlKeyValueArray` | tide | `secondary` | #79a0aa | #2563EB |  |
| `tomlKeyDq` | tide | `secondary` | #79a0aa | #2563EB |  |
| `tomlKeySq` | tide | `secondary` | #79a0aa | #2563EB |  |
| `tomlString` | sage | `syntaxString` | #9db89c | #059669 |  |
| `tomlEscape` | rust | `syntaxString` | #bc735c | #DC2626 |  |
| `tomlBoolean` | tide | `secondary` | #79a0aa | #2563EB |  |
| `tomlInteger` | violet | `syntaxNumber` | #c678dd | #7C3AED |  |
| `tomlFloat` | violet | `syntaxNumber` | #c678dd | #7C3AED |  |
| `tomlDate` | violet | `syntaxNumber` | #c678dd | #7C3AED |  |
| `tomlComment` | color400 | `syntaxComment` | #696969 | #777777 |  |
| `tomlDotInKey` | color400 | `syntaxPunctuation` | #696969 | #777777 |  |
| `@property.toml` | tide | `secondary` | #79a0aa | #2563EB |  |
| `@type.toml` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `@string.toml` | sage | `syntaxString` | #9db89c | #059669 |  |
| `@boolean.toml` | tide | `secondary` | #79a0aa | #2563EB |  |
| `@number.toml` | violet | `syntaxNumber` | #c678dd | #7C3AED |  |
| `@constant.builtin.toml` | tide | `secondary` | #79a0aa | #2563EB |  |
| `@punctuation.delimiter.toml` | color400 | `syntaxPunctuation` | #696969 | #777777 |  |
| `@punctuation.bracket.toml` | color400 | `syntaxPunctuation` | #696969 | #777777 |  |
| `@comment.toml` | color400 | `syntaxComment` | #696969 | #777777 |  |

### TypeScript / TSX (`langs/typescript.lua`)

| Highlight group | yugen-ash role | opencode zone | dark | light | style / link |
| --------------- | -------------- | ------------- | ---- | ----- | ------------ |
| `typescriptReserved` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `typescriptLabel` | seafoam | `syntaxVariable` | #8dd3c3 | #0D9488 |  |
| `typescriptBraces` | color400 | `syntaxPunctuation` | #696969 | #777777 |  |
| `typescriptParens` | color400 | `syntaxPunctuation` | #696969 | #777777 |  |
| `typescriptEndColons` | color400 | `syntaxPunctuation` | #696969 | #777777 |  |
| `typescriptFuncKeyword` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `typescriptFuncName` | primary | `syntaxFunction` | #FFBE89 | #D97706 |  |
| `typescriptIdentifier` | color300 | `syntaxVariable` | #A9A9A9 | #555555 |  |
| `typescriptType` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `typescriptTypeReference` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `typescriptInterfaceName` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `typescriptClassName` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `typescriptClassKeyword` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `typescriptClassHeritage` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `typescriptExceptions` | tide | `secondary` | #79a0aa | #2563EB |  |
| `typescriptConditional` | tide | `secondary` | #79a0aa | #2563EB |  |
| `typescriptRepeat` | tide | `secondary` | #79a0aa | #2563EB |  |
| `typescriptStatementKeyword` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `typescriptOperator` | frost | `syntaxOperator` | #96a8ad | #2563EB |  |
| `typescriptBinaryOp` | tide | `secondary` | #79a0aa | #2563EB |  |
| `typescriptDecorator` | amber | `syntaxKeyword` | #D4A76A | #D97706 | italic |
| `typescriptImport` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `typescriptExport` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `typescriptModule` | violet | `syntaxNumber` | #c678dd | #7C3AED |  |
| `typescriptCall` | color200 | `syntaxVariable` | #D4D4D4 | #333333 |  |
| `typescriptArrowFunc` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `typescriptArrowFuncArg` | color200 | `syntaxVariable` | #D4D4D4 | #333333 |  |
| `typescriptBoolean` | tide | `secondary` | #79a0aa | #2563EB |  |
| `typescriptNull` | violet | `syntaxNumber` | #c678dd | #7C3AED |  |
| `typescriptNumber` | violet | `syntaxNumber` | #c678dd | #7C3AED |  |
| `typescriptGlobal` | amber | `syntaxType` | #D4A76A | #D97706 |  |
| `typescriptBuiltin` | amber | `syntaxType` | #D4A76A | #D97706 |  |
| `typescriptObjectLabel` | color300 | `syntaxVariable` | #A9A9A9 | #555555 |  |
| `typescriptVariable` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `typescriptTemplateSB` | coral | `syntaxPunctuation` | #FF9E8B | #EA580C |  |
| `@keyword.typescript` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `@keyword.import.typescript` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `@keyword.export.typescript` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `@keyword.function.typescript` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `@keyword.coroutine.typescript` | seafoam | `syntaxVariable` | #8dd3c3 | #0D9488 |  |
| `@lsp.typemod.variable.readonly.typescript` | color200 | `syntaxVariable` | #D4D4D4 | #333333 | link → `@variable` |
| `@function.typescript` | primary | `syntaxFunction` | #FFBE89 | #D97706 |  |
| `@function.builtin.typescript` | primary | `syntaxFunction` | #FFBE89 | #D97706 |  |
| `@constructor.typescript` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `@type.typescript` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `@type.builtin.typescript` | amber | `syntaxType` | #D4A76A | #D97706 |  |
| `@type.definition.typescript` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `@constant.builtin.typescript` | tide | `secondary` | #79a0aa | #2563EB |  |
| `@variable.builtin.typescript` | violet | `syntaxVariable` | #c678dd | #7C3AED |  |
| `@property.typescript` | color300 | `syntaxVariable` | #A9A9A9 | #555555 |  |
| `@attribute.typescript` | amber | `syntaxKeyword` | #D4A76A | #D97706 | italic |
| `@label.typescript` | seafoam | `syntaxVariable` | #8dd3c3 | #0D9488 |  |
| `@punctuation.special.typescript` | coral | `syntaxPunctuation` | #FF9E8B | #EA580C |  |

### YAML (`langs/yaml.lua`)

| Highlight group | yugen-ash role | opencode zone | dark | light | style / link |
| --------------- | -------------- | ------------- | ---- | ----- | ------------ |
| `yamlBlockMappingKey` | tide | `secondary` | #79a0aa | #2563EB |  |
| `yamlKey` | tide | `secondary` | #79a0aa | #2563EB |  |
| `yamlKeyValueDelimiter` | color400 | `syntaxPunctuation` | #696969 | #777777 |  |
| `yamlBlockMappingMerge` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `yamlBlockCollectionItemStart` | color400 | `syntaxPunctuation` | #696969 | #777777 |  |
| `yamlPlainScalar` | color200 | `syntaxVariable` | #D4D4D4 | #333333 |  |
| `yamlString` | sage | `syntaxString` | #9db89c | #059669 |  |
| `yamlFlowString` | sage | `syntaxString` | #9db89c | #059669 |  |
| `yamlFlowStringDelimiter` | sage | `syntaxString` | #9db89c | #059669 |  |
| `yamlSingleQuote` | sage | `syntaxString` | #9db89c | #059669 |  |
| `yamlDoubleQuote` | sage | `syntaxString` | #9db89c | #059669 |  |
| `yamlEscape` | rust | `syntaxString` | #bc735c | #DC2626 |  |
| `yamlBool` | tide | `secondary` | #79a0aa | #2563EB |  |
| `yamlNull` | violet | `syntaxNumber` | #c678dd | #7C3AED |  |
| `yamlInteger` | violet | `syntaxNumber` | #c678dd | #7C3AED |  |
| `yamlFloat` | violet | `syntaxNumber` | #c678dd | #7C3AED |  |
| `yamlTimestamp` | violet | `syntaxNumber` | #c678dd | #7C3AED |  |
| `yamlComment` | color400 | `syntaxComment` | #696969 | #777777 |  |
| `yamlAnchor` | amber | `syntaxType` | #D4A76A | #D97706 |  |
| `yamlAlias` | amber | `syntaxType` | #D4A76A | #D97706 |  |
| `yamlNodeTag` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `yamlDocumentStart` | color400 | `syntaxPunctuation` | #696969 | #777777 |  |
| `yamlDocumentEnd` | color400 | `syntaxPunctuation` | #696969 | #777777 |  |
| `yamlDirective` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `yamlFlowIndicator` | color400 | `syntaxPunctuation` | #696969 | #777777 |  |
| `yamlFlowMappingKey` | tide | `secondary` | #79a0aa | #2563EB |  |
| `@property.yaml` | tide | `secondary` | #79a0aa | #2563EB |  |
| `@field.yaml` | tide | `secondary` | #79a0aa | #2563EB |  |
| `@string.yaml` | sage | `syntaxString` | #9db89c | #059669 |  |
| `@boolean.yaml` | tide | `secondary` | #79a0aa | #2563EB |  |
| `@number.yaml` | violet | `syntaxNumber` | #c678dd | #7C3AED |  |
| `@constant.builtin.yaml` | tide | `secondary` | #79a0aa | #2563EB |  |
| `@type.yaml` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `@label.yaml` | amber | `syntaxType` | #D4A76A | #D97706 |  |
| `@punctuation.delimiter.yaml` | color400 | `syntaxPunctuation` | #696969 | #777777 |  |
| `@punctuation.special.yaml` | coral | `syntaxPunctuation` | #FF9E8B | #EA580C |  |
| `@comment.yaml` | color400 | `syntaxComment` | #696969 | #777777 |  |

### Zig (`langs/zig.lua`)

| Highlight group | yugen-ash role | opencode zone | dark | light | style / link |
| --------------- | -------------- | ------------- | ---- | ----- | ------------ |
| `zigKeyword` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `zigStorage` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `zigStructure` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `zigStatement` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `zigConditional` | tide | `secondary` | #79a0aa | #2563EB |  |
| `zigRepeat` | tide | `secondary` | #79a0aa | #2563EB |  |
| `zigExecution` | tide | `secondary` | #79a0aa | #2563EB |  |
| `zigException` | tide | `secondary` | #79a0aa | #2563EB |  |
| `zigType` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `zigTypeStyle` | amber | `syntaxType` | #D4A76A | #D97706 |  |
| `zigBuiltinType` | amber | `syntaxType` | #D4A76A | #D97706 |  |
| `zigBuiltinFn` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `zigBuiltin` | amber | `syntaxType` | #D4A76A | #D97706 |  |
| `zigConstant` | tide | `secondary` | #79a0aa | #2563EB |  |
| `zigBoolean` | tide | `secondary` | #79a0aa | #2563EB |  |
| `zigNull` | violet | `syntaxNumber` | #c678dd | #7C3AED |  |
| `zigDecNumber` | violet | `syntaxNumber` | #c678dd | #7C3AED |  |
| `zigHexNumber` | violet | `syntaxNumber` | #c678dd | #7C3AED |  |
| `zigFloat` | violet | `syntaxNumber` | #c678dd | #7C3AED |  |
| `zigString` | sage | `syntaxString` | #9db89c | #059669 |  |
| `zigMultilineString` | sage | `syntaxString` | #9db89c | #059669 |  |
| `zigCharacter` | sage | `syntaxString` | #9db89c | #059669 |  |
| `zigStringEscape` | rust | `syntaxString` | #bc735c | #DC2626 |  |
| `zigOperator` | frost | `syntaxOperator` | #96a8ad | #2563EB |  |
| `zigComment` | color400 | `syntaxComment` | #696969 | #777777 |  |
| `zigDocComment` | color400 | `syntaxComment` | #696969 | #777777 |  |
| `zigVarDecl` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `zigPubKeyword` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `zigLabel` | seafoam | `syntaxVariable` | #8dd3c3 | #0D9488 |  |
| `@keyword.zig` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `@keyword.function.zig` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `@keyword.coroutine.zig` | tide | `secondary` | #79a0aa | #2563EB |  |
| `@keyword.return.zig` | crimson | `syntaxKeyword` | #bf616a | #DC2626 |  |
| `@type.zig` | gold | `syntaxType` | #D4A017 | #B45309 |  |
| `@type.builtin.zig` | amber | `syntaxType` | #D4A76A | #D97706 |  |
| `@function.zig` | primary | `syntaxFunction` | #FFBE89 | #D97706 |  |
| `@function.builtin.zig` | primary | `syntaxFunction` | #FFBE89 | #D97706 |  |
| `@constant.zig` | violet | `syntaxNumber` | #c678dd | #7C3AED | bold |
| `@constant.builtin.zig` | tide | `secondary` | #79a0aa | #2563EB |  |
| `@variable.builtin.zig` | violet | `syntaxVariable` | #c678dd | #7C3AED |  |
| `@field.zig` | color300 | `syntaxVariable` | #A9A9A9 | #555555 |  |
| `@label.zig` | seafoam | `syntaxVariable` | #8dd3c3 | #0D9488 |  |
| `@string.escape.zig` | rust | `syntaxString` | #bc735c | #DC2626 |  |
| `@attribute.zig` | amber | `syntaxKeyword` | #D4A76A | #D97706 |  |

## Approximation notes

- opencode has no dedicated zones for booleans, annotations/decorators, labels/symbols, interpolation or escapes; those roles are mapped to the closest zone shown in the legend.
- `color400`→`syntaxComment` only for comment/docstring/shebang groups; all other `color400` groups (delimiters, brackets, colons, separators) map to `syntaxPunctuation`.
- `amber`→`syntaxKeyword` for attributes/decorators/annotations/options; `amber`→`syntaxType` otherwise (builtin types, lifetimes).
- `violet`→`syntaxVariable` for `*variable*`/`self`/`this`/`super` groups; otherwise `violet`→`syntaxNumber` (constants, macros, null/nil).
- Groups with only `link =` are resolved to their target's role and color.