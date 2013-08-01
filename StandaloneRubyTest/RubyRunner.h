//
//  RubyRunner.h
//  StandaloneRubyTest
//
//  Created by eralp on 8/1/13.
//  Copyright (c) 2013 SuperDamage. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RubyRunnerDelegate <NSObject>
@required
-(void)rubyRunner:(NSObject*)rubyRunner didReceiveOutput:(NSString*)output;
@end

@interface RubyRunner : NSObject
@property NSObject<RubyRunnerDelegate> *delegate;

-(void)run;
-(void)updateWrapperWithString:(NSTextView*)newWrapperCodeField;
@end
