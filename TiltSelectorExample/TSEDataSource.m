//
//  TSEDataSource.m
//  TiltSelectorExample
//
//  Created by Woudini on 3/18/15.
//  Copyright (c) 2015 Hi Range. All rights reserved.
//

#import "TSEDataSource.h"
#define RAPFinalRowLoadedNotification @"RAPFinalRowLoadedNotification"
@interface TSEDataSource ()

@property (nonatomic, copy) ConfigureCellBlock configureCellBlock;
@property (nonatomic, copy) NumberOfRowsInSectionBlock numberOfRowsInSectionBlock;

@end

@implementation TSEDataSource

-(id)initWithConfigureCellBlock:(ConfigureCellBlock)aConfigureCellBlock
     NumberOfRowsInSectionBlock:(NumberOfRowsInSectionBlock)aNumberOfRowsInSectionBlock
{
    self = [super init];
    if (self)
    {
        self.configureCellBlock = [aConfigureCellBlock copy];
        self.numberOfRowsInSectionBlock = [aNumberOfRowsInSectionBlock copy];
    }
    return self;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.numberOfRowsInSectionBlock();
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.configureCellBlock(indexPath);
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // If the last row is loaded, notify the tiltToScrollVC to count how many cells are currently visible
    if (indexPath.row == (int)self.numberOfRowsInSectionBlock()-1)
    {
        [[NSNotificationCenter defaultCenter] postNotificationName:RAPFinalRowLoadedNotification object:nil];
    }
}

@end
