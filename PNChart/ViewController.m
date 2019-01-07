//
//  ViewController.m
//  PNChart
//
//  Created by 王雪剑 on 2019/1/6.
//  Copyright © 2019年 zkml－wxj. All rights reserved.
//

#import "ViewController.h"
#import "PNChart.h"

@interface ViewController ()<PNChartDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self makePieChart];
}

//饼状图
- (void)makePieChart{
    NSArray *items = @[
                       [PNPieChartDataItem dataItemWithValue:1 color:PNPinkGrey description:@"cat"],
                       [PNPieChartDataItem dataItemWithValue:1 color:PNDarkBlue description:@"pig"],
                       [PNPieChartDataItem dataItemWithValue:1 color:PNRed description:@"dog"]];
    
    PNPieChart *pieChart = [[PNPieChart alloc] initWithFrame:CGRectMake(20, 100, 300, 300) items:items];
    
    pieChart.delegate = self;
    //扇形标注颜色、字号
    pieChart.descriptionTextColor = [UIColor yellowColor];
    pieChart.descriptionTextFont = [UIFont fontWithName:@"Avenir-Medium" size:20];
    //是否显示点击效果
    pieChart.shouldHighlightSectorOnTouch = YES;
    //是否运行同时显示点击阴影
    pieChart.enableMultipleSelection = NO;
    
    //阴影颜色
    pieChart.descriptionTextShadowColor = [UIColor redColor];
    
    //显示实际数值,不显示实际比例
    pieChart.showAbsoluteValues = NO;
    
    //只显示数值，不显示内容描述
    pieChart.showOnlyValues = NO;
    
    
    pieChart.innerCircleRadius = 2;
    pieChart.outerCircleRadius = 6;
    
    
    
    //开始绘制
    [pieChart strokeChart];
    
    //显示比例
    pieChart.hasLegend = YES;
    //横向显示
    pieChart.legendStyle = PNLegendItemStyleSerial;
    pieChart.legendFont = [UIFont boldSystemFontOfSize:20];
    //显示位置
    pieChart.legendPosition = PNLegendPositionTop;
    //加到父视图上
    [self.view addSubview:pieChart];
    

    //获得图例，当横向排布不下另起一行
    UIView *legend = [pieChart getLegendWithMaxWidth:50];
    legend.frame = CGRectMake(100, 30, legend.bounds.size.width, legend.bounds.size.height);
    [self.view addSubview:legend];
    
    
    pieChart.legendFont = [UIFont systemFontOfSize:14];
/*
    //是否显示图例，当然不获取图例就不会显示
    pieChart.hasLegend = YES;
    //设置图例样式
    pieChart.legendStyle = PNLegendItemStyleStacked;
    //设置图例位置
    pieChart.legendPosition = PNLegendPositionTop;
 */
}

#pragma mark ********【代理】********PNChartDelegate
- (void)userClickedOnPieIndexItem:(NSInteger)pieIndex{
    NSLog(@"%ld",pieIndex);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
