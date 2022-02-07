using Plots



function F(X)
    β=0.02342
    α=0.476
    Y=[0.,0.]
    Y[1]=-β*X[1]*X[2]
    Y[2]=β*X[1]*X[2] - α*X[2]
    return Y
end




function Euler_Explicite(F,X₀,Δt,n)
    U=[X₀]
    for i in 1:n
        push!(U,U[i]+F(U[i])*Δt)
    end
    return U
end

function tracer_euler(F,X₀,Δt,n,N)
    U=Euler_Explicite(F,X₀,Δt,n)
    S=[]
    I=[]
    R=[]
    for i in 2:n+1
        push!(S,U[i][1])
        push!(I,U[i][2])
        push!(R,N-U[i][1]-U[i][2])
    end
    T=LinRange(0,n*Δt,n)
    plot(T,S,label="sains")
    plot!(T,I,label="infectés")
    plot!(T,R,label="recovered")
end


N=100
X₀=[80.0,20.0]
Δt=0.01
n=1000

tracer_euler(F,X₀,Δt,n,N)
