pub struct PID {
  kp : Double
  ki : Double
  kd : Double

  dt : Double

  output_min : Double
  output_max : Double

  integral_min : Double
  integral_max : Double

  mut integral : Double
  mut prev_error : Double
}


pub fn PID::new(kp : Double, ki : Double, kd : Double, dt : Double) -> PID {

  {
    kp,
    ki,
    kd,
    dt,

    output_min: -100.0,
    output_max: 100.0,

    integral_min: -50.0,
    integral_max: 50.0,

    integral: 0.0,
    prev_error: 0.0
  }

}


pub fn PID::set_output_limit( self : PID, min : Double, max : Double) -> PID {

  {
    ..self,
    output_min: min,
    output_max: max
  }

}


pub fn PID::set_integral_limit( self : PID, min : Double, max : Double) -> PID {

  {
    ..self,
    integral_min: min,
    integral_max: max
  }

}


pub fn PID::update( self : PID, target : Double, current : Double) -> Double {


  let error = target - current


  self.integral = self.integral + error * self.dt


  // anti windup
  if self.integral > self.integral_max {

    self.integral = self.integral_max

  }


  if self.integral < self.integral_min {

    self.integral = self.integral_min

  }


  let derivative = (error - self.prev_error) / self.dt


  let mut output = self.kp * error + self.ki * self.integral + self.kd * derivative



  // output saturation

  if output > self.output_max {

    output = self.output_max

  }


  if output < self.output_min {

    output = self.output_min

  }


  self.prev_error = error


  output

}