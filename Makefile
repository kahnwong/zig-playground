build:
	zig build
run: build
	./zig-out/bin/zig-playground
build-release:
	zig build -Doptimize=ReleaseSmall -Dtarget=x86_64-linux
