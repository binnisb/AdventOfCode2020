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

solve(::Type{T}, path::String) where T <: Day5 = begin
    (path |> p -> read_infile(T, p) .|> toseat .|> seat-> seat.id) |> sid -> day5_cond(T,sid)
end

day5_cond(::Type{Day5_1}, seat_ids) = seat_ids |> maximum
day5_cond(::Type{Day5_2}, seat_ids) = begin
    seat_ids = Set(seat_ids)
    
    for i in 1:length(seat_ids)-2
        if (i ∉ seat_ids) & (i-1 ∈ seat_ids) & (i+1 ∈ seat_ids)
            return i
        end
    end
end

solve(::Type{T}) where T <: Day5 = solve(T, "$(@__DIR__)/assets/day5.txt")


row(v) = v |> x-> replace(x,Pair("F","0")) |> x-> replace(x,Pair("B","1")) |> x-> parse(Int,x; base=2)
col(v) = v |> x-> replace(x,Pair("L","0")) |> x-> replace(x,Pair("R","1")) |> x-> parse(Int,x; base=2)

toseat(seat) = SeatLoc(row(seat[1:7]), col(seat[8:10]))
