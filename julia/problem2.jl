## Attempt 1
function v1()
    upperbound = 4e6

    total = 0
    previous = (0, 1)
    while previous[2] < upperbound
        previous = (previous[2], sum(previous))
        if previous[2] % 2 == 0
            total += previous[2]
        end
    end

    return total
end

v1()

## Attempt 2
function v2()
    upperbound = 4e6

    total = 0
    (a, b) = (0, 1)
    while b < upperbound
        (a, b) = (b, a + b)
        if b % 2 == 0
            total += b
        end
    end

    return total
end

v2()

## Attempt 3
function v3()
    function fibevensum((a, b), total, upperbound)
        b > upperbound ? total : fibevensum((b, a+b), iseven(b) ? total + b : total, upperbound)
    end

    fibevensum((0, 1), 0, 4e6)
end

v3()

## Print an answer
println(@elapsed println("V1: ", v1()))
println(@elapsed println("V2: ", v2()))
println(@elapsed println("V3: ", v3()))