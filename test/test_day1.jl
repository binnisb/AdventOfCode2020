
@testset "Day1.jl" begin
    # Write your tests here.
    @test solve(Day1_1, "$(@__DIR__)/assets/day1_test1.txt", 2020, 2) == 514579
end
