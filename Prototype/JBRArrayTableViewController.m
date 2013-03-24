//
//  JBRDictionaryTableViewController.m
//  Coerge
//
//  Created by John Rowe on 20/02/2013.
//  Copyright (c) 2013 Rumble Labs. All rights reserved.
//

#import "JBRArrayTableViewController.h"

@interface JBRArrayTableViewController ()

@end

@implementation JBRArrayTableViewController

- (NSArray *)itemsForSection:(NSInteger)section
{
  NSAssert(self.data != nil, @"self.data != nil in itemsForSection:");
  return self.data[section][@"Items"];
}


- (NSDictionary *)itemInfoForIndexPath:(NSIndexPath *)indexPath
{
  NSArray *items = [self itemsForSection:indexPath.section];
  
  if ((NSUInteger)indexPath.row >= [items count]) {
    return nil;
  }
  
  return items[indexPath.row];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
  NSAssert(self.data != nil, @"self.data != nil in numberOfSectionsInTableView:");
  return [self.data count];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  NSAssert(self.data != nil, @"self.data != nil in tableView:numberOfRowsInSection:");
  return [self.data[section][@"Items"] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  return [self tableView:tableView cellForRowAtIndexPath:indexPath withItemInfo:[self itemInfoForIndexPath:indexPath]];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath withItemInfo:(NSDictionary *)itemInfo
{
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:itemInfo[@"CellIdentifier"] forIndexPath:indexPath];
  cell.textLabel.text = itemInfo[@"Title"];
  if (itemInfo[@"Icon"] != nil) {
    cell.imageView.image = [UIImage imageNamed:itemInfo[@"Icon"]];
  }
  
  cell = [self modifyCell:cell forRowAtIndexPath:indexPath withItemInfo:itemInfo];
  
  NSAssert(cell != nil, @"cell != nil in tableView:cellForRowAtIndexPath:withItemInfo:");
  return cell;
}

- (UITableViewCell *)modifyCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath withItemInfo:(NSDictionary *)itemInfo
{
  return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  if (self.selectionMode == YES) {
    [[NSNotificationCenter defaultCenter] postNotificationName:JBRArrayTableViewControllerSelectedDictionary object:self userInfo:[self itemInfoForIndexPath:indexPath]];
    [self.navigationController popViewControllerAnimated:YES];
  }
}

@end
