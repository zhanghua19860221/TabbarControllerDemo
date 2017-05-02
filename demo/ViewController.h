//
//  ViewController.h
//  demo
//
//  Created by zhanghua0221 on 16/12/6.
//  Copyright © 2016年 zhanghua0221. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property(nonatomic ,strong )NSArray *barArray;

- (instancetype)initWithTitles:(NSArray *)titles ViewControllers:(NSArray *)vcs;
@end

