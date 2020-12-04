
@testset "Day1.jl" begin
    # Write your tests here.
    input = read_infile(Day1_1, "$(@__DIR__)/assets/day1_test1.txt")
    @test solve(Day1_1) == 514579
end
