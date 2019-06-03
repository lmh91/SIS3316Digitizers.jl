@inline all_eq(x::Tuple{Any,Any}) = x[1] == x[2]

@inline function all_eq(x1::Tuple{Any,Any}, x2::Tuple{Any,Any}, xs::Tuple{Any,Any}...)
    c1 = all_eq(x1)
    c2 = all_eq(x2, xs...)
    c1 && c2
end


@inline hierarchial_lt(x::Tuple{Any,Any}) = x[1] < x[2]

@inline function hierarchial_lt(x1::Tuple{Any,Any}, x2::Tuple{Any,Any}, xs::Tuple{Any,Any}...)
    c1 = hierarchial_lt(x1)
    c2 = all_eq(x1)
    r2 = hierarchial_lt(x2, xs...)
    ifelse(c1, true, ifelse(c2, r2, false))
end


@inline hierarchial_le(x::Tuple{Any,Any}) = x[1] <= x[2]

@inline function hierarchial_le(x1::Tuple{Any,Any}, x2::Tuple{Any,Any}, xs::Tuple{Any,Any}...)
    c1 = hierarchial_lt(x1)
    c2 = all_eq(x1)
    r2 = hierarchial_le(x2, xs...)
    ifelse(c1, true, ifelse(c2, r2, false))
end
