//
//  TSEDataSource.h
//  TiltSelectorExample
//
//  Created by Woudini on 3/18/15.
//  Copyright (c) 2015 Hi Range. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

typedef UITableViewCell* (^ConfigureCellBlock)(id indexPath);
typedef NSInteger (^NumberOfRowsInSectionBlock)(NSInteger section);

@interface TSEDataSource : NSObject <UITableViewDataSource, UITableViewDelegate>

-(id)initWithConfigureCellBlock:(ConfigureCellBlock)aConfigureCellBlock
     NumberOfRowsInSectionBlock:(NumberOfRowsInSectionBlock)aNumberOfRowsInSectionBlock;

@end
