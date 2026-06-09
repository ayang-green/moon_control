pub struct MotionLimiter {

  max_velocity : Double
  max_acc : Double
  max_jerk : Double

  mut last_velocity : Double
  mut last_acc : Double

}


pub fn MotionLimiter::new(max_velocity : Double, max_acc : Double, max_jerk : Double) -> MotionLimiter {

  {
    max_velocity,
    max_acc,
    max_jerk,

    last_velocity: 0.0,
    last_acc: 0.0
  }

}



pub fn MotionLimiter::update(self : MotionLimiter, target : Double, dt : Double) -> Double {


  let velocity = target / dt


  let mut acc = (velocity - self.last_velocity) / dt


  if acc > self.max_acc {
    acc = self.max_acc
  }


  if acc < -self.max_acc {
    acc = -self.max_acc
  }


  let jerk = (acc - self.last_acc) / dt


  let mut new_acc = acc


  if jerk > self.max_jerk {

    new_acc = self.last_acc + self.max_jerk * dt

  }


  if jerk < -self.max_jerk {

    new_acc = self.last_acc - self.max_jerk * dt

  }


  let new_velocity = self.last_velocity + new_acc * dt


  self.last_velocity = new_velocity


  self.last_acc = new_acc


  new_velocity * dt

}