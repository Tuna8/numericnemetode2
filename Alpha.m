function alpha = Alpha(n, i, f)

alpha = (n+1)* integral(f,i/(n+1),(i+1)/(n+1));
end