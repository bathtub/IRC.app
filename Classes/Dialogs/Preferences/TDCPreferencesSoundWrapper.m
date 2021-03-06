/* ********************************************************************* 

 Copyright (c) 2008 - 2010 Satoshi Nakagawa <psychs AT limechat DOT net>
 Copyright (c) 2010 — 2013 Codeux Software & respective contributors.
        Please see Contributors.rtfd and Acknowledgements.rtfd

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

@implementation TDCPreferencesSoundWrapper

- (id)initWithEventType:(TXNotificationType)aEventType
{
	if ((self = [super init])) {
		self.eventType = aEventType;
		
		return self;
	}

	return nil;
}

+ (TDCPreferencesSoundWrapper *)soundWrapperWithEventType:(TXNotificationType)eventType
{
	return [[TDCPreferencesSoundWrapper alloc] initWithEventType:eventType];
}

- (NSString *)displayName
{
	return [TPCPreferences titleForEvent:self.eventType];
}

- (NSString *)alertSound
{
	NSString *soundd = [TPCPreferences soundForEvent:self.eventType];

	NSObjectIsEmptyAssertReturn(soundd, TXEmptySoundAlertLabel);

	return soundd;
}

- (void)setAlertSound:(NSString *)value
{
	if ([value isEqualToString:TXEmptySoundAlertLabel]) {
		value = TXEmptySoundAlertPreference;
	}
	
	if (NSObjectIsNotEmpty(value)) {
		[TLOSoundPlayer play:value];
	}
	
	[TPCPreferences setSound:value forEvent:self.eventType];
}

- (BOOL)pushNotification
{
	return [TPCPreferences growlEnabledForEvent:self.eventType];
}

- (void)setPushNotification:(BOOL)value
{
	[TPCPreferences setGrowlEnabled:value forEvent:self.eventType];
}

- (BOOL)speakEvent
{
	return [TPCPreferences speakEvent:self.eventType];
}

- (void)setSpeakEvent:(BOOL)value
{
	[TPCPreferences setEventIsSpoken:value forEvent:self.eventType];
}

- (BOOL)disabledWhileAway
{
	return [TPCPreferences disabledWhileAwayForEvent:self.eventType];
}

- (void)setDisabledWhileAway:(BOOL)value
{
	[TPCPreferences setDisabledWhileAway:value forEvent:self.eventType];
}

- (BOOL)bounceDockIcon
{
    return [TPCPreferences bounceDockIconForEvent:self.eventType];
}


- (void)setBounceDockIcon:(BOOL)value
{
    [TPCPreferences setBounceDockIcon:value forEvent:self.eventType];
}
@end
