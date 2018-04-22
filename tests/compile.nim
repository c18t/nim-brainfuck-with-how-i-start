import unittest, brainfuck, streams

suite "brainfuck compiler":
  test "compile helloworld":
    proc helloworld: string =
      result = compileFile("../examples/helloworld.b")
    check helloworld() == "Hello World!\n"
