function output=cut_cp(input,cp_length)    %cp_length是循环前缀的长度，上面已经定义过循环前缀的长度是16
       
        [m,n]=size(input);%------------------------------------------------输入的是272行*120列的通过信道后又变成并行的信号矩阵，m=272，n=120
        output=zeros(m-cp_length,n);%--------------------------------------输出共有256行*120列
         
%%%%%%%%%%%%%%%%%%%%%%以下循环为各列插入循环前缀%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
     output(1:(m-cp_length),:)=input((cp_length+1:m),:);%------------------将去cp之前矩阵的17行-272行全部赋值给去cp输出的1行到256行，即实现了去cp操作
             
