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

@implementation IRCChannelConfig

@synthesize secretKey = _secretKey;
@synthesize encryptionKey = _encryptionKey;

- (id)init
{
	if ((self = [super init])) {
		self.itemUUID = [NSString stringWithUUID];

		self.type = IRCChannelNormalType;
		
		self.autoJoin			= YES;
        self.ignoreHighlights	= NO;
        self.ignoreInlineImages	= NO;
        self.ignoreJPQActivity	= NO;
		self.pushNotifications	= YES;
		self.showTreeBadgeCount = YES;

		self.defaultModes	= NSStringEmptyPlaceholder;
		self.defaultTopic	= NSStringEmptyPlaceholder;
		self.channelName	= NSStringEmptyPlaceholder;
	}
    
	return self;
}

- (void)dealloc
{
	if (self.type == IRCChannelPrivateMessageType) {
		[self destroyKeychains];
	}
}

#pragma mark -
#pragma mark Keychain Management

- (NSString *)encryptionKey
{
	NSString *kcPassword = NSStringEmptyPlaceholder;

	/* Only read from keychain if our value is nil. Let the set command
	 handle any changes to the actual property after that. */
	if (_encryptionKey == nil) {
		kcPassword = [AGKeychain getPasswordFromKeychainItem:@"IRC (Blowfish Encryption)"
												withItemKind:@"application password"
												 forUsername:nil
												 serviceName:[NSString stringWithFormat:@"irc.cblowfish.%@", self.itemUUID]];

		if (kcPassword) {
			if ([kcPassword isEqualToString:_encryptionKey] == NO) {
				_encryptionKey = nil;
				_encryptionKey = kcPassword;
			}
		}
	}

	return _encryptionKey;
}

- (NSString *)secretKey
{
	NSString *kcPassword = NSStringEmptyPlaceholder;

	if (_secretKey == nil) {
		kcPassword = [AGKeychain getPasswordFromKeychainItem:@"IRC (Channel JOIN Key)"
												withItemKind:@"application password"
												 forUsername:nil
												 serviceName:[NSString stringWithFormat:@"irc.cjoinkey.%@", self.itemUUID]];

		if (kcPassword) {
			if ([kcPassword isEqualToString:_secretKey] == NO) {
				_secretKey = nil;
				_secretKey = kcPassword;
			}
		}
	}

	return _secretKey;
}

- (void)setEncryptionKey:(NSString *)pass
{
	if ([_encryptionKey isEqualToString:pass] == NO) {
		if (NSObjectIsEmpty(pass)) {
			[AGKeychain deleteKeychainItem:@"IRC (Blowfish Encryption)"
							  withItemKind:@"application password"
							   forUsername:nil
							   serviceName:[NSString stringWithFormat:@"irc.cblowfish.%@", self.itemUUID]];
		} else {
			[AGKeychain modifyOrAddKeychainItem:@"IRC (Blowfish Encryption)"
								   withItemKind:@"application password"
									forUsername:nil
								withNewPassword:pass
									serviceName:[NSString stringWithFormat:@"irc.cblowfish.%@", self.itemUUID]];
		}

		_encryptionKey = nil;
		_encryptionKey = pass;
	}
}

- (void)setSecretKey:(NSString *)pass
{
	if ([_secretKey isEqualToString:pass] == NO) {
		if (NSObjectIsEmpty(pass)) {
			[AGKeychain deleteKeychainItem:@"IRC (Channel JOIN Key)"
							  withItemKind:@"application password"
							   forUsername:nil
							   serviceName:[NSString stringWithFormat:@"irc.cjoinkey.%@", self.itemUUID]];
		} else {
			[AGKeychain modifyOrAddKeychainItem:@"IRC (Channel JOIN Key)"
								   withItemKind:@"application password"
									forUsername:nil
								withNewPassword:pass
									serviceName:[NSString stringWithFormat:@"irc.cjoinkey.%@", self.itemUUID]];
		}

		_secretKey = nil;
		_secretKey = pass;
	}
}

- (void)destroyKeychains
{
	[AGKeychain deleteKeychainItem:@"IRC (Blowfish Encryption)"
					  withItemKind:@"application password"
					   forUsername:nil
					   serviceName:[NSString stringWithFormat:@"irc.cblowfish.%@", self.itemUUID]];
	
	[AGKeychain deleteKeychainItem:@"IRC (Channel JOIN Key)"
					  withItemKind:@"application password"
					   forUsername:nil
					   serviceName:[NSString stringWithFormat:@"irc.cjoinkey.%@", self.itemUUID]];
}

#pragma mark -
#pragma mark Channel Configuration

+ (NSDictionary *)seedDictionary:(NSString *)channelName
{
	if ([channelName isChannelName]) {
		return @{
			@"channelName" : channelName,
		};
	}

	return nil;
}

- (id)initWithDictionary:(NSDictionary *)dic
{
	if ((self = [self init])) {
		self.type			= (IRCChannelType)NSDictionaryIntegerKeyValueCompare(dic, @"channelType", self.type);

		self.itemUUID			= NSDictionaryObjectKeyValueCompare(dic, @"uniqueIdentifier", self.itemUUID);
		self.channelName		= NSDictionaryObjectKeyValueCompare(dic, @"channelName", self.channelName);

		self.autoJoin			= NSDictionaryBOOLKeyValueCompare(dic, @"joinOnConnect", self.autoJoin);
		self.ignoreHighlights	= NSDictionaryBOOLKeyValueCompare(dic, @"ignoreHighlights", self.ignoreHighlights);
		self.ignoreInlineImages	= NSDictionaryBOOLKeyValueCompare(dic, @"disableInlineMedia", self.ignoreInlineImages);
		self.ignoreJPQActivity	= NSDictionaryBOOLKeyValueCompare(dic, @"ignoreJPQActivity", self.ignoreJPQActivity);
		self.pushNotifications	= NSDictionaryBOOLKeyValueCompare(dic, @"enableNotifications", self.pushNotifications);
		self.showTreeBadgeCount = NSDictionaryBOOLKeyValueCompare(dic, @"enableTreeBadgeCountDrawing", self.showTreeBadgeCount);

		self.defaultModes		= NSDictionaryObjectKeyValueCompare(dic, @"defaultMode", self.defaultModes);
		self.defaultTopic		= NSDictionaryObjectKeyValueCompare(dic, @"defaultTopic", self.defaultTopic);

		// ---- // Migrate to keychain.

		NSString *oldEncKey = [dic stringForKey:@"encryptionKey"];
		NSString *oldJoinKey = [dic stringForKey:@"secretJoinKey"];

		if (NSObjectIsNotEmpty(oldEncKey)) {
			[self setEncryptionKey:oldEncKey];
		}

		if (NSObjectIsNotEmpty(oldJoinKey)) {
			[self setSecretKey:oldJoinKey];
		}
		
		return self;
	}
	
	return nil;
}

- (NSMutableDictionary *)dictionaryValue
{
	NSMutableDictionary *dic = [NSMutableDictionary dictionary];
	
	[dic setInteger:self.type forKey:@"channelType"];

	if (self.type == IRCChannelNormalType) {
		[dic setBool:self.autoJoin				forKey:@"joinOnConnect"];
		[dic setBool:self.pushNotifications		forKey:@"enableNotifications"];
		[dic setBool:self.ignoreHighlights		forKey:@"ignoreHighlights"];
		[dic setBool:self.ignoreInlineImages	forKey:@"disableInlineMedia"];
		[dic setBool:self.ignoreJPQActivity		forKey:@"ignoreJPQActivity"];
		[dic setBool:self.showTreeBadgeCount	forKey:@"enableTreeBadgeCountDrawing"];
	}

	[dic safeSetObject:self.itemUUID			forKey:@"uniqueIdentifier"];
	[dic safeSetObject:self.channelName			forKey:@"channelName"];

	if (self.type == IRCChannelNormalType) {
		[dic safeSetObject:self.defaultModes		forKey:@"defaultMode"];
		[dic safeSetObject:self.defaultTopic		forKey:@"defaultTopic"];
	}
	
	return [dic sortedDictionary];
}

- (id)mutableCopyWithZone:(NSZone *)zone
{
	return [[IRCChannelConfig allocWithZone:zone] initWithDictionary:[self dictionaryValue]];
}

@end
