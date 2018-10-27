//
//  ViewController.m
//  谓词
//
//  Created by eagle on 2018/7/30.
//  Copyright © 2018年 eagle. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray * array = @[@"123123",@"1431",@"12",@"1234"];
    NSArray * array1 = @[@"12",@"1431",@"9434"];
    
    NSPredicate * pre = [NSPredicate predicateWithFormat:@"length = 4 && SELF LIKE '?4??' &&  (SELF IN %@)",array1];
    NSArray * arr = [array filteredArrayUsingPredicate:pre];
    
//    [self predicateCompare];
    
//    [self predicateLogic];
    
//    [self predicateStringCompare];

//    [self predicateSet];
}

#pragma mark - 比较运算符
- (void)predicateCompare
{
    // = == , >= => , <= =< , > , < , != <> , BETWEEN ,
    NSNumber * number = @123;
    NSPredicate * predicate = [NSPredicate predicateWithFormat:@"SELF = 123"];
    if ([predicate evaluateWithObject:number]) {
        
        NSLog(@"比较运算符 - 相等");
    }
    
    predicate = [NSPredicate predicateWithFormat:@"SELF BETWEEN {100,200}"];
    
    if ([predicate evaluateWithObject:number]) {
        
        NSLog(@"在区间范围内");
    }
    
//    (2)
    NSArray * test = @[@"sda",@"321",@"sf12",@"dsdwq1",@"swfas"];
    
    predicate = [NSPredicate predicateWithFormat:@"length = 5"];
    
    NSArray * result = [test filteredArrayUsingPredicate:predicate];
    
    NSLog(@"length = 5 : %@",result);
}

#pragma mark - 逻辑运算符
- (void)predicateLogic
{
    // AND && , OR || , NOT !
    NSArray * array = @[@1,@2,@3,@4,@5];
    
    NSPredicate * predicate = [NSPredicate predicateWithFormat:@"SELF > 2 && SELF < 5"];
    NSArray * filterArray = [array filteredArrayUsingPredicate:predicate];
    NSLog(@"filter - %@",filterArray);
}

#pragma mark - 字符串比较运算
- (void)predicateStringCompare
{
    NSArray * array = @[@"123",@"321",@"543"];
    NSPredicate * predicate = [NSPredicate predicateWithFormat:@"SELF LIKE '?2?'"];
    NSArray * filterArray = [array filteredArrayUsingPredicate:predicate];
    NSLog(@"filter - %@",filterArray);
    
//    BEGINSWITH：检查某个字符串是否以指定的字符串开头（如判断字符串是否以a开头：BEGINSWITH 'a'）
    
//    ENDSWITH：检查某个字符串是否以指定的字符串结尾
    
//    CONTAINS：检查某个字符串是否包含指定的字符串
    
//    LIKE：检查某个字符串是否匹配指定的字符串模板。其之后可以跟?代表一个字符和*代表任意多个字符两个通配符。比如"name LIKE '*ac*'"，这表示name的值中包含ac则返回YES；"name LIKE '?ac*'"，表示name的第2、3个字符为ac时返回YES。
    
//    MATCHES：检查某个字符串是否匹配指定的正则表达式。虽然正则表达式的执行效率是最低的，但其功能是最强大的，也是我们最常用的。
    
//    注：字符串比较都是区分大小写和重音符号的。如：café和cafe是不一样的，Cafe和cafe也是不一样的。如果希望字符串比较运算不区分大小写和重音符号，请在这些运算符后使用[c]，[d]选项。其中[c]是不区分大小写，[d]是不区分重音符号，其写在字符串比较运算符之后，比如：name LIKE[cd] 'cafe'，那么不论name是cafe、Cafe还是café上面的表达式都会返回YES。
}

#pragma mark - 集合运算符
- (void)predicateSet
{
    NSArray * array = @[@"ab",@"abc"];
    NSArray * filterArray = @[@"a",@"ab",@"abc",@"abcd"];
    NSPredicate * predicate = [NSPredicate predicateWithFormat:@"NOT (SELF IN %@)",array];
    NSArray * filter = [filterArray filteredArrayUsingPredicate:predicate];
    
    NSLog(@"filter - %@",filter);
    
//    ANY、SOME：集合中任意一个元素满足条件，就返回YES。
    
//    ALL：集合中所有元素都满足条件，才返回YES。
    
//    NONE：集合中没有任何元素满足条件就返回YES。如:NONE person.age < 18，表示person集合中所有元素的age>=18时，才返回YES。
    
//    IN：等价于SQL语句中的IN运算符，只有当左边表达式或值出现在右边的集合中才会返回YES。
}

#pragma mark - 直接量
- (void)predicateDirect
{
//    FALSE、NO：代表逻辑假
//
//    TRUE、YES：代表逻辑真
//
//    NULL、NIL：代表空值
//
//    SELF：代表正在被判断的对象自身
//
//    "string"或'string'：代表字符串
//
//    数组：和c中的写法相同，如：{'one', 'two', 'three'}。
//
//    数值：包括证书、小数和科学计数法表示的形式
//
//    十六进制数：0x开头的数字
//
//    八进制：0o开头的数字
//
//    二进制：0b开头的数字
}

@end
