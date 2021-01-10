
@testset "Day9.jl" begin
    # Write your tests here.
    lines = read_infile(Day9_1, "$(@__DIR__)/assets/day9_test1.txt")
    @test solve(Day9_1, lines, 5) == 127

    @test solve(Day9_2, lines, 5) == 62
end
