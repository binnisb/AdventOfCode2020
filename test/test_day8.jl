
@testset "Day8.jl" begin
    # Write your tests here.
    lines = read_infile(Day8_1, "$(@__DIR__)/assets/day8_test1.txt")
    @test solve(Day8_1, lines) == 5

    @test solve(Day8_2, lines) == 8
end
