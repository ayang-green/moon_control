///|
/// Entry point for the CLI or runnable program in this template.
/// Keep main focused; move logic into the library package.
/// Run with `moon run cmd/main` from the project root.
fn main {

  let controller =@pid.PID::new(2.0, 0.5, 0.1, 0.01) .set_output_limit( -20.0, 20.0) .set_integral_limit( -10.0, 10.0)


  let mut position = 0.0


  for i in 0..<20 {


    let output = controller.update( 100.0, position)


    position = position + output * 0.01


    println(
      "step=" + i.to_string() + " pos=" + position.to_string() + " out=" + output.to_string())

  }

}