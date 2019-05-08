# SwiftInit

An example of why Swift projects are structured into separate Application and executable targets: it is not possible to import code from an executable target, thus it cannot be tested.

This project contains two targets, a library target 'Application' and an executable target 'SwiftInit'. A struct 'Apple' is defined in Application, and a struct 'Banana' is defined in SwiftInit.

The project can be built and run successfully. However, compiling the tests for this project will fail at the linker stage with something like:
```
Undefined symbols for architecture x86_64:
  "SwiftInit.Banana.init(banana: Swift.String) -> SwiftInit.Banana", referenced from:
      SwiftInitTests.SwiftInitTests.testFruit() throws -> () in SwiftInitTests.o
  "type metadata for SwiftInit.Banana", referenced from:
      SwiftInitTests.SwiftInitTests.testFruit() throws -> () in SwiftInitTests.o
ld: symbol(s) not found for architecture x86_64
clang: error: linker command failed with exit code 1 (use -v to see invocation)
```

The tests attempted to import both Application and SwiftInit in order to access Apple and Banana, respectively. But it seems the import of SwiftInit does not work. (I'm surprised this fails with a linker error rather than a more helpful message - maybe this will change in the future).
