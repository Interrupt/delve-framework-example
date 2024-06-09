const std = @import("std");
const delve = @import("delve");
const app = delve.app;

var gpa = std.heap.GeneralPurposeAllocator(.{}){};

pub fn main() !void {
    // Pick the allocator to use depending on platform
    const builtin = @import("builtin");
    if (builtin.os.tag == .wasi or builtin.os.tag == .emscripten) {
        // Web builds hack: use the C allocator to avoid OOM errors
        // See https://github.com/ziglang/zig/issues/19072
        try delve.init(std.heap.c_allocator);
    } else {
        try delve.init(gpa.allocator());
    }

    // create our module
    const example_module = delve.modules.Module{
        .name = "example",
        .draw_fn = on_draw,
    };

    try delve.modules.registerModule(example_module);

    // Note: Delve Framework expects there to be an assets directory
    try app.start(app.AppConfig{ .title = "Delve Framework Example" });
}

pub fn on_draw() void {
    delve.platform.graphics.setClearColor(delve.colors.Color.new(0.1, 0.1, 0.15, 1));
    delve.platform.graphics.drawDebugText(44, 40, "Hello Delve Framework!");
}
