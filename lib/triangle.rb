class Triangle
  attr_reader :left, :right, :bottom
  def initialize left, right, bottom
    @left = left
    @right = right
    @bottom = bottom
  end

  def kind
    validate_triangle
    if left == right && right == bottom
      :equilateral
    elsif left == right || right == bottom || left == bottom
      :isosceles
    else
      :scalene
    end
  end

  def size?
    [left, right, bottom].each {|side| return false if side <= 0}
    true
  end
  
  def sides?
    if (left + right) <= bottom
      return false
    elsif (left + bottom) <= right
      return false
    elsif (right + bottom) <= left
      return false
    end

    true
  end

  def validate_triangle
    raise TriangleError unless size? && sides?
  end

  
  private
  
  class TriangleError < StandardError
    def message
      puts "error broken"
    end
  end
end
