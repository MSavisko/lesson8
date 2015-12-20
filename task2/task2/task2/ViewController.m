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
@property (nonatomic, strong) NSMutableAttributedString *content;
@property (nonatomic, getter = isClear) BOOL clear;

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self initNewParahraph];
    self.paragraphLabel.attributedText = self.content;
    //[self.paragraphLabel sizeToFit];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

//Init New Paragraph
- (void)initNewParahraph {
    NSString * l1 = @"Paragraph \n";
    self.content = [[NSMutableAttributedString alloc]initWithString:l1
                                                         attributes:@{NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue" size:17],NSForegroundColorAttributeName: [UIColor colorWithRed:0.251 green:0.000 blue:0.502 alpha:1]}];
    self.clear = NO;
}

//Add New Paragraph
- (void)addNewParagraph {
    if (self.clear == YES) {
        [self initNewParahraph];
    }
    
    else {
    NSString * l2 = @"Paragraph\n";
    NSMutableAttributedString * content2 = [[NSMutableAttributedString alloc]initWithString:l2
                                                                                 attributes:@{NSFontAttributeName: [UIFont fontWithName:[self randomFonts] size:[self randomSize]],NSForegroundColorAttributeName: [self randomColor]}];
    [self.content appendAttributedString:content2];
    self.clear = NO;
    }
    self.paragraphLabel.attributedText = self.content;
    //[self.paragraphLabel sizeToFit];
}

//Random Font
- (NSString *) randomFonts {
    NSArray *array = [[NSArray  alloc]initWithArray:[UIFont familyNames]];
    return [array objectAtIndex:arc4random() % [array count]];
}

//Random Font Size
- (int) randomSize {
    int number = arc4random_uniform(36) + 8;
    return number;
}

//Random Color
- (UIColor *) randomColor {
    CGFloat hue = ( arc4random() % 256 / 256.0 );
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;
    UIColor *color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
    return color;
}

//Clear Button
- (IBAction)clearAction:(id)sender {
    if (self) {
        self.content = nil;
        self.paragraphLabel.attributedText = self.content;
    }
    self.clear = YES;
}

//Add Button
- (IBAction)addAction:(id)sender {
    //Add method, that add a new paragraph
    [self addNewParagraph];
}

@end
