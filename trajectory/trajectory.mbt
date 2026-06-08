pub struct TrapezoidProfile {

  start : Double
  target : Double

  max_velocity : Double
  max_acc : Double

  mut position : Double
  mut velocity : Double

  mut time : Double

}


pub fn TrapezoidProfile::new(
  start : Double,
  target : Double,
  max_velocity : Double,
  max_acc : Double
) -> TrapezoidProfile {


  {
    start,
    target,

    max_velocity,
    max_acc,

    position: start,
    velocity: 0.0,

    time: 0.0
  }

}



pub fn TrapezoidProfile::update( self : TrapezoidProfile, dt : Double) -> (Double, Double) {


  let distance = self.target - self.position


  let direction =
    if distance >= 0.0 {
      1.0
    } else {
      -1.0
    }


  let stop_distance = self.velocity * self.velocity / (2.0 * self.max_acc)



  if distance.abs() <= stop_distance {


    self.velocity = self.velocity - direction * self.max_acc * dt


  } else {


    if self.velocity.abs() < self.max_velocity {


      self.velocity = self.velocity + direction * self.max_acc * dt

    }

  }


  if self.velocity.abs() > self.max_velocity {


    self.velocity = direction * self.max_velocity

  }


  self.position = self.position + self.velocity * dt


  self.time = self.time + dt


  (
    self.position,
    self.velocity
  )

}