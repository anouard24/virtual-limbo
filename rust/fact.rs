
fn fact(n: u64) -> u64 {
	if n < 2 {
		1
	}
	else {
		n * fact(n - 1)
	}

}

fn main() {
	println!("{:?}", fact(5));
}
