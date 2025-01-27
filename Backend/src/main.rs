use axum::{routing::get, Router};
use rust_backend::handlers::{recipes, users};
use std::net::SocketAddr;

#[tokio::main]
async fn main() {
    let app = Router::new()
        .route("/", get(health_handler))
        .route(
            "/recipes",
            get(recipes::get_recipes).post(recipes::create_recipe),
        )
        .route("/random-user", get(users::get_random_user));

    let addr = SocketAddr::from(([0, 0, 0, 0], 3001));
    println!("Server running at http://{}", addr);

    axum::Server::bind(&addr)
        .serve(app.into_make_service())
        .await
        .unwrap();
}

async fn health_handler() -> &'static str {
    "Hello, from Rust Backend!"
}
