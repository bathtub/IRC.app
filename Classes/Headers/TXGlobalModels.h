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

/* Highest level objects implemented by IRC. */

IRC_EXTERN BOOL NSObjectIsEmpty(id obj);
IRC_EXTERN BOOL NSObjectIsNotEmpty(id obj);

IRC_EXTERN NSString *TXTLS(NSString *key); // IRC Language String
IRC_EXTERN NSString *TXTFLS(NSString *key, ...); // IRC Formatted Language String

IRC_EXTERN NSString *TSBLS(NSString *key, NSBundle *bundle); // IRC Secondary Bundle (aka plugin) Language String
IRC_EXTERN NSString *TSBFLS(NSString *key, NSBundle *bundle, ...); // IRC Secondary Bundle (aka plugin) Formatted Language String

IRC_EXTERN NSInteger TXRandomNumber(NSInteger maxset);

IRC_EXTERN NSString *TXFormattedTimestamp(NSDate *date, NSString *format);
IRC_EXTERN NSString *TXFormattedTimestampWithOverride(NSDate *date, NSString *format, NSString *override);

IRC_EXTERN NSString *TXReadableTime(NSInteger dateInterval);
IRC_EXTERN NSString *TXSpecialReadableTime(NSInteger dateInterval, BOOL shortValue, NSArray *orderMatrix);

IRC_EXTERN NSString *TXFormattedNumber(NSInteger number);

IRC_EXTERN NSComparator NSDefaultComparator;
