
@testset "Day5.jl" begin
    # Write your tests here.
    @test AdventOfCode2020.row("FFFFFFF") == 0
    @test AdventOfCode2020.row("BBBBBBB") == 127
    @test AdventOfCode2020.row("FFFFFFB") == 1
    @test AdventOfCode2020.row("FBFBBFF") == 44

    @test AdventOfCode2020.col("LLL") == 0
    @test AdventOfCode2020.col("RRR") == 7
    @test AdventOfCode2020.col("LLR") == 1
    @test AdventOfCode2020.col("RLR") == 5

    @test AdventOfCode2020.toseat("FBFBBFFRLR") == AdventOfCode2020.SeatLoc(44,5)
    @test AdventOfCode2020.toseat("FBFBBFFRLR").id == 357
    @test AdventOfCode2020.toseat("BFFFBBFRRR").id == 567
    @test AdventOfCode2020.toseat("FFFBBBFRRR").id == 119
    @test AdventOfCode2020.toseat("BBFFBBFRLL").id == 820
end
