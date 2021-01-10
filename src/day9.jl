export Day9, Day9_1, Day9_2
using DataStructures: CircularBuffer
abstract type Day9 <: Day end
abstract type Day9_1 <: Day9 end
abstract type Day9_2 <: Day9 end

line_parser(::Type{<:Day9}, line) = line |> strip |> l -> parse(Int, l)

solve(::Type{T}, lines::Vector) where T <: Day9 = solve(T, lines, 25)

solve(::Type{T}, lines::Vector, pre_length) where T <: Day9_1 = begin
    buffer = CircularBuffer{Int}((pre_length-1)*pre_length) 
    # Fill with sum of first "pre_length" numbers
    for i = 1:pre_length
        for j= 1:pre_length
            if i == j
                continue
            end
            push!(buffer, lines[i]+lines[j])
        end
    end
    for i = pre_length+1:length(lines)
        if lines[i] in buffer
            for j=i-pre_length:i-1
                if i == j
                    continue
                end
                push!(buffer, lines[i]+lines[j])
            end
        else
            return lines[i]
        end
    end
end

solve(::Type{T}, lines::Vector, pre_length) where T <: Day9_2 = begin
    num_sol = solve(Day9_1, lines, pre_length)
    for i = 1:length(lines)-1
        agg = lines[i]
        for j = i+1:length(lines)
            agg = agg + lines[j]
            if agg == num_sol
                return minimum(lines[i:j]) + maximum(lines[i:j])
            elseif agg > num_sol
                break
            end
        end
    end
end