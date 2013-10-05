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

#define NSDictionaryObjectKeyValueCompare(o,n,s)			   (id)(([o containsKey:n]) ? [o objectForKey:n]  : s) 
#define NSDictionaryIntegerKeyValueCompare(o,n,s)		(NSInteger)(([o containsKey:n]) ? [o integerForKey:n] : s)
#define NSDictionaryBOOLKeyValueCompare(o,n,s)               (BOOL)(([o containsKey:n]) ? [o boolForKey:n]    : s)
#define NSDictionaryFloatKeyValueCompare(o,n,s)				(float)(([o containsKey:n]) ? [o floatForKey:n]   : s)
#define NSDictionaryDoubleKeyValueCompare(o,n,s)		   (double)(([o containsKey:n]) ? [o doubleForKey:n]  : s)

@interface NSDictionary (TXDictionaryHelper)
- (NSString *)stringForKey:(NSString *)key;

- (BOOL)boolForKey:(NSString *)key;
- (NSArray *)arrayForKey:(NSString *)key;
- (NSDictionary *)dictionaryForKey:(NSString *)key;
- (NSInteger)integerForKey:(NSString *)key;
- (long long)longLongForKey:(NSString *)key;
- (double)doubleForKey:(NSString *)key;
- (float)floatForKey:(NSString *)key;
- (void *)pointerForKey:(NSString *)key;

- (NSString *)firstKeyForObject:(id)object;

- (BOOL)containsKey:(NSString *)baseKey;
- (BOOL)containsKeyIgnoringCase:(NSString *)baseKey;

- (NSString *)keyIgnoringCase:(NSString *)baseKey;

- (id)sortedDictionary;
- (id)sortedReversedDictionary;

- (NSArray *)sortedDictionaryKeys;
- (NSArray *)sortedDictionaryReversedKeys;
@end

@interface NSMutableDictionary (TXMutableDictionaryHelper)
- (void)safeSetObject:(id)value forKey:(NSString *)key;
- (void)safeSetObjectWithoutOverride:(id)value forKey:(NSString *)key;

- (void)setBool:(BOOL)value forKey:(NSString *)key;
- (void)setInteger:(NSInteger)value forKey:(NSString *)key;
- (void)setLongLong:(long long)value forKey:(NSString *)key;
- (void)setDouble:(double)value forKey:(NSString *)key;
- (void)setFloat:(float)value forKey:(NSString *)key;
- (void)setPointer:(void *)value forKey:(NSString *)key;
@end
