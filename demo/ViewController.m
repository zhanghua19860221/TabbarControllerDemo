//
//  ViewController.m
//  demo
//
//  Created by zhanghua0221 on 16/12/6.
//  Copyright © 2016年 zhanghua0221. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UIScrollView *scrollView ;
}
@end

@implementation ViewController
- (instancetype)initWithTitles:(NSArray *)titles ViewControllers:(NSArray *)vcs{
    
    self = [super init];
    if (self) {
        self.barArray = vcs;
    }
    return self ;
};

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatScrollView];
    [self addChildViewControllers];
    [self creatButton];
    
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)creatScrollView{
    scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    scrollView.backgroundColor = [UIColor orangeColor];
    scrollView.pagingEnabled = YES;
    [self.view addSubview:scrollView];
}
- (void)addChildViewControllers
{
    for (UIViewController *vc in self.barArray) {
        
        [self addChildViewController:vc];
        
    }
}
-(void)creatButton{
    
    scrollView.contentSize = CGSizeMake(2*self.view.frame.size.width, 0);
    
    for (int i=0; i<2; i++) {
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        if (i==0) {
            button.backgroundColor = [UIColor grayColor];
            [button setTitle:@"123123123" forState:UIControlStateNormal];
        }else{
            button.backgroundColor = [UIColor magentaColor];
            [button setTitle:@"78978997" forState:UIControlStateNormal];
        }
        button.frame = CGRectMake(i*200+20, 200, 100, 50);
        [button addTarget:self action:@selector(Click:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = 100+i ;
        
        UIViewController *vc = self.childViewControllers[i];
        vc.view.frame = CGRectMake(i*scrollView.frame.size.width, 0, scrollView.frame.size.width, scrollView.frame.size.height);
        [scrollView addSubview:vc.view];
        [self.view addSubview:button];
        
    }
}
-(void)Click:(UIButton*)button{

    if (button.tag == 100 ) {
        
        [scrollView setContentOffset:CGPointMake(self.view.frame.size.width, 0) animated:YES];
    }else{
        
        [scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
