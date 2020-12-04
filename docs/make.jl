using AdventOfCode2020
using Documenter

makedocs(;
    modules=[AdventOfCode2020],
    authors="Brynjar Smári Bjarnason <binni@binnisb.com> and contributors",
    repo="https://github.com/binnisb/AdventOfCode2020.jl/blob/{commit}{path}#L{line}",
    sitename="AdventOfCode2020.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://binnisb.github.io/AdventOfCode2020.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/binnisb/AdventOfCode2020.jl",
)
