
<?php
/* PHP 运算 - 算术运算
    - 算术运算优先级：
        + 先乘除，后加减
        + () 改变优先级，把优先的值给括起来
    
    +  加  $x + $y
    -  减  $x - $y
    *  乘  $x * $y
    /  除  $x / $y
    %  取模，取余，求模  $x % $y


    ### 赋值运算
        把等号右边的值赋给左边的变量，左边的变量就是右边的值
        $num = 100;

        变量可以反复赋值为不同类型的值

        += 
            $x += $y 等价于  $x = $x + $y;

        -=
            $x -= $y 等价于    $x = $x - $y;

        *=
            $x *= $y 等价于    $x = $x * $y;

        /=
            $x /= $y 等价于    $x = $x / $y;

        %= 
            $x %= $y 等价于    $x = $x % $y;

        .=  拼接赋值
            $x .= $y 等价于    $x = $x . $y;
   
  
    ### 自加 自减
        ++ 自己加 1
        -- 自己减 1
    $x++; 
        先赋值后加 1

    $x--; 先赋值后减 1

    ++$x;  先加 1 后赋值

    --$x; 先减 1 后赋值
*/

    $x= 8;
    $y = 9;

    $z = $x * $y;
        echo $z . '<br>';  // 72

    $x %= $y;
        echo $x . '<br>'; // 8

    echo $y . '<hr>========';

    $rel = $y++;
        // $y 结果是10，因为 赋值给 $rel后，$y 又把自己进行了 +1操作，所以结果是 10
        echo $rel. ' & ' . $y . '<br>';

    $end = ++$y;
        // $y 结果是11，因为 $y 先进行了 +1操作，结果是 11，然后赋值给 $end
        echo $end. ' & ' . $y .'<br>';

    
?>