//
//  LoginViewController.m
//  MyStore
//
//  Created by sunil on 1/8/15.
//  Copyright (c) 2015 sunil. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UIButton *switchButton;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *userNameLabelTop;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *userNameLabelLeft;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *userNameLabelRight;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *userNameTextTop;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *userNameTextLeft;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *userNameTextRight;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *passwordLabelTop;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *passwordLabelLeft;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *passwordLabelRight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *passwordTextLeft;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *passwordTextTop;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *passwordTextRight;

- (IBAction)loginTouched;
@end

@implementation LoginViewController



- (void)viewDidLoad {
    [super viewDidLoad];

    
 
    
    
    // Do any additional setup after loading the view.
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

- (IBAction)loginTouched {
    
//    CGFloat tempUserNameLabelLeft = _userNameLabelLeft.constant;
//    CGFloat tempUserNameLabelRight = _userNameLabelRight.constant;
//    CGFloat tempUserNameLabelTop = _userNameLabelTop.constant;
//    
//    self.userNameLabelLeft.constant = _userNameTextLeft.constant;
//    self.userNameLabelRight.constant = _userNameTextRight.constant;
//    self.userNameLabelTop.constant = _userNameTextTop.constant;
//    
//    self.userNameTextLeft.constant = tempUserNameLabelLeft;
//    self.userNameTextRight.constant = tempUserNameLabelRight;
//    self.userNameTextTop.constant = tempUserNameLabelTop;
//    
//    
//    CGFloat  tempPasswordLabelLeft = _passwordLabelLeft.constant;
//    CGFloat tempPasswordLabelRight = _passwordLabelRight.constant;
//    CGFloat tempPasswordLabelTop = _passwordLabelTop.constant;
//    
//    self.passwordLabelLeft.constant = _passwordTextLeft.constant;
//    self.passwordLabelRight.constant = _passwordTextRight.constant;
//    self.passwordLabelTop.constant = _passwordTextTop.constant;
//    
//    self.passwordTextLeft.constant = tempPasswordLabelLeft;
//    self.passwordTextRight.constant = tempPasswordLabelRight;
//    self.passwordTextTop.constant = tempPasswordLabelTop;
//    [self.view setNeedsDisplay];
    
  /*  [UIView animateWithDuration:5 delay:0.3 usingSpringWithDamping:0.2 initialSpringVelocity:10.5 options:<#(UIViewAnimationOptions)#>animations:^{
        self.userNameTextLeft.constant = 20;
        self.userNameTextRight.constant = 200;
        self.userNameLabelLeft.constant = 200;
        
    }];*/
    
    
    
    [UIView animateWithDuration:0.3 delay:10 usingSpringWithDamping:1 initialSpringVelocity:50 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.userNameTextLeft.constant = 20;
        self.userNameTextRight.constant = 200;
        self.userNameLabelLeft.constant = 200;
        
    }completion:0];
    
  


//    [UIView animateWithDuration:0.3 animations:^{
//        self.userNameTextLeft.constant = 20;
//        self.userNameTextRight.constant = 200;
//        
//        self.userNameLabelLeft.constant = 200;
//    }];
}
@end
