//
//  JBRDictionaryTableViewController.h
//  Coerge
//
//  Created by John Rowe on 20/02/2013.
//  Copyright (c) 2013 Rumble Labs. All rights reserved.
//

#import <UIKit/UIKit.h>

#define JBRArrayTableViewControllerSelectedDictionary @"JBRArrayTableViewControllerSelectedDictionary"

@interface JBRArrayTableViewController : UITableViewController

/**
 * Denotes this table is in item selection mode. This changes it's behavior:
 *  1. Details view isn't available (if it was);
 *  2. When you select a item, it sends the JBRSelectedDetailItem event.
 */
@property BOOL selectionMode;

/**
 * Array of data to display. This is required to follow the following layout (at minimum):
 *  - Array of sections
 *    - Array of items
 *     - Dictionary containing attributes: Title, CellType
 */
@property NSArray *data;

/**
 * Returns item info dictionary for index path or nil if none can be found.
 */
- (NSDictionary *)itemInfoForIndexPath:(NSIndexPath *)indexPath;

/**
 * Returns the list of items for a section.
 */
- (NSArray *)itemsForSection:(NSInteger)section;

/**
 * Override if you want to change the cell creation. Most of the time this class and
 * dictionary will do a great job so you probalby want to override:
 *  modifyCell:forRowAtIndexPath:withItemInfo:
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath withItemInfo:(NSDictionary *)itemInfo;

/**
 * Override if you're happy with default creation and just want a chance to modify the cell afterwards.
 * 
 * Default implementation simply returns the cell unmodifed.
 */
- (UITableViewCell *)modifyCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath withItemInfo:(NSDictionary *)itemInfo;

@end
