// Created by Allan Odgaard.

#import "IRCApplication.h"

@interface TVCWebViewAutoScroll : NSObject
@property (nonatomic, assign) NSRect lastFrame;
@property (nonatomic, assign) NSRect lastVisibleRect;
@property (nonatomic, nweak) WebFrameView *webFrame;
@end
