pub struct PID {
  kp : Double
  ki : Double
  kd : Double

  mut integral : Double
  mut prev_error : Double
}


pub fn PID::new(kp : Double, ki : Double, kd : Double) -> PID {

  {
    kp,
    ki,
    kd,
    integral: 0.0,
    prev_error: 0.0
  }

}


pub fn PID::update(self : PID, target : Double, current : Double) -> Double {

  let error = target - current

  self.integral = self.integral + error

  let derivative = error - self.prev_error

  let output =self.kp * error + self.ki * self.integral + self.kd * derivative


  self.prev_error = error

  output

}