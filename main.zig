const std = @import("std");
const delve = @import("delve");
const app = delve.app;

pub fn main() !void {
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
    delve.api.draw.rectangle(40, 64, 450, 50, 6, 12);
}
