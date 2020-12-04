
@testset "Day3_2.jl" begin
    # Write your tests here.
    diag_3_3 = reshape([true,false,false,false,true,false,false,false,true],(3,3))
    diag_3_2 = reshape([true,false,true,false,true,true],(3,2))
    @test AdventOfCode2020.toforest(["#..",".#.","..#"]) == diag_3_3
    @test AdventOfCode2020.numtrees(diag_3_3,1,1) == 3
    @test AdventOfCode2020.numtrees(diag_3_2,1,1) == 3

    @test solve(Day3_1, "$(@__DIR__)/assets/day3_test1.txt", 3, 1) == 7
end
