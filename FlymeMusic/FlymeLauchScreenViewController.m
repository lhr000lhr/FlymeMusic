//
//  FlymeLauchScreenViewController.m
//  FlymeMusic
//
//  Created by qsheal on 15/2/28.
//  Copyright (c) 2015年 LHR. All rights reserved.
//

#import "FlymeLauchScreenViewController.h"
#import "UIView+i7Rotate360.h"

@interface FlymeLauchScreenViewController ()

@end

@implementation FlymeLauchScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.flymeBalloon.layer.transform = CATransform3DIdentity;
    self.flymeBalloon.layer.opacity = 1.0;

    self.animated = NO;
    [self.flymeBalloon.layer setMasksToBounds:YES];
  
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(performAnimation) userInfo:nil repeats:YES];
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        
        ViewController *view = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
        
      
    [self presentViewController:view animated:YES completion:^{
        
    [timer invalidate];

    }];

        
    });
//    [self performAnimation];

   
}
-(void)performAnimation
{
    
    
    [self.flymeBalloon rotate360WithDuration:2.0 repeatCount:1 timingMode:i7Rotate360TimingModeLinear];
    [self.flymeBalloon rotate360WithDuration:2.0 repeatCount:1 timingMode:i7Rotate360TimingModeLinear];
    self.flymeBalloon.animationDuration = 2.0;
    self.flymeBalloon.animationImages = [NSArray arrayWithObjects:[UIImage imageNamed:@"FlymeBallonOnly"], nil];
   
    self.flymeBalloon.animationRepeatCount = 1;
    [self.flymeBalloon startAnimating];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
