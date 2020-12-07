export Day5, Day5_1, Day5_2
abstract type Day5 <: Day end
abstract type Day5_1 <: Day5 end
abstract type Day5_2 <: Day5 end

struct SeatLoc
    row::Int
    col::Int
    id::Int
    SeatLoc(row,col) = new(row, col, row*8+col)
end

line_parser(::Type{<:Day5}, line) = toseat(line)

solve(::Type{Day5_1}, seats::Vector) = maximum((seat.id for seat in seats))
solve(::Type{Day5_2}, seats::Vector) = begin
    seat_ids = Set((seat.id for seat in seats))
    for i in 1:length(seat_ids)-2
        if (i ∉ seat_ids) & (i-1 ∈ seat_ids) & (i+1 ∈ seat_ids)
            return i
        end
    end
end

row(v) = v |> x-> replace(x,Pair("F","0")) |> x-> replace(x,Pair("B","1")) |> x-> parse(Int,x; base=2)
col(v) = v |> x-> replace(x,Pair("L","0")) |> x-> replace(x,Pair("R","1")) |> x-> parse(Int,x; base=2)

toseat(seat) = SeatLoc(row(seat[1:7]), col(seat[8:10]))