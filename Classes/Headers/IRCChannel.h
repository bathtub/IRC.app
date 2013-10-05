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

#import "IRCTreeItem.h" // superclass

typedef enum IRCChannelStatus : NSInteger {
	IRCChannelParted,
	IRCChannelJoining,
	IRCChannelJoined,
	IRCChannelTerminated,
} IRCChannelStatus;

@interface IRCChannel : IRCTreeItem <NSOutlineViewDataSource, NSOutlineViewDelegate>
@property (nonatomic, nweak) NSString *name;
@property (nonatomic, strong) NSString *topic;
@property (nonatomic, strong) TLOFileLogger *logFile;
@property (nonatomic, strong) IRCChannelMode *modeInfo;
@property (nonatomic, strong) IRCChannelConfig *config;
@property (nonatomic, assign) IRCChannelStatus status;
@property (nonatomic, assign) BOOL errorOnLastJoinAttempt;
@property (nonatomic, assign) BOOL inUserInvokedModeRequest;
@property (nonatomic, assign) NSInteger channelJoinTime;

@property (strong) NSArray *memberList;
@property (strong) NSArray *memberListLengthSorted; // Sorted member list based on nickname length. Used by conversation tracking.

- (void)setup:(IRCChannelConfig *)seed;
- (void)updateConfig:(IRCChannelConfig *)seed;
- (NSMutableDictionary *)dictionaryValue;

- (NSString *)secretKey;

- (BOOL)isChannel;
- (BOOL)isPrivateMessage;

- (NSString *)channelTypeString;

- (void)terminate;
- (void)preferencesChanged;

- (void)activate;
- (void)deactivate;

- (void)writeToLogFile:(TVCLogLine *)line;

- (void)print:(TVCLogLine *)logLine;
- (void)print:(TVCLogLine *)logLine completionBlock:(void(^)(BOOL highlighted))completionBlock;

- (void)addMember:(IRCUser *)user;
- (void)removeMember:(NSString *)nick;

/* performOnChange blocks allow us to relaod interface elements for the user that the changes happened to without reloading the entire list. */
- (void)changeMember:(NSString *)nick mode:(NSString *)mode value:(BOOL)value performOnChange:(void (^)(IRCUser *user))block; // -changeMember:value:performOnChange: is used for mode changs.
- (void)renameMember:(NSString *)fromNick to:(NSString *)toNick performOnChange:(void (^)(IRCUser *user))block; // -renameMember:to:performOnChange: is used for nickname changes.

- (void)clearMembers;

- (IRCUser *)memberAtIndex:(NSInteger)index;

- (IRCUser *)findMember:(NSString *)nick;
- (IRCUser *)findMember:(NSString *)nick options:(NSStringCompareOptions)mask;

- (NSInteger)numberOfMembers;

/* For redrawing the member cells in table view. */
- (BOOL)memberRequiresRedraw:(IRCUser *)user1 comparedTo:(IRCUser *)user2;

- (void)migrateUser:(IRCUser *)user1 from:(IRCUser *)user2;

- (void)updateAllMembersOnTableView;
- (void)updateMemberOnTableView:(IRCUser *)user;

- (void)reloadDataForTableView;
- (void)reloadDataForTableViewBySortingMembers;
- (void)reloadDataForTableViewBySortingMembersForUser:(IRCUser *)user;

- (void)updateTableViewByRemovingIgnoredUsers;
@end
