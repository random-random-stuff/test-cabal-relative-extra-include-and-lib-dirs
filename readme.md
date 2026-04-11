
# Prerequisite

In repository root, on Linux (change for others accordingly):

```
$ (cd main/deps; gcc -shared -I. -O2 -o libcabal_test_foo.so cabal_test_foo.c)
```

# Bad

```
$ cd main
$ cabal build --extra-lib-dirs deps --extra-include-dirs deps
Resolving dependencies...
Build profile: -w ghc-9.14.1 -O1
In order, the following will be built (use -v for more details):
 - cabal-test-dependency-0.1 (lib) (first run)
 - cabal-test-main-0.1 (exe:main) (first run)
Configuring library for cabal-test-dependency-0.1...
Warning: [unknown-directory] 'extra-lib-dirs: deps' specifies a directory
which does not exist.
Warning: [unknown-directory] 'include-dirs: deps' specifies a directory which
does not exist.
Error: [Cabal-4345]
Missing dependency on a foreign library:
* Missing (or bad) header file: cabal_test_foo.h
* Missing (or bad) C library: cabal_test_foo
If the header file does exist, it may contain errors that are caught by the C compiler at the preprocessing stage. In this case you can re-run 'Setup configure' with the verbosity flag -v3 to see the error messages.
Error: [Cabal-7125]
Failed to build cabal-test-dependency-0.1 (which is required by exe:main from cabal-test-main-0.1). The failure occurred during the configure step.
```

# Good

```
$ cd main
$ cabal build --extra-lib-dirs $(pwd)/deps --extra-include-dirs $(pwd)/deps
Resolving dependencies...
Build profile: -w ghc-9.14.1 -O1
In order, the following will be built (use -v for more details):
 - cabal-test-dependency-0.1 (lib) (first run)
 - cabal-test-main-0.1 (exe:main) (first run)
Configuring library for cabal-test-dependency-0.1...
Preprocessing library for cabal-test-dependency-0.1...
Building library for cabal-test-dependency-0.1...
[1 of 1] Compiling Foo
Configuring executable 'main' for cabal-test-main-0.1...
Preprocessing executable 'main' for cabal-test-main-0.1...
Building executable 'main' for cabal-test-main-0.1...
[1 of 1] Compiling ExeMain
[2 of 2] Linking dist-newstyle/build/x86_64-linux/ghc-9.14.1/cabal-test-main-0.1/x/main/build/main/main
```
