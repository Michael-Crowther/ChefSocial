use axum::{routing::get, Json, Router};
use std::net::SocketAddr;

use rust_backend::api::users::fetch_random_user;
use rust_backend::db::establish_connection;
use rust_backend::db::models::User;

#[tokio::main]
async fn main() {
    let app = Router::new()
        .route("/", get(handler))
        .route("/random-user", get(random_user_handler));

    let addr = SocketAddr::from(([127, 0, 0, 1], 8080));
    println!("Server running at http://{}", addr);

    axum::Server::bind(&addr)
        .serve(app.into_make_service())
        .await
        .unwrap();
}

async fn handler() -> &'static str {
    "Hello, from Rust Backend!"
}

async fn random_user_handler() -> Json<Option<User>> {
    let mut conn = establish_connection();

    let user = fetch_random_user(&mut conn);

    Json(user)
}
