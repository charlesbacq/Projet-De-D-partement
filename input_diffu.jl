N=100
X₀=[80.,20.]
Δt=0.01
n=1000
β=0.1342
α=0.476
I₀=X₀[2]
Δx=0.1
L = 10
nₓ = 100

X = LinRange(0,L,nₓ)
σ = 0.1
μ = 1
i₀=[]
D=1000
for i in 1:nₓ
    push!(i₀,30*exp(-(X[i]-μ)*(X[i]-μ)/(2*σ*σ)))
end
s₀=[]
for i in 1:nₓ
    push!(s₀,N-i₀[i])
end