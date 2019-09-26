//
//  ViewController.h
//  SampleObjective-C
//
//  Created by William Wall on 25/09/2019.
//  Copyright © 2019 William. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    // instantiate timer, bool for running or not and a counter.
    NSTimer *myTimer;
    BOOL running;
    int count;
}

//MARK: outlets
// timer label
@property (weak, nonatomic) IBOutlet UILabel *timerLabel;
// start button
@property (weak, nonatomic) IBOutlet UIButton *startBtn;
// reset button
@property (weak, nonatomic) IBOutlet UIButton *resetBtn;


//MARK: actions
// start button pushed
- (IBAction)startBtnPushed:(id)sender;
// reset button pushed
- (IBAction)resetBtnPushed:(id)sender;

//MARK: methods
//update timer method
- (void)updateTimer;

@end

