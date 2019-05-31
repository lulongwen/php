<?php

// autoload_static.php @generated by Composer

namespace Composer\Autoload;

class ComposerStaticInit5194ad889fc5016ce8d60337fe8c8780
{
    public static $files = array (
        '2cffec82183ee1cea088009cef9a6fc3' => __DIR__ . '/..' . '/ezyang/htmlpurifier/library/HTMLPurifier.composer.php',
    );

    public static $prefixLengthsPsr4 = array (
        'y' => 
        array (
            'yii\\composer\\' => 13,
            'yii\\' => 4,
        ),
        'c' => 
        array (
            'cebe\\markdown\\' => 14,
        ),
        'b' => 
        array (
            'bizley\\quill\\' => 13,
        ),
    );

    public static $prefixDirsPsr4 = array (
        'yii\\composer\\' => 
        array (
            0 => __DIR__ . '/..' . '/yiisoft/yii2-composer',
        ),
        'yii\\' => 
        array (
            0 => __DIR__ . '/..' . '/yiisoft/yii2',
        ),
        'cebe\\markdown\\' => 
        array (
            0 => __DIR__ . '/..' . '/cebe/markdown',
        ),
        'bizley\\quill\\' => 
        array (
            0 => __DIR__ . '/..' . '/bizley/quill/src',
        ),
    );

    public static $prefixesPsr0 = array (
        'H' => 
        array (
            'HTMLPurifier' => 
            array (
                0 => __DIR__ . '/..' . '/ezyang/htmlpurifier/library',
            ),
        ),
    );

    public static function getInitializer(ClassLoader $loader)
    {
        return \Closure::bind(function () use ($loader) {
            $loader->prefixLengthsPsr4 = ComposerStaticInit5194ad889fc5016ce8d60337fe8c8780::$prefixLengthsPsr4;
            $loader->prefixDirsPsr4 = ComposerStaticInit5194ad889fc5016ce8d60337fe8c8780::$prefixDirsPsr4;
            $loader->prefixesPsr0 = ComposerStaticInit5194ad889fc5016ce8d60337fe8c8780::$prefixesPsr0;

        }, null, ClassLoader::class);
    }
}