using SimpleTraits.BaseTraits

@test istrait(TAny{Any})
@test istrait(TAny{None})
@test istrait(TAny{Int})

@test !istrait(TNone{Any})
@test !istrait(TNone{None})
@test !istrait(TNone{Int})

@test istrait(IsBits{Int})
@test !istrait(IsBits{Vector{Int}})

@test istrait(IsImmutable{Float64})
@test !istrait(IsImmutable{Vector{Int}})

@test !istrait(IsCallable{Float64})
@test istrait(IsCallable{Function})

if VERSION>v"0.4-" # use @generated functions
    @test istrait(IsContiguous{SubArray{Int64,1,Array{Int64,1},Tuple{UnitRange{Int64}},1}})
    @test !istrait(IsContiguous{SubArray{Int64,1,Array{Int64,1},Tuple{StepRange{Int64,Int64}},1}})

    @test istrait(IsFastLinearIndex{Vector})
    @test !istrait(IsFastLinearIndex{AbstractArray})

    @test istrait(IsCallable{Base.AddFun})
end

