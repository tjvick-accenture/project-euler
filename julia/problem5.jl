#= 
2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20? =#
using Printf

## Brute force (too long)
function v1(range)
    num = 10
    match = 0
    while match == 0
        if all(num ./ (range) .% 1 .== 0)
            match = num
        end   
        num += 1
    end

    return match
end

## Less brutey
function v2(range)
    num = prod(range)
    reduced = false
    change = false
    for ix in reverse(range)
        candidate = num / ix
        if all(candidate ./ range .% 1 .== 0)
            num = candidate
        end
    end

    return num
end

println(@time println("V1: ", v1(1:10)))
println(@time println("V2: ", @sprintf "%i" v2(1:10)))
println(@time println("V2: ", @sprintf "%i" v2(1:20)))