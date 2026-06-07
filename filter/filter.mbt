pub struct LowPassFilter {
  alpha : Double
  mut output : Double
}


pub fn LowPassFilter::new(alpha : Double) -> LowPassFilter {

  {
    alpha,
    output: 0.0
  }

}


pub fn LowPassFilter::update(self : LowPassFilter, input : Double) -> Double {


  self.output = self.alpha * input + (1.0 - self.alpha) * self.output


  self.output

}



pub struct MovingAverageFilter {

  size : Int
  buffer : Array[Double]
  mut index : Int
  mut sum : Double

}


pub fn MovingAverageFilter::new( size : Int) -> MovingAverageFilter {


  {
    size,
    buffer: Array::make(size, 0.0),
    index: 0,
    sum: 0.0
  }

}



pub fn MovingAverageFilter::update( self : MovingAverageFilter, input : Double) -> Double {


  self.sum = self.sum - self.buffer[self.index]


  self.buffer[self.index] = input


  self.sum = self.sum + input


  self.index = (self.index + 1) % self.size


  self.sum / self.size.to_double()

}