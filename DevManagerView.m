//
//  DevManagerView.m
//  GG-IOS-DEVMGT
//
//  Created by 谢鑫 on 2020/4/1.
//  Copyright © 2020 Shae. All rights reserved.
//

#import "DevManagerView.h"
#import <Masonry.h>
#define buttonOneTopY 70
@interface DevManagerView()
@property (nonatomic, strong) NSMutableArray * masonryButtonArray;//用于保存第一行的三个Button,第二行Button单独设置
@property (nonatomic, strong) NSMutableArray * masonryLabelArray;//用于保存第一行的三个Label,第二行Label单独设置
@end
@implementation DevManagerView
- (instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
         [self createButton];
        
    }
    return self;
}

- (void) createButton
{
    _masonryButtonArray = [NSMutableArray array];
    _masonryLabelArray=[NSMutableArray array];
    //循环创建前三个
    for (int i=0; i<3; i++) {
        UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
        button.backgroundColor=[UIColor yellowColor];
        [button setTag:2001+i];//2001-2003
        [button addTarget:self action:@selector(ClickEvent:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        [_masonryButtonArray addObject:button];
        
        UILabel *label=[[UILabel alloc]init];
        label.backgroundColor=[UIColor cyanColor];
        [label setTag:2011+i];//2011-2013
        label.textAlignment=NSTextAlignmentCenter;
       
        switch (label.tag) {
            case 2011:
                 label.text=@"换章";
                break;
            case 2012:
             label.text=@"添加印油";
            break;
            case 2013:
             label.text=@"解锁";
            break;
            default:
                break;
        }
        [self addSubview:label];
        [_masonryLabelArray addObject:label];
    }
    [self buttons_Layout_Style];//前三个的布局
    [self labels_Layout_style];
    //获取第一个button和label方便参考他的约束
    UIButton *buttonOne=(UIButton *)[self viewWithTag:2001];
    NSLog(@"buttonOne:%@",buttonOne);
    UILabel *labelOne=(UILabel *)[self viewWithTag:2011];
    NSLog(@"labelOne:%@",labelOne);
    //单独创建第二排放在下一行

    UIButton *button4=[UIButton buttonWithType:UIButtonTypeCustom];
    button4.backgroundColor=[UIColor redColor];
    [button4 setTag:2004];//第四个button，放在下一行
    [button4 addTarget:self action:@selector(ClickEvent:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button4];
    [button4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(labelOne.mas_bottom).offset(20);
        make.left.equalTo(buttonOne.mas_left);
        make.width.equalTo(buttonOne.mas_width);
        make.height.equalTo(buttonOne.mas_height);
    }];
    
    UILabel *label4=[[UILabel alloc]init];
    label4.backgroundColor=[UIColor blueColor];
    label4.tag=2014;//第四个label
    label4.textAlignment=NSTextAlignmentCenter;
    label4.text=@"设备信息";
    [self addSubview:label4];
    [label4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(button4.mas_bottom).offset(10);
               make.left.equalTo(button4.mas_left);
               make.width.equalTo(button4.mas_width);
               make.height.equalTo(@40);
    }];
}

- (void)buttons_Layout_Style {
    NSLog(@"_masonryViewArray=%@",_masonryButtonArray);
    // 实现masonry水平固定控件宽度方法
    [_masonryButtonArray mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedItemLength:110 leadSpacing:10 tailSpacing:10];
   
    // 设置array的垂直方向的约束
    [_masonryButtonArray mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(buttonOneTopY);
         make.height.equalTo(@110);
    }];
    NSLog(@"1_masonryViewArray %@",_masonryButtonArray);
}
-(void)labels_Layout_style{
    NSLog(@"_masonryLabelArray=%@",_masonryLabelArray);
    [_masonryLabelArray mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedItemLength:110 leadSpacing:10 tailSpacing:10];
    
     // 设置array的垂直方向的约束
     [_masonryLabelArray mas_makeConstraints:^(MASConstraintMaker *make) {
         make.top.mas_equalTo(buttonOneTopY+110+10);//100+110+10
          make.height.equalTo(@40);
     }];
}

//回调事件
- (void) ClickEvent
{
  NSLog(@"button click event......");
}
 
- (void) ClickEvent:(UIButton *) button
{
  NSUInteger BtnTag = [button tag];
    NSLog(@"%ld",BtnTag);
    [self.mdelegate DevMgrViewBtnTag:BtnTag];
 
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
