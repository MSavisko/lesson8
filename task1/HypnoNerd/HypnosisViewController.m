//
//  HypnosisViewController.m
//  HypnoNerd
//
//  Created by Maksym Savisko on 11/5/15.
//  Copyright © 2015 Maksym Savisko. All rights reserved.
//

#import "HypnosisViewController.h"
#import "HypnosisView.h"

@interface HypnosisViewController () <UITextFieldDelegate>
@end

@implementation HypnosisViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"HypnosisViewController loaded its view.");
}

- (instancetype) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.tabBarItem.title = @"Hypnotize";
        UIImage *i = [UIImage imageNamed:@"Hypno.png"];
        self.tabBarItem.image = i;
    }
    return self;
}



- (void) loadView {
    HypnosisView * backgroundView = [[HypnosisView alloc]init];
    self.view = backgroundView;
    
    //Add a TextField
    CGRect textFieldRect = CGRectMake(40, 70, 240, 30);
    UITextField *textField = [[UITextField alloc]initWithFrame:textFieldRect];
    
    //Set th border style (Устанавливаем границу стиля текстового поля).
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.placeholder = @"Hypnotize me";
    textField.returnKeyType = UIReturnKeyDone;
    
    //Warning
    textField.delegate = self;
    
    [backgroundView addSubview:textField];
    
    self.view = backgroundView;
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self drawHypnoticMessage:textField.text];
    
    textField.text = @"";
    [textField resignFirstResponder];
    return YES;
}

- (void) drawHypnoticMessage:(NSString *)message {
    for (int i=0; i < 20; i++) {
        UILabel * messageLabel = [[UILabel alloc]init];
        
        // Configure Label. color's and text
        messageLabel.backgroundColor = [UIColor clearColor];
        messageLabel.textColor = [UIColor grayColor];
        messageLabel.text = message;
        
        //Resize label for text in it
        [messageLabel sizeToFit];
        
        //Get a random position of x
        int width = (int)(self.view.bounds.size.width - messageLabel.bounds.size.width);
        int x = arc4random() % width;
        
        //Get a random position of x
        int height = (int)(self.view.bounds.size.height - messageLabel.bounds.size.height);
        int y = arc4random() % height;
        
        //Update label frame
        CGRect frame = messageLabel.frame;
        frame.origin = CGPointMake(x, y);
        messageLabel.frame = frame;
        
        //Add Label to Hierarchy
        [self.view addSubview:messageLabel];
        
        UIInterpolatingMotionEffect *mottionEffect = [[UIInterpolatingMotionEffect alloc]initWithKeyPath:@"center.x"
                                                                                                    type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
        mottionEffect.minimumRelativeValue = @(-25);
        mottionEffect.maximumRelativeValue = @(25);
        [messageLabel addMotionEffect:mottionEffect];
        
        mottionEffect = [[UIInterpolatingMotionEffect alloc]initWithKeyPath:@"center.y"
                                                                       type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
        mottionEffect.minimumRelativeValue = @(-25);
        mottionEffect.maximumRelativeValue = @(25);
        [messageLabel addMotionEffect:mottionEffect];
        
    }
}

@end
