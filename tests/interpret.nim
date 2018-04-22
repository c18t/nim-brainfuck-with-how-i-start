import unittest, brainfuck

suite "brainfuck interpreter":
  test "interpret helloworld":
    let helloworld = readFile("../examples/helloworld.b")
    check interpret(helloworld) == "Hello World!\n"
