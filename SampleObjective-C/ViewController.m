//
//  ViewController.m
//  SampleObjective-C
//
//  Created by William Wall on 25/09/2019.
//  Copyright © 2019 William. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

// essentially creates getters and setters for each varibale
@synthesize timerLabel, startBtn, resetBtn;

// load method
- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // set running to false on load
    running = NO;
    // set count to zero on load
    count = 0;
    // set timer label text to zero throughout
    timerLabel.text = @"00:00:00";
    // give the layout button a radius to view circular rather than the square in the storyboard
    startBtn.layer.cornerRadius = 45;
    // same as above button
    resetBtn.layer.cornerRadius = 45;
}

// start button method
- (IBAction)startBtnPushed:(id)sender {
    // if running is set to NO
    if(running == NO){
        // start running
        running = YES;
        // set the text of the button to STOP, UIControl is an update method
        [startBtn setTitle:@"STOP" forState:UIControlStateNormal];
        // if myTimer(from interface) is null,
        if(myTimer == nil){
            // hit update timer method
            myTimer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(updateTimer) userInfo:nil repeats:YES];
        }
    }else{
        // else hit the stop timer method
        [self stopTimer];
    }
}

// reset button method
- (IBAction)resetBtnPushed:(id)sender {
    // hit stop timer method
    [self stopTimer];
    // reset counter to zero
    count = 0;
    // set the label to all zeros
    timerLabel.text = @"00:00:00";
}

// stop timer method
- (void)stopTimer{
    // set running to false
    running = NO;
    // stops and invalidates the timer
    [myTimer invalidate];
    // set timer no null
    myTimer = nil;
    // change the button text to start after the stop is initiated
    [startBtn setTitle:@"START" forState:UIControlStateNormal];
    
}

// update timer method
- (void)updateTimer{
    // increment the counter
    count++;
    // set the minute variable
    int min = floor(count/100/60);
    // set the second variable
    int sec = floor(count/100);
    // set the miliseconds variable
    int mSec = count % 100;
    // if seconds are greater or equal to 60
    if(sec >= 60){
        // seconds is equal to seconds modulus
        sec %= 60;
    }
    // set the label to current time
    timerLabel.text = [NSString stringWithFormat:@"%02d:%02d:%02d", min, sec, mSec];
}
@end
