using LightGraphs, SimpleWeightedGraphs
export Day7, Day7_1, Day7_2
abstract type Day7 <: Day end
abstract type Day7_1 <: Day7 end
abstract type Day7_2 <: Day7 end

struct Bag
    hue
    color
    Bag(hue, color) = new(Symbol(hue), Symbol(color))
    Bag(str::AbstractString) = str |> split |> p -> new(Symbol(p[1]), Symbol(p[2]))
end

struct BagGraph
    bag_graph::Dict{Bag,Int}
    graph_bag::Dict{Int,Bag}
    graph::SimpleWeightedDiGraph
    BagGraph(lines::Vector) = begin
        g = SimpleWeightedDiGraph()
        bag_graph = Dict{Bag,Int}()
        graph_bag = Dict{Int,Bag}()

        node_count = 0
        for (b, bag_map) in lines
            if b ∉ keys(bag_graph)
                node_count += 1
                bag_graph[b] = node_count
                graph_bag[node_count] = b
                add_vertex!(g)
            end
            for (b_to, v) in bag_map
                if b_to ∉ keys(bag_graph)
                    node_count += 1
                    bag_graph[b_to] = node_count
                    graph_bag[node_count] = b_to
                    add_vertex!(g)
                end
                add_edge!(g, bag_graph[b], bag_graph[b_to], v)
            end
        end
        if !is_directed(g)
            throw("Not Directed")
        end

        new(bag_graph, graph_bag, g)
    end
end

line_parser(::Type{T}, line) where T<: Day7 = begin
    line = line |> l->replace(l,Pair(".","")) |> strip
    bag_first, rest = split(line, " contain ") 
    node = Bag(bag_first)

    can_contain = split(rest, ", ")
    contained = Dict{Bag,Int}()
    for b in can_contain
        if startswith(b, "no")
            continue
        else
            count, bag_next = split(b; limit=2)
            contained[Bag(bag_next)] = parse(Int, count)
        end
    end
    [node, contained]
end

function parents(s,g)
    r = neighbors(g,s)
    if length(r) == 0
        return Set([s])
    else
        res = [parents(n,g) for n in r]
        return union(Set([s]), res...)
    end
end

function bags_contained(s,g, w)
    r = neighbors(g,s)
    if length(r) == 0
        return 0
    else
        sub_bags = [(x,bags_contained(x,g, w), max(w[x,s],w[s,x])) for x in r]
        tot = sum([(1 + n)*v for (x,n,v) in sub_bags])
        return tot
    end
end

solve(::Type{T}, lines::Vector) where T <: Day7 = lines |> BagGraph |> bg -> solve(T, bg)

solve(::Type{T}, bg::BagGraph) where T <: Day7_1 = bg |> bg->parents(bg.bag_graph[Bag("shiny","gold")],DiGraph(bg.graph)) |> p->length(p) - 1
solve(::Type{T}, bg::BagGraph) where T <: Day7_2 = bg |>  bg->bags_contained(bg.bag_graph[Bag("shiny","gold")],reverse(DiGraph(bg.graph)),weights(bg.graph)) |> Int

tree_root(hue,color,dir, bg::BagGraph) = dfs_tree(bg.graph, bg.bag_graph[Bag(hue, color)];dir=dir) 
