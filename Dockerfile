FROM watawuuw/rust AS rust-builder
ADD . .
RUN make release

FROM alpine:3.7
COPY --from=rust-builder /home/rust/src/target/x86_64-unknown-linux-musl/release/example-rust /usr/local/bin
CMD ["example-rust"]