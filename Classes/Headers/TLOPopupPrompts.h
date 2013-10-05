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

#define TXPopupPromptSuppressionPrefix					@"Text Input Prompt Suppression -> "

/* TXPopupPromptSpecialSuppressionTextValue tells the dialog to force suppression on
 the dialog using the given key as soon as it closes instead of actually asking the user. 
 
 When using this, it is the job of the caller to validate the suppression value. The alert
 will always return YES for suppressed alerts so make sure that is the value you want. */
#define TXPopupPromptSpecialSuppressionTextValue		@"<TXPopupPromptSpecialSuppressionTextValue>"	

typedef enum TLOPopupPromptReturnType : NSInteger {
	TLOPopupPromptReturnPrimaryType,
	TLOPopupPromptReturnSecondaryType,
	TLOPopupPromptReturnOtherType,
} TLOPopupPromptReturnType;

@interface TLOPopupPrompts : NSObject
/* Return the actual suppression key used internally. Do not feed this to
 the suppressionKey: field of these alerts. This is what is fed to that field
 turns into once the alert is processed. */
+ (NSString *)suppressionKeyWithBase:(NSString *)base;

/* Alerts. */
+ (void)popupPromptNilSelector:(TLOPopupPromptReturnType)returnCode;

+ (BOOL)dialogWindowWithQuestion:(NSString *)bodyText
						   title:(NSString *)titleText
				   defaultButton:(NSString *)buttonDefault
				 alternateButton:(NSString *)buttonAlternate
				  suppressionKey:(NSString *)suppressKey
				 suppressionText:(NSString *)suppressText;

- (void)sheetWindowWithQuestion:(NSWindow *)window
						 target:(id)targetClass
						 action:(SEL)actionSelector
						   body:(NSString *)bodyText
						  title:(NSString *)titleText
				  defaultButton:(NSString *)buttonDefault
				alternateButton:(NSString *)buttonAlternate
					otherButton:(NSString *)otherButton
				 suppressionKey:(NSString *)suppressKey
				suppressionText:(NSString *)suppressText;
@end
