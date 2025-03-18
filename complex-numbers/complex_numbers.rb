class ComplexNumber
  attr_accessor :real, :imaginary

  def initialize(real, imaginary = 0)
    self.real = real
    self.imaginary = imaginary
  end

  def +(other)
    ComplexNumber.new(real + other.real, imaginary + other.imaginary)
  end

  def -(other)
    ComplexNumber.new(real - other.real, imaginary - other.imaginary)
  end

  def *(other)
    ComplexNumber.new(
      real * other.real - imaginary * other.imaginary,
      real * other.imaginary + imaginary * other.real
    )
  end


  def inv
    ComplexNumber.new(real / abs**2, -imaginary / abs**2)
  end

  def /(other)
    self * other.inv
  end

  def abs
    Math.sqrt((self * conjugate).real)
  end

  def conjugate
    ComplexNumber.new(real, -imaginary)
  end

  def exp
    ComplexNumber.new(Math.exp(real)) *
      ComplexNumber.new(Math.cos(imaginary), Math.sin(imaginary))
  end

  def ==(other)
    (self - other).abs < 1e-15
  end
end
