-- verifies conjectures 1-4

-- verifies formula1 where 1<=|lam|<=7
for wt from 1 to 7 do (
    print(wt);
    partitionList = partitions wt;
    for thePartition in partitionList do (
        for k from 0 to thePartition#0+1 do (
            print(skewQ(toList thePartition,{k},#thePartition) == skewFormula1(toList thePartition,{k},#thePartition));
            );
        );
    )

-- verifies formula1 where 8<=|lam|<=10, #lam<=3
for wt from 8 to 10 do (
    print(wt);
    partitionList = for thePartition in partitions(wt,3) list conjugate thePartition;
    for thePartition in partitionList do (
        for k from 0 to thePartition#0+1 do (
            print(skewQ(toList thePartition,{k},#thePartition) == skewFormula1(toList thePartition,{k},#thePartition));
            );
        );
    )

-- verifies formula2 where 1<=|lam|<=7, 0<=|mu|<=|lam|+1, mu#0<=lam#0+1
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

-- verifies formula3 where 1<=|lam|<=6, #lam<=5
for wt from 1 to 8 do (
    print(wt);
    partitionList = for thePartition in partitions(wt,6) list conjugate thePartition;
    for thePartition in partitionList do (
        for m from 1 to #thePartition do (
            print(skewQ(toList thePartition,for k from 1 to m list (1),#thePartition) == skewFormula3(toList thePartition,for k from 1 to m list (1),#thePartition));
            );
        );
    )

-- verifies formula4 where 2<=k,m<=8
for k from 2 to 8 do (
    print("k=" | toString(k));
    for m from 2 to 8 do (
        -- print("m=" | toString(m));
        print(skewQ(toList(m:k),{2,1},m)==skewFormula4(toList(m:k),{2,1},m));
        )
    )
