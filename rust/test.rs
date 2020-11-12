use std::io::{self, BufRead};

fn main() {
    println!("Hello, world!");
    let mut line = String::new();
    let stdin = io::stdin();
    stdin.lock().read_line(&mut line).expect("ERR");
    print!("{}", line);
    print!("{:.2}", 5486.6542);
    println!("Hello, world!");
}
