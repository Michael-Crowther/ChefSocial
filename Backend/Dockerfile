# Use the official Rust image as the base image
FROM rust:latest

# Set the working directory inside the container
WORKDIR /Backend

# Install diesel_cli for managing migrations
RUN cargo install diesel_cli --no-default-features --features sqlite

# Copy your Cargo files to cache dependencies
COPY Cargo.toml Cargo.lock ./

# Pre-fetch dependencies to leverage Docker caching
RUN cargo fetch

# Copy the rest of the project files
COPY . .


# Run migrations with the correct path
RUN diesel migration run --migration-dir ./src/db/migrations

# Build the Rust application
RUN cargo build --release

# Run the seed script as part of the build process
RUN cargo run --bin seed

# Expose the port your application will run on (change if necessary)
EXPOSE 3001

# Command to run your application
CMD ["./target/release/rust-backend"]