# Triangle Project Code.

# Triangle analyzes the lengths of the sides of a triangle
# (represented by a, b and c) and returns the type of triangle.
#
# It returns:
#   :equilateral  if all sides are equal
#   :isosceles    if exactly 2 sides are equal
#   :scalene      if no sides are equal
#
# The tests for this method can be found in
#   about_triangle_project.rb
# and
#   about_triangle_project_2.rb
#
def is_equilateral(a, b, c)
  a == b and b == c
end

def is_isosceles(a, b, c)
  (a == b and b != c) or (b == c and a != b) or (a == c and b != c)
end

def positive(x)
  if x <= 0
    raise TriangleError, "Side length cannot be zero"
  end
end

def validate_positive(a, b, c)
  positive(a)
  positive(b)
  positive(c)
end

def validate_shorter_sides_add_up_to_more_than_longest_side(a, b, c) # TODO find a shorter name
  sides = [a, b, c]
  max = sides.max
  if max == a and b + c <= max
    raise TriangleError, "Invalid triangle"
  elsif max == b and a + c <= max
    raise TriangleError, "Invalid triangle" # duplication!
  elsif max == c and a + b <= max
    raise TriangleError, "Invalid triangle"
  end
end

def validate(a, b, c)
  validate_positive(a, b, c)
  validate_shorter_sides_add_up_to_more_than_longest_side(a, b, c)  
end

def triangle(a, b, c)
  # WRITE THIS CODE
  validate(a, b, c)
  if is_equilateral(a, b, c)
    :equilateral
  elsif is_isosceles(a, b, c)
    :isosceles
  else
    :scalene
  end
end

# Error class used in part 2.  No need to change this code.
class TriangleError < StandardError
end
