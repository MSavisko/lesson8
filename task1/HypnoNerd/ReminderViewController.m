//
//  ReminderViewController.m
//  HypnoNerd
//
//  Created by Maksym Savisko on 11/5/15.
//  Copyright © 2015 Maksym Savisko. All rights reserved.
//

#import "ReminderViewController.h"
#import <Foundation/Foundation.h>

@implementation ReminderViewController

- (void) viewDidLoad {
    [super viewDidLoad];
    NSLog(@"ReminderViewController loaded its view.");
}

- (void) viewWillAppear:(BOOL)animated  {
    [super viewWillAppear:animated];
    self.datePicker.minimumDate = [NSDate dateWithTimeIntervalSinceNow:60];
    
}

- (IBAction)addReminder:(id)sender {
    NSDate *date = self.datePicker.date;
    NSLog(@"Setting a remainder for %@", date);
    
    UILocalNotification *note = [[UILocalNotification alloc]init];
    note.alertBody = @"Hypnotize me!";
    note.fireDate = date;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:note];
}

- (id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        UITabBarItem *tbi = self.tabBarItem;
        tbi.title = @"Reminder";
        UIImage *i = [UIImage imageNamed:@"Time.png"];
        tbi.image = i;
    }
    return self;
}

@end
