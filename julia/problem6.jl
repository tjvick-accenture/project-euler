#= 
Find the difference between 
the sum of the squares of the first one hundred natural numbers and 
the square of the sum.
=#

## Directly
function v1(n)
  sum(1:n)^2 - sum((1:n) .^ 2)
end

println("V1: ", v1(100))
@time v1(100)

## Another way
function v2(n)
  total = 0
  height = 0
  for ix in 1:n
    total += ix*height
    height += ix
  end

  return total*2
end

println("V2: ", v2(100))
@time v2(100)