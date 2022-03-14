using Plots 
include("input.jl")
include("schemes.jl")

function main()
    U=Euler_Explicite(F_SIR,X₀,Δt,n,α,β)
    S_SIR=[]
    I_SIR=[]
    R_SIR=[]
    for i in 1:n
        push!(S_SIR,U[i][1])
        push!(I_SIR,U[i][2])
        push!(R_SIR,N-U[i][1]-U[i][2])
    end
    T = LinRange(0,n*Δt,n)
    p=plot(T,S_SIR,label="sains",lw=3,yaxis="pourcentage de la population")
    plot!(p,T,I_SIR,label="infectés",lw=3)
    plot!(p,T,R_SIR,label="infectés",lw=3)
    xlabel!(p,"temps")
    v=plot(R_SIR,S_SIR,lw=3,linestyle=:dash,label="obtention numérique",xaxis="pourcentage de recovered",yaxis="pourcentage de sains")
    X=[]
    for i in 1:n 
        push!(X,X₀[1]*sains_SIR(R_SIR[i],α,β))
    end
    plot!(v,R_SIR,X,lw=1,label="prédiction mathématique")
    plot(p,v)
    savefig(p,"Modèle_SIR")
    savefig(v,"prévision_mathématiques_SIR")
end
main()