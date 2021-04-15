#=

By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

What is the 10 001st prime number?

=#

# Approach 1: The hard way

function v1(n)
    primes = []
    number = 1
    while length(primes) < n
        number += 1
        if !any(number ./ primes .% 1 .== 0)
            append!(primes, number)
        end
    end

    # println(primes)
    return primes[end]
end

@time v1(10001)
#104743

## Approach 2: The hard way, but more complicated

function v2(n)
    primes = []
    number = 1
    while length(primes) < n
        number += 1
        unprime = false
        for prime in primes
            if prime > √number
                break
            end
            if (number / prime) % 1 == 0
                unprime = true
                break
            end
        end
        if !unprime
            append!(primes, number)
        end
    end

    # println(primes)
    return primes[end]
end

@time v2(10001)

## Approach 3: Quick checks to rule out primes
function isDefinitelyNotPrime(number)
    if iseven(number)
        return true
    end

    if number % 5 == 0
        return true
    end

    if (number + 1) % 6 !== 0 && (number - 1) % 6 !== 0
        return true
    end

    return false
end

function v3(n)
    primes = [2, 3]
    number = 3
    while length(primes) < n
        number += 1
        if isDefinitelyNotPrime(number)
            continue
        end

        hasFactor = false
        for prime in primes
            if prime > √number
                break
            end
            if (number / prime) % 1 == 0
                hasFactor = true
                break
            end
        end
        if !hasFactor
            append!(primes, number)
        end
    end

    return primes[end]
end

@time v3(10001)

## Approach 4: Use library
import Primes:nextprime

@time nextprime(1, 10001)