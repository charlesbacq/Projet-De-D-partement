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

function Runge_Kutta_ordre4(F,X₀,Δt,n,α,β)
    U=[X₀]
    for i in 1:n
        k₁=F(U[i],α,β)
        k₂=F(U[i]+k₁*Δt/2,α,β)
        k₃=F(U[i]+k₂*Δt/2,α,β)
        k₄=F(U[i]+k₃*Δt,α,β)
        push!(U,U[i]+Δt/6*(k₁+2*k₂+2*k₃+k₄))
    end
    return U
end

function sains_SIR(R,α,β)
    return exp(-β*R/α)
end

function infectés_SIS(t,α,β,I₀,N)
    r=β*N-α
    K=r/β
    return K*(1/(1-exp(-r*t)*(1-K/I₀)))
end