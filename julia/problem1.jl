## Attempt 1
function v1()
  total = 0
  for i = 1:999
    if i % 3 == 0 || i % 5 == 0
      total += i
    end
  end

  return total
end

v1()

## Attempt 2
function v2()
  ismultiple(x) = x % 3 == 0 || x % 5 == 0
  sum(filter(ismultiple, 1:999))
end

v2()

## Attempt 3
function v3()
  ismultiple(x) = x % 3 == 0 || x % 5 == 0
  filter(ismultiple, 1:999) |> sum
end

v3()

## Print an answer
println(@elapsed println("V1: ", v1()))
println(@elapsed println("V2: ", v2()))
println(@elapsed println("V3: ", v3()))