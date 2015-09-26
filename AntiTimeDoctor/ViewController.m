//
//  ViewController.m
//  AntiTimeDoctor
//
//  Created by Hamdy on 9/26/15.
//  Copyright (c) 2015 Hamdy. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // make the app not visable
    //http://www.raywenderlich.com/98178/os-x-tutorial-menus-popovers-menu-bar-apps
    
    // Do any additional setup after loading the view.
    
    [NSTimer scheduledTimerWithTimeInterval:1
                                     target:self
                                   selector:@selector(changeMouseCursorPosition)
                                   userInfo:nil
                                    repeats:YES];
 
    

}
-(void)changeMouseCursorPosition{
    
    //move mosue Cursor
    
    NSRect e = [[NSScreen mainScreen] frame];
    int H = (int)e.size.height;
    int W = (int)e.size.width;
    
    int x = [self getRandomNumberBetween:0 to:W];
    int y = [self getRandomNumberBetween:0 to:H];

    NSPoint mouseWarpLocation = NSMakePoint(x, y);
    
    CGEventSourceRef evsrc = CGEventSourceCreate(kCGEventSourceStateCombinedSessionState);
    CGEventSourceSetLocalEventsSuppressionInterval(evsrc, 0.0);
    CGAssociateMouseAndMouseCursorPosition (0);
    CGWarpMouseCursorPosition(mouseWarpLocation);
    CGAssociateMouseAndMouseCursorPosition (1);
    
    
    //for more keys check this http://web.archive.org/web/20100501161453/http://www.classicteck.com/rbarticles/mackeyboard.php
    
    
    
    // https://developer.apple.com/library/mac/documentation/Carbon/Reference/QuartzEventServicesRef/index.html#//apple_ref/c/func/CGEventCreateKeyboardEvent
    
//    http://stackoverflow.com/questions/2666154/cocoa-virtual-keystrokes-pain
    CGEventRef event1, event2, event3, event4;
    event1 = CGEventCreateKeyboardEvent (NULL, (CGKeyCode)126, true);
    event2 = CGEventCreateKeyboardEvent (NULL, (CGKeyCode)126, false);
    event3 = CGEventCreateKeyboardEvent (NULL, (CGKeyCode)125, false);
    event4 = CGEventCreateKeyboardEvent (NULL, (CGKeyCode)125, false);
    CGEventPost(kCGHIDEventTap, event1);
    CGEventPost(kCGHIDEventTap, event2);
    
    
    
//    CGEventPost(kCGHIDEventTap, event3);
//    CGEventPost(kCGHIDEventTap, event4);

}
-(int)getRandomNumberBetween:(int)from to:(int)to {
    
    return (int)from + arc4random() % (to-from+1);
}
- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

@end
