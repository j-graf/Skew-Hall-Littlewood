# Skew-Hall-Littlewood

Computes skew Hall-Littlewood functions in the variables $x_1,x_2,\ldots,x_n$ with the Young tableau formula. Computes the decomposition of $Q_{\lambda/\mu}$ as a linear combination of the basis element $Q_\nu$'s.

# How to Use

We recommend the [online Macaulay2 editor](https://www.unimelb-macaulay2.cloud.edu.au/#editor).
First, run all of the code in the file [skew_hall-littlewood.m2](https://github.com/j-graf/Skew-Hall-Littlewood/blob/main/skew_hall-littlewood.m2) (you may copy-paste the contents into the editor on the left, then click the orange "Run all editor code" button).
Then, you may run individual lines or blocks of code. The file [conjecture_verification.m2](https://github.com/j-graf/Skew-Hall-Littlewood/blob/main/conjecture_verification.m2) contains code to verify the conjectured formulas for skew Hall-Littlewood functions.

# Examples

## Hall-Littlewood Function Basics

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

6. Generate a list of all semistandard Young tableaux (SSYT) of shape $(6,5,2)-(3,1)$ with maximum entry $3$, print five of them, and count the number of SSYT:
```
theList = genAllSSYT({6,5,2},{3,1},3)
for i from 0 to 4 do(
    print(net theList#i);
    print("\n");
    )
#theList
```

## Skew Conjecture Verification

7. Verify formula1 where $1\leq|\lambda|\leq7$:
```
for wt from 1 to 7 do (
    print(wt);
    partitionList = partitions wt;
    for thePartition in partitionList do (
        for k from 0 to thePartition#0+1 do (
            print(skewQ(toList thePartition,{k},#thePartition) == skewFormula1(toList thePartition,{k},#thePartition));
            );
        );
    )
```

8. Verify formula1 where $8\leq|\lambda|\leq10,~\ell(\lambda)\leq3$:
```
for wt from 8 to 10 do (
    print(wt);
    partitionList = for thePartition in partitions(wt,3) list conjugate thePartition;
    for thePartition in partitionList do (
        for k from 0 to thePartition#0+1 do (
            print(skewQ(toList thePartition,{k},#thePartition) == skewFormula1(toList thePartition,{k},#thePartition));
            );
        );
    )
```

9. Verify formula2 where $1\leq|\lambda|\leq7,~ 0\leq|\mu|\leq|\lambda|+1,~\mu_1\leq\lambda_1+1$:
```
-- occasionally times out once |lam|>=7
for lam1 from 1 to 7 do (
    -- print(lam1);
    for lam2 from 0 to lam1 do (
        for mu1 from 0 to lam1+1 do (
            for mu2 from 0 to mu1 do (
                print(lam1,lam2,mu1,mu2);
                print(skewQ({lam1,lam2},{mu1,mu2},2)==skewFormula2({lam1,lam2},{mu1,mu2},2));
                );
            );
        );
    )
```

10. Verify formula3 where $1\leq|\lambda|\leq6,~\ell(\lambda)\leq5$:
```
for wt from 1 to 8 do (
    print(wt);
    partitionList = for thePartition in partitions(wt,6) list conjugate thePartition;
    for thePartition in partitionList do (
        for m from 1 to #thePartition do (
            print(skewQ(toList thePartition,for k from 1 to m list (1),#thePartition) == skewFormula3(toList thePartition,for k from 1 to m list (1),#thePartition));
            );
        );
    )
```

11. Verify formula4 where $2\leq k,~m\leq 8$:
```
for k from 2 to 8 do (
    print("k=" | toString(k));
    for m from 2 to 8 do (
        -- print("m=" | toString(m));
        print(skewQ(toList(m:k),{2,1},m)==skewFormula4(toList(m:k),{2,1},m));
        )
    )
```
