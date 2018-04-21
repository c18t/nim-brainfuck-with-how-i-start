# Hello Nim!
echo "Welcome to brainfuck"

import os

var
  tape: seq[char] = newSeq[char]()
  codePos: int = 0
  tapePos: int = 0

let code = if paramCount() > 0: readFile paramStr(1)
           else: readAll stdin

echo code

{.push overflowchecks: off.}
proc xinc(c: var char) = inc c
proc xdec(c: var char) = dec c
{.pop.}

proc run(skip = false): bool =
  while tapePos >= 0 and codePos < code.len:
    if tapePos >= tape.len:
      tape.add '\0'

    if code[codePos] == '[':
      inc codePos
      let oldPos = codePos
      while run(tape[tapePos] == '\0'):
        codePos = oldPos
    elif code[codePos] == ']':
      return tape[tapePos] != '\0'
    elif not skip:
      case code[codePos]
      of '+': xinc tape[tapePos]
      of '-': xdec tape[tapePos]
      of '>': inc tapePos
      of '<': dec tapePos
      of '.': stdout.write tape[tapePos]
      of ',': tape[tapePos] = stdin.readChar
      else: discard

    inc codePos

discard run()
