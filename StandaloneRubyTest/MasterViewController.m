//
//  MasterViewController.m
//  StandaloneRubyTest
//
//  Created by eralp on 8/1/13.
//  Copyright (c) 2013 SuperDamage. All rights reserved.
//

#import "MasterViewController.h"


@interface MasterViewController (){
    RubyRunner *ruby;
}
@property (strong) IBOutlet NSTextView *codeTextField;
@property (strong) IBOutlet NSTextView *resultTextField;
@end

@implementation MasterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        ruby = [[RubyRunner alloc] init];
        ruby.delegate = self;
        

    }
    
    return self;
}

-(void)loadView{
    [super loadView];
    
    [self.codeTextField setFont:[NSFont fontWithName:@"Andale Mono" size:12]];
    [self.codeTextField setTextColor:[NSColor greenColor]];
    
    [self.resultTextField setFont:[NSFont fontWithName:@"Andale Mono" size:12]];
    [self.resultTextField setTextColor:[NSColor greenColor]];
    [self.resultTextField setBackgroundColor:[NSColor blackColor]];
    
}



- (IBAction)runRubyButtonClicked:(id)sender {
    
    [ruby updateWrapperWithString:self.codeTextField];
    
    [ruby run];
    
    
}

-(void)rubyRunner:(NSObject *)rubyRunner didReceiveOutput:(NSString *)output{
    
    [self.resultTextField setString:output];
    
}




@end
