//
//  JBRWelcomeListController.m
//  Prototype
//
//  Created by John Rowe on 24/03/2013.
//  Copyright (c) 2013 John Rowe. All rights reserved.
//

#import "JBRWelcomeListController.h"

@interface JBRWelcomeListController ()

@end

@implementation JBRWelcomeListController

- (void)viewDidLoad
{
  [super viewDidLoad];
	
  self.data = [[NSUserDefaults standardUserDefaults] valueForKeyPath:@"Welcome.List.Layout"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
