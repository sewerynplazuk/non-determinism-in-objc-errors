# NS_ERROR_ENUMs compilation nondeterminisms

## Repro steps

Run:
```
cd repo1
bazelisk clean
bazelisk build :NonDeterministicObjCErrors --experimental_execution_log_file=PATH_TO_FILE_1

cd ../repo2
bazelisk clean
bazelisk build :NonDeterministicObjCErrors --experimental_execution_log_file=PATH_TO_FILE_2
```

Next, diff the logs. You should notice hash difference between the `ErrorConsumer.swift.o` files, similar to that one:
```
inputs {
  path: "bazel-out/macos-arm64-applebin_macos-darwin_arm64-fastbuild-ST-cfb676c6944e/bin/NonDeterministicObjCErrors_swift_objs/NonDeterministicObjCErrors/ErrorConsumer.swift.o"
  digest {
    hash: "db924528d7e001cb102cfcfc4d6eeb28c31f617f3dfb59b4c6a86a8064844396"
    size_bytes: 28056
    hash_function_name: "SHA-256"
  }
}

inputs {
  path: "bazel-out/macos-arm64-applebin_macos-darwin_arm64-fastbuild-ST-cfb676c6944e/bin/NonDeterministicObjCErrors_swift_objs/NonDeterministicObjCErrors/ErrorConsumer.swift.o"
  digest {
    hash: "8f76335dd99e27f7c2efff283be8ae709414035defdb528b543ba814dd2c2ada"
    size_bytes: 28056
    hash_function_name: "SHA-256"
  }
}
```

