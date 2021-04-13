#=
A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

Find the largest palindrome made from the product of two 3-digit numbers.
=#

## Attempt 1
function v1()
  maxpalindrome = 0
  for i in 1:999
    for j in 1:999
      product = i*j
      if string(product) == string(product)[end:-1:1]
        if product > maxpalindrome
          maxpalindrome = product
        end
      end
    end
  end

  maxpalindrome
end

v1()

## Attempt 2
function v2()
  maxpalindrome = 0

  for i in 1:999
    for j in 1:999
      if j < maxpalindrome / i
        continue
      end
      product = i*j
      if string(product) == string(product)[end:-1:1]
        if product > maxpalindrome
          maxpalindrome = product
        end
      end
    end
  end

  maxpalindrome
end

v2()

## Attempt 3
function v3()
  maxpalindrome = 0
  for i in 999:-1:1
    if i * 999 < maxpalindrome
      return maxpalindrome
    end
    for j in 999:-1:1
      if j < i
        continue
      end
      product = i*j
      if string(product) == string(product)[end:-1:1]
        if product > maxpalindrome
          maxpalindrome = product
        end
      end
    end
  end
end

v3()

## Print and Summarize
println(@elapsed println("V1: ", v1()))
println(@elapsed println("V2: ", v2()))
println(@elapsed println("V3: ", v3()))