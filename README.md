# Delve Framework Build Example

This repository shows how to include and use the Delve Framework in another Zig project using Zig's package manager.

Currently targets Zig 0.12.0

## Build and run
To build and run natively:
```
zig build run
```

To build for web:
```
zig build run -Dtarget=wasm32-emscripten
```
