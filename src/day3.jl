export Day3, Day3_1, Day3_2
abstract type Day3 <: Day end
abstract type Day3_1 <: Day3 end
abstract type Day3_2 <: Day3 end


solve(::Type{Day3_1}, lines::Vector) = solve(Day3_1, lines, 3, 1)
solve(::Type{Day3_2}, lines::Vector) = (
        [(1, 1), (3, 1), (5, 1), (7, 1), (1, 2)] .|> 
        x -> solve(Day3_2, lines, x[1], x[2])
    ) |> prod

solve(::Type{T}, lines::Vector, horizontal, vertical) where T <: Day3 = lines |> toforest |> f -> numtrees(f, horizontal, vertical)

function toforest(lines)
    forest = fill(false, (length(lines), length(lines[1])))
    for (i,line) in enumerate(lines)
        for (j,char) in enumerate(line)
            if char == '#'
                forest[i,j] = true
            end
        end
    end
    forest
end

function numtrees(forest, horizontal, vertical)
    current_y, current_x = 1,1
    y,x = size(forest)
    count = 0
    while current_y <= y
        count += forest[current_y, ((current_x-1) % x) + 1]
        current_y += vertical
        current_x += horizontal
    end
    count
end
