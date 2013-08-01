//
//  RubyRunner.m
//  StandaloneRubyTest
//
//  Created by eralp on 8/1/13.
//  Copyright (c) 2013 SuperDamage. All rights reserved.
//

#import "RubyRunner.h"

@implementation RubyRunner

-(id)init{
    self = [super init];
    if(self){
        
    }
    return self;
}

-(void)run{
    [self launch];
}

- (void)launch {
    NSString *rubyPath = [[NSBundle mainBundle] pathForResource:@"miniruby" ofType:nil];
    NSString *wrapperPath = [[NSBundle mainBundle] pathForResource:@"wrapper" ofType:@"rb"];
    
    
    NSTask *task;
    task = [[NSTask alloc] init];
    [task setLaunchPath: rubyPath];
    
    NSArray *arguments;
    arguments = [NSArray arrayWithObjects: wrapperPath, nil];
    [task setArguments: arguments];
    
    NSPipe *pipe;
    pipe = [NSPipe pipe];
    [task setStandardOutput: pipe];
    
    
    [task setStandardError:pipe];

    
    NSFileHandle *file;
    file = [pipe fileHandleForReading];

    
    [task launch];
    
    NSData *data;
    data = [file readDataToEndOfFile];
    
    if(self.delegate!=nil){
        [self.delegate rubyRunner:self didReceiveOutput:[[NSString alloc] initWithData: data
                                                                              encoding: NSUTF8StringEncoding]];
        
    }
}


-(void)updateWrapperWithString:(NSTextView*)newWrapperCodeField{
    
    NSString *wrapperPath = [[NSBundle mainBundle] pathForResource:@"wrapper" ofType:@"rb"];
    
    NSArray * arrayOfLines = [[newWrapperCodeField string] componentsSeparatedByString:@"\n"];
    /*
    if([arrayOfLines count]<=1){
        arrayOfLines = [NSArray arrayWithObject:[newWrapperCodeField string]];
    }
    
        */
    
    [self writeToMultilineFile:wrapperPath arrayofLines:arrayOfLines];
    
}

- (void)writeToMultilineFile:(NSString*)filePath arrayofLines:(NSArray*)arrayOfLines{
    NSString * zStr = [[NSString alloc]init];
    NSInteger i;
    for (i = 0; i < [arrayOfLines count]; i++) {
        zStr = [zStr stringByAppendingFormat:@"%@\n",[arrayOfLines objectAtIndex:i]];
    }
    
    NSLog(@"zStr %@",zStr);
    
    NSError *error;
    
    [zStr writeToFile:filePath
           atomically:YES
             encoding:NSASCIIStringEncoding error:NULL];
    
    if(error){
        NSLog(@"update error : %@",error);
    }
}

@end
