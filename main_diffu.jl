using Plots 
include("input_diffu.jl")
include("schemes_diffu.jl")

function main()
    I=euler(F,α,β,i₀)
    X=LinRange(0,L,nₓ)
    p=plot(X)
    for i in 1:10
        plot!(p,X,I[i*10])
    end
    plot(p)
end

main()
