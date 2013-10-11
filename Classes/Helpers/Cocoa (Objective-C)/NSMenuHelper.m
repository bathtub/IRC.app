/* ********************************************************************* 

 Copyright (c) 2010 — 2013 Codeux Software & respective contributors.
        Contributors.rtfd and Acknowledgements.rtfd

 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions
 are met:

    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of the IRC Client & Codeux Software nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.

 THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND
 ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
 FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
 OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
 OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
 SUCH DAMAGE.

 *********************************************************************** */

#import "IRCApplication.h"

@implementation NSMenu (TXMenuHelper)
@end

@implementation NSMenuItem (TXMenuItemHelper)

+ (id)menuItemWithTitle:(NSString *)aString
						   target:(id)aTarget
						   action:(SEL)aSelector
{
	return [self menuItemWithTitle:aString target:aTarget action:aSelector keyEquivalent:NSStringEmptyPlaceholder keyEquivalentMask:0];
}

+ (id)menuItemWithTitle:(NSString *)aString
				 target:(id)aTarget
				 action:(SEL)aSelector
		  keyEquivalent:(NSString *)charCode
	  keyEquivalentMask:(NSUInteger)mask
{
	id menuItem = [[self alloc] initWithTitle:aString action:aSelector keyEquivalent:charCode];

	[menuItem setKeyEquivalentModifierMask:mask];
	[menuItem setTarget:aTarget];

	return menuItem;
}

@end

@implementation TXSpecialNSMenuItemHelper
@end
