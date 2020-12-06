module AdventOfCode2020
# Write your package code here.
export Day
export read_infile, line_parser, solve

abstract type Day end

line_parser(::Type{<:Day}, line) = line |> strip

function read_infile(::Type{T}, path) where T <: Day
    open(path,"r") do datafile
        [line_parser(T, line) for line in eachline(datafile)]
    end
end

function split_on_empty_line(lines)
    if !("" == lines[end])
        push!(lines, "")
    end
    res = Vector{Vector{String}}()
    last_line = 1
    for i in 1:length(lines)
        if lines[i] == ""
            
            push!(res, lines[last_line:i-1])
            last_line = i + 1
        end
    end
    res
end

include("day1.jl")
include("day2.jl")
include("day3.jl")
include("day4.jl")
include("day5.jl")
include("day6.jl")

end

