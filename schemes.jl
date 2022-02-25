using Plots



function F_SIR(X,α,β)
    return [-β*X[1]*X[2],β*X[1]*X[2] - α*X[2]]
end

function F_SIS(X,α,β)
    Y=[0.,0.]
    Y[1]=-β*X[1]*X[2]+α*X[2]
    Y[2]=β*X[1]*X[2]-α*X[2]
    return Y
end


function Euler_Explicite(F,X₀,Δt,n,α,β)
    U=[X₀]
    for i in 1:n
        push!(U,U[i]+F(U[i],α,β)*Δt)
    end
    return U
end

function sains_SIR(R,α,β)
    return exp(-β*R/α)
end