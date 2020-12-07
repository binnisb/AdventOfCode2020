export Day6, Day6_1, Day6_2
abstract type Day6 <: Day end
abstract type Day6_1 <: Day6 end
abstract type Day6_2 <: Day6 end

solve(::Type{T}, path::String) where T <: Day6 = begin
    path |> p -> read_infile(T, p) |> split_on_empty_line |> lines -> day6_cond(T, lines)
end

solve(::Type{T}, lines::Vector{Vector{String}}) where T <: Day6 = begin
    day6_cond(T,lines)
end

day6_cond(::Type{Day6_1}, groups) = (groups .|> x-> join(x,"") |> Set |> length) |> sum
day6_cond(::Type{Day6_2}, groups) = (groups .|> group -> map(Set,group) |> x->intersect(x...) |> length) |> sum

solve(::Type{T}) where T <: Day6 = solve(T, "$(@__DIR__)/assets/day6.txt")

