///|
/// Entry point for the CLI or runnable program in this template.
/// Keep main focused; move logic into the library package.
/// Run with `moon run cmd/main` from the project root.
fn main {

  let controller = @pid.PID::new(1.0, 0.1, 0.05)


  let mut current = 0.0


  for i in 0..<10 {

    let output =controller.update(100.0, current)

    current = current + output * 0.1


    println("step=" + i.to_string() + " output=" + output.to_string())

  }

}
