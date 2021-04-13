testtarget = 13195
realtarget = 600851475143

## Attempt 1: a hard way
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

v1(testtarget)
v1(realtarget)

## Attempt 2: using a package
import Primes:factor

function v2(target)
    maximum(factor(Vector, target))
end

v2(testtarget)
v2(realtarget)

## Attempt 3: Something more elegant
function v3(target)
    i = 2
    while i < target
        if target  % i == 0
            target /= i
        else
            i += 1
        end
    end

    i
end

v3(testtarget)
v3(realtarget)

##
println(@elapsed println("V1: ", v1(realtarget)))
println(@elapsed println("V2: ", v2(realtarget)))
println(@elapsed println("V3: ", v3(realtarget)))

## Another test
v1(84)
v2(84)
v3(84)
v1(84) == v2(84) == v3(84)
