//
//  JBRRoweViewController.m
//  Prototype
//
//  Created by John Rowe on 14/04/2013.
//  Copyright (c) 2013 John Rowe. All rights reserved.
//

#import "JBRRoweViewController.h"

@interface JBRRoweViewController ()

@end

@implementation JBRRoweViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
	
  self.data = [[NSUserDefaults standardUserDefaults] valueForKeyPath:@"Rowe.ListLayout"];
}

@end
