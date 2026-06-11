pub struct FeedForward {

  velocity_gain : Double
  acceleration_gain : Double

  mut last_position : Double
  mut last_velocity : Double

}


pub fn FeedForward::new(kv : Double, ka : Double) -> FeedForward {

  {
    velocity_gain: kv,
    acceleration_gain: ka,

    last_position: 0.0,
    last_velocity: 0.0
  }

}


pub fn FeedForward::update(self : FeedForward, position : Double, dt : Double) -> Double {


  let velocity = (position - self.last_position) / dt


  let acceleration = (velocity - self.last_velocity) / dt


  let output = self.velocity_gain * velocity + self.acceleration_gain * acceleration


  self.last_position = position


  self.last_velocity = velocity


  output

}