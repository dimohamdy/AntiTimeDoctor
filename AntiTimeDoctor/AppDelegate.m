//
//  AppDelegate.m
//  AntiTimeDoctor
//
//  Created by Hamdy on 9/26/15.
//  Copyright (c) 2015 Hamdy. All rights reserved.
//

#import "AppDelegate.h"
#import "DDHotKeyCenter.h"
#import <Carbon/Carbon.h>
@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    DDHotKeyCenter *c = [DDHotKeyCenter sharedHotKeyCenter];
    
    //To close App Command+V
    
    if (![c registerHotKeyWithKeyCode:kVK_ANSI_V modifierFlags:NSCommandKeyMask target:self action:@selector(hotkeyWithEvent:) object:nil]) {
        [self addOutput:@"Unable to register hotkey for example 1"];
    } else {
        [self addOutput:@"Registered hotkey for example 1"];
        [self addOutput:[NSString stringWithFormat:@"Registered: %@", [c registeredHotKeys]]];
    }

}
- (void) addOutput:(NSString *)newOutput {
    
    NSLog(@"%@",newOutput);
}

- (void) hotkeyWithEvent:(NSEvent *)hkEvent {
    [self addOutput:[NSString stringWithFormat:@"Firing -[%@ %@]", NSStringFromClass([self class]), NSStringFromSelector(_cmd)]];
    [self addOutput:[NSString stringWithFormat:@"Hotkey event: %@", hkEvent]];
    
    exit(0);

}

- (void) hotkeyWithEvent:(NSEvent *)hkEvent object:(id)anObject {
    [self addOutput:[NSString stringWithFormat:@"Firing -[%@ %@]", NSStringFromClass([self class]), NSStringFromSelector(_cmd)]];
    [self addOutput:[NSString stringWithFormat:@"Hotkey event: %@", hkEvent]];
    [self addOutput:[NSString stringWithFormat:@"Object: %@", anObject]];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
