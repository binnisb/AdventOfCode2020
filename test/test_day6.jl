
@testset "Day6.jl" begin
    # Write your tests here.
    lines = [
        "abc",
        "",
        "a",
        "b",
        "c",
        "",
        "ab",
        "ac",
        "",
        "a",
        "a",
        "a",
        "a",
        "",
        "b"]
    @test solve(Day6_1, lines) == 11 

    @test solve(Day6_2, lines) == 6
end
