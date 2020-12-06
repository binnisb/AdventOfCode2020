
@testset "Day4.jl" begin
    # Write your tests here.
    lines =["ecl:gry pid:860033327 eyr:2020 hcl:#fffffd",
    "byr:1937 iyr:2017 cid:147 hgt:183cm"]
    
    pp = Dict(
        "ecl"=>"gry",
        "pid"=>"860033327",
        "eyr"=>"2020",
        "hcl"=>"#fffffd",
        "byr"=>"1937",
        "iyr"=>"2017",
        "cid"=>"147",
        "hgt"=>"183cm"
        )

    @test AdventOfCode2020.topassports(lines) == [pp]

    @test solve(Day4_1, "$(@__DIR__)/assets/day4_test1.txt") == 2

    lines_invalid = ["eyr:1972 cid:100",
    "hcl:#18171d ecl:amb hgt:170 pid:186cm iyr:2018 byr:1926",
    "",
    "iyr:2019",
    "hcl:#602927 eyr:1967 hgt:170cm",
    "ecl:grn pid:012533040 byr:1946",
    "",
    "hcl:dab227 iyr:2012",
    "ecl:brn hgt:182cm pid:021572410 eyr:2020 byr:1992 cid:277",
    "",
    "hgt:59cm ecl:zzz",
    "eyr:2038 hcl:74454a iyr:2023",
    "pid:3556412378 byr:2007"]

    @test solve(Day4_2, lines_invalid[1:2]) == 0
    @test solve(Day4_2, lines_invalid[4:6]) == 0
    @test solve(Day4_2, lines_invalid[8:9]) == 0
    @test solve(Day4_2, lines_invalid[11:13]) == 0
    @test solve(Day4_2, lines_invalid) == 0
    

    lines_valid = ["pid:087499704 hgt:74in ecl:grn iyr:2012 eyr:2030 byr:1980",
    "hcl:#623a2f",
    "",
    "eyr:2029 ecl:blu cid:129 byr:1989",
    "iyr:2014 pid:896056539 hcl:#a97842 hgt:165cm",
    "",
    "hcl:#888785",
    "hgt:164cm byr:2001 iyr:2015 cid:88",
    "pid:545766238 ecl:hzl",
    "eyr:2022",
    "",
    "iyr:2010 hgt:158cm hcl:#b6652a ecl:blu byr:1944 eyr:2021 pid:093154719"]

    @test solve(Day4_2, lines_valid[1:2]) == 1
    @test solve(Day4_2, lines_valid[4:5]) == 1
    @test solve(Day4_2, lines_valid[7:10]) == 1
    @test solve(Day4_2, lines_valid[12:12]) == 1
    @test solve(Day4_2, lines_valid) == 4
end
