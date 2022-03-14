using Plots 
include("input.jl")
include("schemes.jl")

function main()
    U=Euler_Explicite(F_SIS,X₀,Δt,n,α,β)
    S_SIS=[]
    I_SIS=[]
    for i in 1:n
        push!(S_SIS,U[i][1])
        push!(I_SIS,U[i][2])
    end
    T = LinRange(0,n*Δt,n)
    p=plot(T,S_SIS,title="modèle SIS",label="sains",lw=3,yaxis="pourcentage de la population",xaxis="le temps")
    plot!(p,T,I_SIS,label="infectés",lw=3)
    F=[]
    for i in 1:n
        push!(F,infectés_SIS(T[i],α,β,I₀,N))
    end
    plot!(p,T,F,lw=1,linestyle=:dash,label="prédiction mathématique des infectés",color="black")
    V=Runge_Kutta_ordre4(F_SIS,X₀,Δt,n,α,β)
    S_SISR=[]
    I_SISR=[]
    for i in 1:n
        push!(S_SISR,V[i][1])
        push!(I_SISR,V[i][2])
    end
    q=plot(T,S_SISR,title="méthode Runge Kutta",label="sains",lw=3,yaxis="pourcentage de la population",xaxis="le temps [mois]")
    plot!(q,T,I_SIS,label="infectés",lw=3)
    plot!(q,T,F,lw=1,linestyle=:dash,label="prédiction mathématique des infectés",color="black")
    plot(p,q)
    savefig(p,"Modèle_SIS2")
    savefig(q,"modelisationSIS")
end
main()
