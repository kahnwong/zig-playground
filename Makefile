run:
	zig run src/main.zig
build:
	zig build
build-release:
	zig build-exe src/main.zig -O ReleaseSmall -fsingle-threaded -fno-unwind-tables
