//
//  TSEDataSource.m
//  TiltSelectorExample
//
//  Created by Woudini on 3/18/15.
//  Copyright (c) 2015 Hi Range. All rights reserved.
//

#import "TSEDataSource.h"

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
        self.configureCellBlock = aConfigureCellBlock;
        self.numberOfRowsInSectionBlock = aNumberOfRowsInSectionBlock;
    }
    return self;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.numberOfRowsInSectionBlock(section);
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.configureCellBlock(indexPath);
}

@end
