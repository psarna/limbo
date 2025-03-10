all: limbo limbo-wasm
.PHONY: all

limbo:
	cargo build
.PHONY: limbo

limbo-wasm:
	rustup target add wasm32-wasi
	cargo build --package limbo-wasm --target wasm32-wasi
.PHONY: limbo-wasm

test: limbo
	SQLITE_EXEC=./target/debug/limbo ./testing/all.test
.PHONY: test
