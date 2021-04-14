#=
A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

Find the largest palindrome made from the product of two 3-digit numbers.
=#

## Attempt 1: Brute force
function v1()
  maxpalindrome = 0
  for i in 100:999
    for j in 100:999
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

## Attempt 2: Skip non-candidates in second for-loop
function v2()
  maxpalindrome = 0

  for i in 100:999
    for j in 100:999
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

## Attempt 3: Begin at max end; short-circuit loops; only search upper triangle of multiplication table
function v3()
  maxpalindrome = 0
  for i in 999:-1:100
    if i * 999 < maxpalindrome
      return maxpalindrome
    end
    for j in 999:-1:100
      if j < i || j < (maxpalindrome / i)
        break
      end
      product = i*j
      if string(product) == reverse(string(product))
        maxpalindrome = product
      end
    end
  end
end

v3()

## Attempt 4: Make palindromes first
function isProduct(palindrome)
  for j in 999:-1:100
    factor = palindrome / j
    if factor > 999
      return false
    end
    if factor % 1 == 0
      return true
    end
  end

  return false
end

function v4()
  for i in 999:-1:100
    rev = reverse(string(i))
    palindrome = parse(Int64, "$i$rev")
    if isProduct(palindrome)
      return palindrome
    end
  end
end

v4()

## Print and Summarize
println(@time println("V1: ", v1()))
println(@time println("V2: ", v2()))
println(@time println("V3: ", v3()))
println(@time println("V4: ", v4()))