const std = @import("std");

const AppPermission = packed struct {
    files_read: u1,
    files_write: u1, 
    users_read: u1,
    users_write: u1,
    tickets_read: u1,
    tickets_write: u1,
    dashboard_read: u1,
    dashboard_write: u1
};

pub fn main() !void {
    const admin: AppPermission = .{
        .files_read = 1, 
        .files_write = 1,
        .users_read = 1,
        .users_write = 1,
        .tickets_read = 1,
        .tickets_write = 1,
        .dashboard_read = 1,
        .dashboard_write = 1
    };

    const none: AppPermission = .{
        .files_read = 0, 
        .files_write = 0,
        .users_read = 0,
        .users_write = 0,
        .tickets_read = 0,
        .tickets_write = 0,
        .dashboard_read = 0,
        .dashboard_write = 0
    };

    const analyst: AppPermission = .{
        .files_read = 1, 
        .files_write = 0,
        .users_read = 0,
        .users_write = 0,
        .tickets_read = 1,
        .tickets_write = 1,
        .dashboard_read = 1,
        .dashboard_write = 0
    };

    const read_only: AppPermission = .{
        .files_read = 1, 
        .files_write = 0,
        .users_read = 1,
        .users_write = 0,
        .tickets_read = 1,
        .tickets_write = 0,
        .dashboard_read = 1,
        .dashboard_write = 0
    };

    const dash_viewer: AppPermission = .{
        .files_read = 0, 
        .files_write = 0,
        .users_read = 0,
        .users_write = 0,
        .tickets_read = 0,
        .tickets_write = 0,
        .dashboard_read = 1,
        .dashboard_write = 0
    };

    const field_size = @bitSizeOf(AppPermission);
    std.debug.print("Size of AppPermission bitfield: {d} bits\n\n", .{field_size});
    std.debug.print("Name:       |DEC|HEX |BIN     |\n", .{});
    std.debug.print("-------------------------------\n", .{});
    printPermission("none", none);
    printPermission("dash_viewer", dash_viewer);
    printPermission("read_only", read_only);
    printPermission("analyst", analyst);
    printPermission("admin", admin);
}

pub fn printPermission(name: []const u8, perm: AppPermission, ) void {
    const byte: u8 = @bitCast(perm);
    std.debug.print("{s: <12}|{d:0>3}|0x{x:0>2}|{b:0>8}|\n", .{name, byte, byte, byte});
}
