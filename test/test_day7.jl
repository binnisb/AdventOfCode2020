
@testset "Day7.jl" begin
    # Write your tests here.
    lines = read_infile(Day7_1, "$(@__DIR__)/assets/day7_test1.txt")
    @test solve(Day7_1, lines) == 4

    @test solve(Day7_2, lines) == 32
    
    lines = read_infile(Day7_1, "$(@__DIR__)/assets/day7_test2.txt")
    @test solve(Day7_2, lines) == 126
    
end
