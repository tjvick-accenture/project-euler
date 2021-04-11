## Attempt 1
function v1(target)
  primeset = []
  i = 2
  while i < √target
    if target % i == 0 && !any(i .% primeset .== 0)
      append!(primeset, i)
    end
    i += 1
  end

  maximum(primeset)
end

v1(13195)
v1(600851475143)

## Attempt 2
# using a package
import Primes: factor

function v2(target)
  maximum(factor(Vector, target))
end

v2(13195)
v2(600851475143)

##
println("Attempt 1: ", v1(600851475143))
println("Attempt 2: ", v2(600851475143))