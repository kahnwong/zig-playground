# run: # can't use if have deps
# 	zig run src/main.zig
build:
	zig build
run: build
	./zig-out/bin/zig_playground
build-release: # doesn't seem to work with deps
	zig build-exe src/main.zig -O ReleaseSmall -fsingle-threaded -fno-unwind-tables
