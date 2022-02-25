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
    p=plot(T,S_SIS,title="modèle SIS",label="sains",lw=3,yaxis="pourcentage de la poulation")
    plot!(p,T,I_SIS,label="infectés",lw=3)
    xlabel!("le temps en mois")
end
main()
