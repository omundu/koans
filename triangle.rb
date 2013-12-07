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
def triangle(a, b, c)
  illegal_triangle(a, b, c)
  if is_equilateral?(a, b, c)
    :equilateral
  elsif is_isosceles?(a, b, c)
    :isosceles 
  else
    :scalene
  end
end

def is_equilateral?(a, b, c)
  a == b && b == c && a == c
end

def is_isosceles?(a, b, c)
  a == b || b == c || a == c
end

def is_scalene?(a, b, c)
  a != b && b != c && a != c
end

def illegal_triangle(*sides)
  raise TriangleError, "Sides cannot be zero" if sides.include?(0)
  raise TriangleError, "Sides cannot be negative" if sides.any?{|side| side < 0 }
  raise TriangleError, "Sum of two sides cannot be < than the third" if two_sides_less_third_side?(sides)
end

def two_sides_less_third_side?(sides)
  a, b, c = sides.sort
  (a + b) <= c
end
# Error class used in part 2.  No need to change this code.
class TriangleError < StandardError
end
