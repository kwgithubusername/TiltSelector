//
//  TSESecondViewController.m
//  TiltSelectorExample
//
//  Created by Woudini on 3/18/15.
//  Copyright (c) 2015 Hi Range. All rights reserved.
//

#import "TSESecondViewController.h"
#import "TSEDataSource.h"
@interface TSESecondViewController ()

@property (nonatomic) TSEDataSource *dataSource;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation TSESecondViewController

- (void)setupDataSource
{
    __weak TSESecondViewController *weakSelf = self;
    
    UITableViewCell* (^configureCellBlock)(NSIndexPath *indexPath) = ^(NSIndexPath *indexPath) {
        UITableViewCell *tableViewCell = [weakSelf.tableView dequeueReusableCellWithIdentifier:@"subCell"];
        tableViewCell.textLabel.text = [[NSString alloc] initWithFormat:@"Selected %d, row %ld", self.selectedRow, (long)indexPath.row];
        return tableViewCell;
    };
    
    NSInteger (^numberOfRowsBlock)() = ^NSInteger() {
        return 20;
    };
    
    self.dataSource = [[TSEDataSource alloc] initWithConfigureCellBlock:configureCellBlock
                                             NumberOfRowsInSectionBlock:numberOfRowsBlock];
    self.tableView.dataSource = self.dataSource;
    self.tableView.delegate = self.dataSource;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupDataSource];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end