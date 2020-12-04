export Day1, Day1_1, Day1_2
abstract type Day1 <: Day end
abstract type Day1_1 <: Day1 end
abstract type Day1_2 <: Day1 end

solve(::Type{T}, path, sum_num, count) where T <: Day1 = begin
    path |> p -> read_infile(T, p) |> i -> find_sum_numbers(i, sum_num, count) |> prod
end
solve(::Type{Day1_1}) = solve(Day1_1, "$(@__DIR__)/assets/day1.txt", 2020, 2)
solve(::Type{Day1_2}) = solve(Day1_2, "$(@__DIR__)/assets/day1.txt", 2020, 3)

line_parser(::Type{<:Day1}, line) = parse(Int, line)

function find_sum_numbers(items, sum_to_find, how_many)
    sort!(items)
    for nums in Iterators.product([items for i in 1:how_many]...)
        val = sum(nums)
        if val == sum_to_find
            return nums
        end
    end
end