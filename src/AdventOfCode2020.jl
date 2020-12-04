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

include("day1.jl")
include("day2.jl")
include("day3.jl")

end
