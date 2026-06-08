///|
/// Entry point for the CLI or runnable program in this template.
/// Keep main focused; move logic into the library package.
/// Run with `moon run cmd/main` from the project root.
fn main {


  let profile = @trajectory.TrapezoidProfile::new(0.0, 100.0, 20.0, 50.0)


  let filter = @filter.LowPassFilter::new(0.2)


  let controller = @pid.PID::new(1.0, 0.1, 0.01, 0.1)


  let mut i = 0


  while i < 20 {


    let (target, _) = profile.update(0.1)


    let feedback = filter.update(target)


    let output = controller.update(target, feedback)


    println("target=" + target.to_string() + " feedback=" + feedback.to_string() + " output=" + output.to_string())


    i = i + 1

  }

}