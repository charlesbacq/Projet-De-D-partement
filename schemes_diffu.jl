include("input_diffu.jl")

function F(X,α,β,x)
    return β*(N-X[x])*X[x]-α*X[x]+D/(Δx*Δx)*(X[x+1]-2*X[x]+X[x-1])
end

function euler(F,α,β,i₀)
    I=[i₀]
    for t in 1:n
        U=[]
        for i in 1:nₓ
            push!(U,0)
        end
        for x in 2:(nₓ-1)
            U[x]=I[t][x]+Δt*F(I[t],α,β,x)
        end
        U[1]=U[2]
        U[nₓ]=U[nₓ-1]
        #conditions Neuman
        push!(I,U)
    end
    return I
end