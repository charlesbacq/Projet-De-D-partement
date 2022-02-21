using Plots



function F_SIR(X,α,β)
    Y=[0.,0.]
    Y[1]=-β*X[1]*X[2]
    Y[2]=β*X[1]*X[2] - α*X[2]
    return Y
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



N=100
X₀=[80.,20.]
Δt=0.01
n=1000
β=0.02342
α=0.476
T=LinRange(0,n*Δt,n)

#mettre/enlever une des deux sections en commentaire 

#modèle SIR

#=V=Euler_Explicite(F_SIR,X₀,Δt,n,α,β)
S_SIR=[]
I_SIR=[]
R_SIR=[]
for i in 1:n
    push!(S_SIR,U[i][1])
    push!(I_SIR,U[i][2])
    push!(R_SIR,N-U[i][1]-U[i][2])
end
plot(T,S_SIR,label="sains")
plot!(T,I_SIR,label="infectés")
plot!(T,R_SIR,label="recovered")=#




#modèle SIR 


U=Euler_Explicite(F_SIS,X₀,Δt,n,α,β)
S_SIS=[]
I_SIS=[]
for i in 1:n
    push!(S_SIS,U[i][1])
    push!(I_SIS,U[i][2])
end
plot(T,S_SIS,label="sains")
plot!(T,I_SIS,label="infectés")