
@testset "Day2.jl" begin
    # Write your tests here.
    @test solve(Day2_1, "$(@__DIR__)/assets/day2_test1.txt") == 2

    @test solve(Day2_2, "$(@__DIR__)/assets/day2_test1.txt") == 1
end
