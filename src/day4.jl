export Day4, Day4_1, Day4_2
abstract type Day4 <: Day end
abstract type Day4_1 <: Day4 end
abstract type Day4_2 <: Day4 end


solve(::Type{T}, path::String) where T <: Day4 = begin
    (path |> p -> read_infile(T, p) |> topassports .|> validpassport) |> sum
end

solve(::Type{T}, lines::Vector{String}) where T <: Day4 = begin
    (lines |> topassports .|> validpassport) |> sum
end

solve(::Type{Day4_1}) = solve(Day4_1, "$(@__DIR__)/assets/day4.txt")
solve(::Type{Day4_2}) = solve(Day4_2, "$(@__DIR__)/assets/day4.txt")

topassports(lines) = begin
    passports = Dict{String,String}[]
    parts = split_on_empty_line(lines)
    for part in parts
        p = (
                join(part, " ") |> 
                split .|> 
                l -> split(l, ":")
                ) |> Dict{String,String}
            push!(passports, p)
    end
    passports
end

hgt_test(hgt) = begin
    m=match(r"^(\d+)(.+)", hgt)
    if m == Nothing
        return false
    end
    n = parse(Int, m[1])
    t = m[2]    
    if "cm" == t
        low, high = 150, 193
    elseif "in" == t
        low, high = 59, 76
    else
        return false
    end
    low <= n <= high
end

validpassport(passport::Dict) = begin
    keyslength = keys(passport) |> length
    tests = Dict([
        "length"=> (keyslength == 8) | ((keyslength == 7) & ("cid" ∉ keys(passport))),
        "byr"=>1920 <= parse(Int, get(passport, "byr", "0")) <= 2002,
        "iyr"=>2010 <= parse(Int, get(passport, "iyr", "0")) <= 2020,
        "eyr"=>2020 <= parse(Int, get(passport, "eyr", "0")) <= 2030,
        "hcl"=>occursin(r"^#[a-f0-9]{6}$", get(passport, "hcl", "")),
        "ecl"=>get(passport, "ecl", "") ∈ ("amb", "blu", "brn", "gry", "grn", "hzl", "oth"),
        "pid"=>occursin(r"^[0-9]{9}$", get(passport, "pid", "")),
        "hgt"=>hgt_test(get(passport, "hgt", "0cm"))
    ])

    (false in values(tests)) ? false : true
end
