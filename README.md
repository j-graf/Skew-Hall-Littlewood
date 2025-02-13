# Skew-Hall-Littlewood

Computes skew Hall-Littlewood functions. 

# How to Use

We recommend the [online Macaulay2 editor](https://www.unimelb-macaulay2.cloud.edu.au/#editor).
First, run all of the code in the file [skew_hall-littlewood.m2](https://github.com/j-graf/Skew-Hall-Littlewood/blob/main/skew_hall-littlewood.m2) (you may copy-paste the contents into the editor on the left, then click the orange "Run all editor code" button).
Then, you may run individual lines or blocks of code. The file [conjecture_verification.m2](https://github.com/j-graf/Skew-Hall-Littlewood/blob/main/conjecture_verification.m2) contains code to verify the conjectured formulas for skew Hall-Littlewood functions.

# Examples

## Schur's $Q$-function Basics

1. Compute $\ell(\lambda)$ and $|\lambda|$, where $\lambda=(6,5,2)$:
```
lam = {6,5,2}
#lam
sum lam
```

2. Compute $Q_{\lambda}(x_1,\ldots,x_n;t)$, where $\lambda=(6,5,2)$ and $n=\ell(\lambda)$:
```
lam = {6,5,2}
Qlam(lam,#lam)
```

3. Compute $Q_{\lambda/\mu}(x_1,\ldots,x_n;t)$, where $\lambda=(6,5,2)$, $\mu=(3,1)$, and $n=\ell(\lambda)$:
```
lam = {6,5,2}
mu = {3,1}
skewQ(lam,mu,#lam)
```

## Decompositions of $Q_{\lambda/\mu}$

4. Decompose $Q_{\lambda/\mu}$ as a linear combination of $Q_\nu$, where $\lambda=(6,5,2)$ and $\mu=(3,1)$:
```
lam = {6,5,2}
mu = {3,1}
decomposeSkew(lam,mu)
```

5. Verify the decomposition $Q_{({4, 2})/({3})}=(-t+1)Q_{({3})}+Q_{({2, 1})}$:
```
skewQ({4,2},{3},2) == (-t+1)*Qlam({3},2)+(1)*Qlam({2, 1},2)
```

## Semistandard Young Tableaux

6. Generate a list of all semistandard Young tableaux (SSYT) of shape $(6,5,2)-(3,1)$ with maximum entry $3$, printing five of them, and counting the number of SSYT:
```
theList = genAllSSYT({6,5,2},{3,1},3)
for i from 0 to 4 do(
    print(net theList#i);
    print("\n");
    )
#theList
```
