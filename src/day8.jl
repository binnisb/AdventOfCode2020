export Day8, Day8_1, Day8_2
abstract type Day8 <: Day end
abstract type Day8_1 <: Day8 end
abstract type Day8_2 <: Day8 end

abstract type ResultsType end
abstract type Acc <: ResultsType end
abstract type Jmp <: ResultsType end
abstract type Nop <: ResultsType end

struct Results{T<:ResultsType}
    line
    total
    type::Type{T}
end

line_parser(::Type{<:Day8}, line) = begin
    cmd, val = split(line)
    if startswith(val,"+")
        val = val[2:end]
    end
    val = parse(Int,val)
    if cmd == "nop"
        nop(val)
    elseif cmd == "jmp"
        jmp(val)
    elseif cmd == "acc"
        acc(val)
    end
end

process_program(lines) = begin
    total = 0
    processed = Set{Int}()
    line = 1
    while (line ∉ processed) & (line ≤ length(lines))
        push!(processed, line)
        res = lines[line]
        if res.type == Nop
            line += 1
        else
            line += res.line
        end
        total += res.total
    end
    total, line
end

solve(::Type{Day8_1}, lines::Vector) = process_program(lines)[1]

solve(::Type{Day8_2}, lines::Vector) = begin
    possible_changes = Dict{Int,Pair{Results,Results}}()

    for (i, l) in enumerate(lines)
        if l.type in Set([Nop, Jmp])
            possible_changes[i] = Pair(Results(l.line, l.total,Jmp), Results(l.line, l.total, Nop))
        end
    end
    for (k, values) in possible_changes
        org = lines[k]
        for v in values
            lines[k] = v
            t,l = process_program(lines)
            if l >length(lines)
                return t
            end
        end
        lines[k] = org
    end

end

nop(v) = Results(v,0, Nop)
acc(v) = Results(1,v, Acc)
jmp(v) = Results(v,0, Jmp)
