/* ********************************************************************* 

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

typedef enum IRCAddressBookEntryType : NSInteger {
	IRCAddressBookIgnoreEntryType,
	IRCAddressBookUserTrackingEntryType
} IRCAddressBookEntryType;

@interface IRCAddressBook : NSObject <NSMutableCopying>
@property (nonatomic, assign) IRCAddressBookEntryType entryType;
@property (nonatomic, strong) NSString *itemUUID; // Unique Identifier (UUID)
@property (nonatomic, strong) NSString *hostmask;
@property (nonatomic, strong) NSString *hostmaskRegex;
@property (nonatomic, assign) BOOL ignoreCTCP;
@property (nonatomic, assign) BOOL ignoreJPQE;
@property (nonatomic, assign) BOOL ignoreNotices;
@property (nonatomic, assign) BOOL ignorePrivateHighlights;
@property (nonatomic, assign) BOOL ignorePrivateMessages;
@property (nonatomic, assign) BOOL ignorePublicHighlights;
@property (nonatomic, assign) BOOL ignorePublicMessages;
@property (nonatomic, assign) BOOL hideMessagesContainingMatch;
@property (nonatomic, assign) BOOL hideInMemberList;
@property (nonatomic, assign) BOOL notifyJoins;

- (id)initWithDictionary:(NSDictionary *)dic;
- (NSDictionary *)dictionaryValue;

- (NSString *)trackingNickname;

- (BOOL)checkIgnore:(NSString *)thehost;
@end
