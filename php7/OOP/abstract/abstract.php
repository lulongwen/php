<?php
  /**
   * Created by PhpStorm.
   * User: 卢珑文
   * Date: 2017/11/22
   * Time: 9:50
   * description: 抽象类，抽象类的价值在于设计
   * 抽象类存在的价值：让其他的类来继承它，并实现它写的抽象方法；
   *
   * 抽象类细节：
   * 1. 抽象类不能被实例化
   *  - 不能 $p1= new Person(); 错误的
   *
   * 2. 抽象类可以没有抽象方法，抽象类中，可以有普通成员方法，属性和常量
   *
   * 3. 一个类中，如果有抽象方法，则该类必须声明 abstract
   * 4. 抽象方法不能有方法体，不能有 {}
   * 5. 如果一个类，继承了某个抽象类，则该类，必须把这个抽象类所有的抽象方法全部实现
   *  - 除非，该类自己也声明成 abstract
   */
  
  
  // abstract 抽象类
  abstract class Person{
    public $name;
    
    // 当一个方法不确定，就用抽象方法
    abstract public function say();
    
    public function showInfo(){
      echo '<br> showInfo()';
    }
  }
  
  
  // 实现抽象类，就是把这个方法重写，并写出方法体
  class Child extends Person{
    public function say(){
      echo '<h3>今天是儿童节</h3>';
    }
  }
  
  $p1 = new Child;
  $p1->say();
  $p1->showInfo();
  
  
  
  
  
  
  
  
  
  
  
  