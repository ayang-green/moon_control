///|
/// Entry point for the CLI or runnable program in this template.
/// Keep main focused; move logic into the library package.
/// Run with `moon run cmd/main` from the project root.
fn main {


  let lowpass = @filter.LowPassFilter::new( 0.2)


  let average = @filter.MovingAverageFilter::new( 5)


  let data = [
    10.0,
    30.0,
    5.0,
    50.0,
    20.0
  ]


  for value in data {


    let a = lowpass.update(value)


    let b = average.update(value)


    println("input=" + value.to_string() + " lowpass=" + a.to_string() + " average=" + b.to_string())

  }

}