const std = @import("std");
const zeit = @import("zeit");

pub fn main() !void {
    // Prints to stderr (it's a shortcut based on `std.io.getStdErr()`)
    std.debug.print("All your {s} are belong to us.\n", .{"codebase"});

    // stdout is for the actual output of your application, for example if you
    // are implementing gzip, then only the compressed bytes should be sent to
    // stdout, not any debugging messages.
    const stdout_file = std.io.getStdOut().writer();
    var bw = std.io.bufferedWriter(stdout_file);
    const stdout = bw.writer();

    try stdout.print("Run `zig build test` to run the tests.\n", .{});

    // sum
    const first_number = 3;
    const second_number = 2;
    const sum = add(first_number, second_number);
    try stdout.print("Sum of {d} and {d} is: {d}\n", .{first_number, second_number, sum});

    // datetime stuff
 const allocator = std.heap.page_allocator;
    var env = try std.process.getEnvMap(allocator);
    defer env.deinit();

    const now = try zeit.instant(.{});
    const local = try zeit.local(allocator, &env);
    const now_local = now.in(&local);
    const dt = now_local.time();

    try stdout.print("Current time: ", .{});
    try dt.strftime(stdout, "%Y-%m-%d %H:%M:%S %Z");
    try stdout.print("\n", .{});

    // cleanup
    try bw.flush(); // Don't forget to flush!
}

pub export fn add(a: i32, b: i32) i32 {
    return a + b;
}
