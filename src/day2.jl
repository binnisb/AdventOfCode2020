export Day2, Day2_1, Day2_2
abstract type Day2 <: Day end
abstract type Day2_1 <: Day2 end
abstract type Day2_2 <: Day2 end

struct Day2Line
    low::Int
    high::Int
    char::Char
    password::String
end

line_parser(::Type{<:Day2}, line) = begin 
    (first, middle, last) = line |> strip |> split
    low, high = first |> s -> split(s, "-") .|> s -> parse(Int,s)
    Day2Line(low, high, middle[1], last)
end

solve(::Type{T}, lines::Vector) where T <: Day2 = lines |> lines -> valids(T, lines) |> sum

valids(::Type{T}, lines::Array{Day2Line,1}) where T <: Day2 = lines .|> l -> validpassword(T, l) 

function validpassword(::Type{Day2_1}, line::Day2Line)
    count = 0
    for c in line.password
        if c == line.char
            count += 1
        end
    end
    line.low <= count <= line.high
end

function validpassword(::Type{Day2_2}, line::Day2Line)
    chars = Set([line.password[line.low], line.password[line.high]])
    (line.char in chars) & (length(chars) == 2)
end