//
//  ViewController.m
//  task2
//
//  Created by Anton Lookin on 12/16/15.
//  Copyright © 2015 geekub. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *paragraphLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (void)addNewParagraph {
    if ([self.paragraphLabel.text  isEqual: @""]) {
        self.paragraphLabel.text = @"\n New Paragraph";
    }
    else {
        self.paragraphLabel.text = @"\n Paragraph";
    }
    [self.paragraphLabel sizeToFit];
}

//Clear Button
- (IBAction)clearAction:(id)sender {
    if (self) {
        self.paragraphLabel.text = @"";
    }
}

//Add Button
- (IBAction)addAction:(id)sender {
    //Add method, that add a new paragraph
    [self addNewParagraph];
}

@end
