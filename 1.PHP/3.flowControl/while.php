
<?php
/* 流程控制 if else

    while(表达式){
        // 循环体代码；只要“表达式”为真，循环体会一直执行
        // 不加条件限制，会陷入无限循环，造成浏览器卡死
    }
    - while() 先判断条件，再决定是否执行循环体
        + 如果一开始条件为假，循环体就不会执行

    - while() 的执行循序是：
        初始表达式 -> 条件表达式 -> 循环体 -> 增量表达式
            -> 条件表达式 -> 循环体 -> 增量表达式
*/
    $i = 1; // 初始表达式
    while( $i <=10 ){ // 条件表达式
        echo '<br> PHP is Good!'; // 循环体
        $i++; // 增量表达式
    }
?>