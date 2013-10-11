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

@interface IRCWorld : NSObject <NSOutlineViewDataSource, NSOutlineViewDelegate>
@property (nonatomic, assign) NSInteger messagesSent;
@property (nonatomic, assign) NSInteger messagesReceived;
@property (nonatomic, assign) TXFSLongInt bandwidthIn;
@property (nonatomic, assign) TXFSLongInt bandwidthOut;
@property (nonatomic, strong) NSMutableArray *clients;
@property (nonatomic, assign) BOOL isSoundMuted;
@property (nonatomic, assign) BOOL isPopulatingSeeds;
@property (nonatomic, assign) BOOL areNotificationsDisabled;
@property (nonatomic, strong) IRCTreeItem *selectedItem;
@property (nonatomic, strong) NSString *previousSelectedClientId;
@property (nonatomic, strong) NSString *previousSelectedChannelId;
@property (nonatomic, strong) NSDateFormatter *isoStandardDateFormatter; // ISO standard date formatter used for internal purposes. (yyyy-MM-dd'T'HH:mm:ss.SSS'Z')

- (void)setupConfiguration;
- (void)setupOtherServices;
- (void)setupTree;
- (void)save;

- (NSMutableDictionary *)dictionaryValue;

- (void)terminate;

- (void)autoConnectAfterWakeup:(BOOL)afterWakeUp;
- (void)prepareForSleep;

- (void)prepareForScreenSleep;
- (void)awakeFomScreenSleep;

- (IRCClient *)findClientById:(NSString *)uid;
- (IRCChannel *)findChannelByClientId:(NSString *)uid channelId:(NSString *)cid;

- (IRCTreeItem *)findItemFromInfo:(NSString *)s;

- (void)select:(id)item;
- (void)selectPreviousItem;

- (IRCClient *)selectedClient;
- (IRCChannel *)selectedChannel;
- (IRCChannel *)selectedChannelOn:(IRCClient *)c;
- (TVCLogController *)selectedViewController;

- (IRCTreeItem *)previouslySelectedItem;

- (void)inputText:(id)str command:(NSString *)command;

- (void)markAllAsRead;
- (void)markAllAsRead:(IRCClient *)limitedClient;

- (void)markAllScrollbacks;

- (void)updateIcon;

- (void)updateTitle;
- (void)updateTitleFor:(IRCTreeItem *)item;

- (void)reloadTree;
- (void)reloadTreeItem:(IRCTreeItem *)item;
- (void)reloadTreeGroup:(IRCTreeItem *)item;

- (void)adjustSelection;

- (void)expandClient:(IRCClient *)client;

- (void)addHighlightInChannel:(IRCChannel *)channel withLogLine:(TVCLogLine *)logLine;

- (void)reloadTheme;
- (void)preferencesChanged;

- (void)changeTextSize:(BOOL)bigger;
- (NSInteger)textSizeMultiplier;

- (IRCClient *)createClient:(id)seed reload:(BOOL)reload;
- (IRCChannel *)createChannel:(IRCChannelConfig *)seed client:(IRCClient *)client reload:(BOOL)reload adjust:(BOOL)adjust;
- (IRCChannel *)createPrivateMessage:(NSString *)nick client:(IRCClient *)client;

- (TVCLogController *)createLogWithClient:(IRCClient *)client channel:(IRCChannel *)channel;

- (void)destroyClient:(IRCClient *)client;
- (void)destroyChannel:(IRCChannel *)c;
- (void)destroyChannel:(IRCChannel *)c part:(BOOL)forcePart;

- (void)executeScriptCommandOnAllViews:(NSString *)command arguments:(NSArray *)args; // Defaults to onQueue YES
- (void)executeScriptCommandOnAllViews:(NSString *)command arguments:(NSArray *)args onQueue:(BOOL)onQueue;

- (void)logKeyDown:(NSEvent *)e;
- (void)logDoubleClick:(NSString *)s;

- (void)clearContentsOfClient:(IRCClient *)u;
- (void)clearContentsOfChannel:(IRCChannel *)c inClient:(IRCClient *)u;

- (void)destroyAllEvidence;
@end
