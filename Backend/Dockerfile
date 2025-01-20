# Use the official Rust image as the base image
FROM rust:latest

# Set the working directory inside the container
WORKDIR /Backend

# Copy your project's files into the container
COPY . .

# Build the Rust application
RUN cargo build --release

# Expose the port your application will run on (change if necessary)
EXPOSE 8080

# Command to run your application
CMD ["./target/release/rust-backend"]